##############################################################
# Function: Create floorplan in ICC2
# Created by Ahmed Abdelazeem
##############################################################
source 00_initial_settings.tcl

### variables
set current_step "02_icc2_floorplan"
set before_step  "01_icc2_import"

### open database
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib

### get blocks -all
open_block ${design}

### initialize tool
source initialization_settings.tcl

### create scenarios
#set scenarios_list $default_scenarios
#source scenarios_setup.tcl

#------------------------------------------
#  Floorplan
# -----------------------------------------
#initialize_floorplan -boundary {{0 0} {999.856 999.856}} -core_offset {0 1.672}
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {1 2.6}  -flip_first_row true  -coincident_boundary true

#-----------------------------------------
# MESH
#-----------------------------------------
create_pg_std_cell_conn_pattern rail_pattern -layer met1 
set_pg_strategy M1_rails -core -pattern {{name : rail_pattern}{nets: VDD VSS}}
compile_pg -strategies M1_rails

#------------------------------------------
#  Pin I/O - MODIFY the pins as required
# -----------------------------------------
place_pins -self -ports [get_ports *]

### create voltage areas
#create_voltage_area -power_domains PD_RISC_CORE -guard_band {{10.032 10}} -region {{0.0000 642.0480} {489.1360 999.8560}}

### place hard macros
#source ./data/ORCA_TOP.place_macros.tcl
#read_def ./data/ORCA_TOP.place_macros.def.gz

## what happens if macros are not fixed
#set_att [get_flat_cells -filter "design_type==macro"] physical_status fixed
#set_app_options -name place.coarse.fix_hard_macros -value false
#set_app_options -name plan.place.auto_create_blockages -value auto
#create_placement -floorplan -effort low

### create keepout margin for macros : how to get macros
#create_keepout_margin -outer {5 5 5 5} [get_flat_cells -filter "design_type==macro"]

### create boundary cells : check and set up corner cells
#remove_boundary_cell_rules -all 

#set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom
#set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom -bottom_right_inside_corner_cells $endcap_left -bottom_right_outside_corner_cell $endcap_left -top_left_inside_corner_cells $endcap_left -bottom_left_outside_corner_cell $endcap_left -top_left_outside_corner_cell $endcap_left -top_right_outside_corner_cell $endcap_left -bottom_left_inside_corner_cells $endcap_left -top_left_inside_corner_cells $endcap_left -top_right_inside_corner_cells $endcap_left -at_va_boundary

#compile_boundary_cells -voltage_area "PD_RISC_CORE"
#compile_boundary_cells -voltage_area "DEFAULT_VA"

### create tap cells
#create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "PD_RISC_CORE"
#create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "DEFAULT_VA"

#------------------------------------------
# connect pg
# -----------------------------------------
connect_pg_net -automatic -all_blocks

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -timing_driven
legalize_placement 

# -----------------------------------------
#  Route
# -----------------------------------------
route_auto
### save design
save_block -force
save_lib

### exit icc2
print_message_info
#quit!

##############################################################
# END
##############################################################