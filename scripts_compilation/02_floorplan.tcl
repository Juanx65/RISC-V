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
#set scenarios_list $default_scenarios
#source scenarios_setup.tcl

#------------------------------------------
#  Floorplan
# -----------------------------------------
#initialize_floorplan -boundary {{0 0} {999.856 999.856}} -core_offset {0 1.672}
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {2 2}  -flip_first_row true  -coincident_boundary true

#-----------------------------------------
# MESH
#-----------------------------------------
create_pg_std_cell_conn_pattern rail_pattern -layer met1 
set_pg_strategy M1_rails -core -pattern {{name : rail_pattern}{nets: VDD VSS}}
compile_pg -strategies M1_rails

#------------------------------------------
#  Pin I/O 
# -----------------------------------------
place_pins -self -ports [get_ports *]

#------------------------------------------
#  Create voltage areas
# -----------------------------------------
#create_voltage_area -power_domains PD_RISC_CORE -guard_band {{10.032 10}} -region {{0.0000 642.0480} {489.1360 999.8560}}
create_voltage_area -power_domains TOP
### place hard macros
#source ./data/ORCA_TOP.place_macros.tcl
#read_def ./data/ORCA_TOP.place_macros.def.gz

## what happens if macros are not fixed
set_att [get_flat_cells -filter "design_type==macro"] physical_status fixed
set_app_options -name place.coarse.fix_hard_macros -value false
set_app_options -name plan.place.auto_create_blockages -value auto

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -timing_driven
legalize_placement 

#------------------------------------------
#  Keepout margin for macros : how to get macros
# -----------------------------------------
#create_keepout_margin -outer {5 5 5 5} [get_flat_cells -filter "design_type==macro"]
create_keepout_margin -outer {5 5 5 5}

#------------------------------------------
#  Boundary cells : check and set up corner cells
# -----------------------------------------
#remove_boundary_cell_rules -all 

#set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom
#set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom -bottom_right_inside_corner_cells $endcap_left -bottom_right_outside_corner_cell $endcap_left -top_left_inside_corner_cells $endcap_left -bottom_left_outside_corner_cell $endcap_left -top_left_outside_corner_cell $endcap_left -top_right_outside_corner_cell $endcap_left -bottom_left_inside_corner_cells $endcap_left -top_left_inside_corner_cells $endcap_left -top_right_inside_corner_cells $endcap_left -at_va_boundary

#compile_boundary_cells -voltage_area "PD_RISC_CORE"
#compile_boundary_cells -voltage_area "DEFAULT_VA"

#------------------------------------------
#  Tap cells
# -----------------------------------------
#create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "PD_RISC_CORE"
#create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "DEFAULT_VA"

#------------------------------------------
# Connect pg
# -----------------------------------------
connect_pg_net -automatic -all_blocks

# -----------------------------------------
#  Route
# -----------------------------------------
route_auto

# -----------------------------------------
# Save design
# -----------------------------------------
save_block -force
save_lib

# -----------------------------------------
# Exit icc2
# -----------------------------------------
print_message_info
#quit!

##############################################################
# END
##############################################################