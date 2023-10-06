##############################################################
# Function: Create floorplan in ICC2
# Created by Juan Aguilera
# Reference: https://github.com/abdelazeem201/ORCA
##############################################################
source 00_initial_settings.tcl

#------------------------------------------
#  Variables
# -----------------------------------------
set current_step "02_icc2_floorplan"
set before_step  "01_icc2_import"

#------------------------------------------
#  Open database
# -----------------------------------------
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib

#------------------------------------------
#  Get blocks --all
# -----------------------------------------
open_block ${design}

#------------------------------------------
#  Initialize tool
# -----------------------------------------
source initialization_settings.tcl

#------------------------------------------
#  Create scenarios
# -----------------------------------------
set scenarios_list $default_scenarios
source scenarios_setup.tcl

#------------------------------------------
#  Floorplan
# -----------------------------------------
#initialize_floorplan -boundary {{0 0} {999.856 999.856}} -core_offset {0 2}
initialize_floorplan -core_offset {0 2} -core_utilization 0.7

#------------------------------------------
# place ports
# -----------------------------------------
if { [get_terminals * -quiet] != "" } { remove_terminals * }
remove_individual_pin_constraints
set input_ports [get_ports -filter direction==in]
set_individual_pin_constraints -ports $input_ports -allowed_layers [get_layers {M5 M7}] -side 1 -offset {400 500}

set output_ports [get_ports -filter direction==out]
set_individual_pin_constraints -ports $output_ports -allowed_layers [get_layers {M5 M7}] -side 3 -offset {500 600}
place_pins -self -ports [get_ports *]
# -----------------------------------------
### create voltage areas
# -----------------------------------------
#create_voltage_area -power_domains PD_RISC_CORE -guard_band {{10.032 10}} -region {{0.0000 642.0480} {489.1360 999.8560}}

# -----------------------------------------
# Place hard macros
# -----------------------------------------
#source ./data/ORCA_TOP.place_macros.tcl
read_def ./data/RISC_TOP.place_macros.def.gz
## what happens if macros are not fixed
set_att [get_flat_cells -filter "design_type==macro"] physical_status fixed
### create keepout margin for macros : how to get macros
create_keepout_margin -outer {5 5 5 5} [get_flat_cells -filter "design_type==macro"]

### create boundary cells : check and set up corner cells
remove_boundary_cell_rules -all 

set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom

compile_boundary_cells -voltage_area "DEFAULT_VA"

### create tap cells
create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "DEFAULT_VA"

### connect pg
connect_pg_net -automatic

### save design
save_block -force
save_lib

### exit icc2
print_message_info
quit!

##############################################################
# END
##############################################################