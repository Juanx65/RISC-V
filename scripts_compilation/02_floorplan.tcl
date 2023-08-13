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

### read sdc
read_sdc $import_sdc
### lib
#set_app_var target_library "../sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_100C_1v80.db"
#set_app_var link_library "* $target_library"
### read parasitic tech
read_parasitic_tech  -tlup $icc2rc_tech(nominal) -layermap $itf_tluplus_map -name nomTLU
redirect -file ./connect_pg.rpt { connect_pg_net -auto -verbose }

#------------------------------------------
#  Floorplan
# -----------------------------------------
#initialize_floorplan -boundary {{0 0} {999.856 999.856}} -core_offset {0 1.672}
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {5 5}  -flip_first_row true  -coincident_boundary true

#-----------------------------------------
# MESH - RAILS
#-----------------------------------------
create_pg_std_cell_conn_pattern rail_pattern -layer met1 
set_pg_strategy M1_rails -core -pattern {{name : rail_pattern}{nets: VPWR VGND}}
set_app_options -name plan.pgroute.ignore_signal_route -value true 
compile_pg -strategies M1_rails

#-----------------------------------------
# POWER_RING
#-----------------------------------------
create_pg_ring_pattern ring_pattern -horizontal_layer met1 -horizontal_width {0.48} -horizontal_spacing {0.24} -vertical_layer met2 -vertical_width {0.48} -vertical_spacing {0.24}
set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VPWR VGND}} {offset: {3 3}}} -core
compile_pg -strategies core_ring 

#set_pg_strategy ring_strat -core pattern {{name:ring_pattern} {nets: {VDD VSS}}} {offset: {3 3}} {parameters: {met5 10 3 met4 10 2 true}} -extension {{stop: design_boundary}}
#compile_pg -strategies ring_strat

#------------------------------------------
#  Create voltage areas
# -----------------------------------------
#create_voltage_area -power_domains TOP -region {{5 5} {118 78}} -power VDD -ground VSS -name VA1

#set_parasitic_parameters -early_spec nomTLU -late_spec nomTLU
set_voltage 1.8  -object_list VPWR
set_voltage 0.00  -object_list VGND

#create_secondary_pg_placement_constraints -name pg_cstr0 -supply VDD -voltage_areas TOP -region {{0 115} {0 75}}

#------------------------------------------
#  Pin I/O 
# -----------------------------------------
place_pins -self -ports [get_ports *]

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -effort low
legalize_placement 

#------------------------------------------
#  Keepout margin for macros : how to get macros
# -----------------------------------------
#create_keepout_margin -outer {5 5 5 5} [get_flat_cells -filter "design_type==macro"]

#------------------------------------------
#  Boundary cells : check and set up corner cells
# -----------------------------------------
#remove_boundary_cell_rules -all 

#set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom
#set_boundary_cell_rules -left_boundary_cell $endcap_left -right_boundary_cell $endcap_right -top_boundary_cell $endcap_top -bottom_boundary_cell $endcap_bottom -bottom_right_inside_corner_cells $endcap_left -bottom_right_outside_corner_cell $endcap_left -top_left_inside_corner_cells $endcap_left -bottom_left_outside_corner_cell $endcap_left -top_left_outside_corner_cell $endcap_left -top_right_outside_corner_cell $endcap_left -bottom_left_inside_corner_cells $endcap_left -top_left_inside_corner_cells $endcap_left -top_right_inside_corner_cells $endcap_left -at_va_boundary

#compile_boundary_cells -voltage_area "TOP"
#check_boundary_cells

#------------------------------------------
#  Tap cells
# -----------------------------------------
#create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "PD_RISC_CORE"
#create_tap_cells -lib_cell $tapcell_ref -pattern stagger -distance 70 -skip_fixed_cells -voltage_area "DEFAULT_VA"

#------------------------------------------
# Connect pg
# -----------------------------------------
#connect_pg_net -automatic -all_blocks

# -----------------------------------------
#  Route
# -----------------------------------------
#route_auto

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