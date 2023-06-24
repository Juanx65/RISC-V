##########################################################################################
# 				PLACE_IO
##########################################################################################
#set TCL_PAD_CONSTRAINTS_FILE "pad_placement_constraints.tcl"
#set clock_name clk
#set clock_period 10


## Call out libraries
set_app_var target_library "../sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_100C_1v80.db"
set_app_var link_library "* $target_library"
## change design here
#sh rm -r /home/usuario12/RISC-V/uniciclo_LIB
#------------------------------------------
#  Create milkway enviroment
# -----------------------------------------
create_lib -tech "../sky130_fd_sc_hd/skywater130_fd_sc_hd.tf" -ref_libs "../sky130_fd_sc_hd/ndm/sky130_fd_sc_hd.ndm" uniciclo_LIB
open_lib uniciclo_LIB
read_parasitic_tech  -tlup "../sky130_fd_sc_hd/skywater130.nominal.tluplus" -layermap "../sky130_fd_sc_hd/skywater130.mw2itf.map" -name nomTLU

#------------------------------------------
#  Design
# -----------------------------------------
read_verilog "../logic_synthesis/report/uniciclo.v"
read_sdc "../logic_synthesis/report/uniciclo.sdc"

#------------------------------------------
# Clock
#------------------------------------------
#create_clock -period ${clock_period} -name clk [get_ports $clock_name]

### Timing Model
#set_timing_derate -early 0.93 -cell_delay -net_delay
#set clock uncertainty
#set_max_transition 0.15 [get_clock *] -clock_path
#set_max_transition 0.25 [get_clock *] -data_path
#set_max_capacitance 150 [current_design]

#------------------------------------------
# UPF
#------------------------------------------

create_power_domain TOP
create_supply_net VSS -domain TOP
create_supply_net VDD -domain TOP
set_domain_supply_net TOP -primary_power_net VDD -primary_ground_net VSS
create_supply_port VSS -domain TOP -direction in
create_supply_port VDD -domain TOP -direction in
add_port_state VSS  -state {state1 0.000000}
connect_supply_net VSS -ports {VSS}
connect_supply_net VDD -ports {VDD}


#------------------------------------------
#  Floorplan
# -----------------------------------------
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {1 2.6}  -flip_first_row true  -coincident_boundary true


#------------------------------------------
#  Power Rings
# -----------------------------------------
#create_net -power VDD
#create_net -ground VSS
#create_pg_ring_pattern ring_pattern -horizontal_layer met1 -horizontal_width {0.48} -horizontal_spacing {0.24} -vertical_layer met2 -vertical_width {0.48} -vertical_spacing {0.24}
#set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {-1 0.6}}} -core
#compile_pg -strategies core_ring

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -timing_driven
legalize_placement 

connect_pg_net -automatic -all_blocks

#------------------------------------------
#  Pin I/O - MODIFY the pins as required
# -----------------------------------------
set_block_pin_constraints -self
#place_pins -self -ports {VSS VDD SrcA SrcB ALUControl ALUResult Zero}
place_pins -self

#-----------------------------------------
# MESH
#-----------------------------------------
create_pg_std_cell_conn_pattern rail_pattern -layer met1 
set_pg_strategy M1_rails -core -pattern {{name : rail_pattern}{nets: VDD VSS}}
compile_pg -strategies M1_rails

# -----------------------------------------
#  Route
# -----------------------------------------
#clock_opt
route_auto -max_detail_route_iterations 5
#save_block $library_name:$top_module
#write_gds -hier all ${top_module}.gds

##
#compile
#save_lib -all

### run with: icc2_shell -gui -f icc2_test.tcl
## exit shell
# exit