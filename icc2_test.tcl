## Call out libraries
set_app_var target_library "sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db"
set_app_var link_library "* $target_library"
## change design here
#sh rm -r /home/usuario12/RISC-V/uniciclo_LIB
#------------------------------------------
#  Create milkway enviroment
# -----------------------------------------
create_lib -tech "sky130_fd_sc_hd/skywater130_fd_sc_hd.tf" -ref_libs "sky130_fd_sc_hd/ndm/sky130_fd_sc_hd.ndm" uniciclo_LIB
open_lib uniciclo_LIB
read_parasitic_tech  -tlup "sky130_fd_sc_hd/skywater130.nominal.tluplus" -layermap "sky130_fd_sc_hd/skywater130.mw2itf.map" -name nomTLU

#------------------------------------------
#  Design
# -----------------------------------------
read_verilog "report/alu.v"
read_sdc "report/alu.sdc"

#------------------------------------------
#  Placement
# -----------------------------------------
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {1}  -flip_first_row true  -coincident_boundary true

#------------------------------------------
#  Power Rings
# -----------------------------------------
create_net -power VDD
create_net -ground VSS

#create_pg_ring_pattern ring_pattern -horizontal_layer met1 -horizontal_width {0.48} -horizontal_spacing {0.24} -vertical_layer met2 -vertical_width {0.48} -vertical_spacing {0.24}
#set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {2 2}}} -core

compile_pg -strategies core_ring
connect_pg_net -automatic -all_blocks

        
#------------------------------------------
#  Pin I/O - MODIFY the pins as required
# -----------------------------------------
place_pins -self -ports {VDD VSS SrcA SrcB ALUControl ALUResult Zero}
#place_pins -self

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -timing_driven
legalize_placement 

#-----------------------------------------
# MESH
#-----------------------------------------
create_pg_std_cell_conn_pattern rail_pattern -layer met1 
set_pg_strategy M1_rails -core -pattern {{name : rail_pattern}{nets: VDD VSS}{offset: {2 2}}}
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