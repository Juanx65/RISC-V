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
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {5}  -flip_first_row true  -coincident_boundary true

#------------------------------------------
#  Power Rings
# -----------------------------------------
create_net -power VDD
create_net -ground VSS

#connect_pg_net -net VDD [get_pins -physical_context *VDD]
#connect_pg_net -net VSS [get_pins -physical_context *VSS]

create_pg_ring_pattern ring_pattern -horizontal_layer met1 \
   -horizontal_width {1.5} -horizontal_spacing {0.5} \
   -vertical_layer met2 -vertical_width {1.5} -vertical_spacing {0.5}
set_pg_strategy core_ring \
   -pattern {{name: ring_pattern} \
   {nets: {VDD VSS}} {offset: {0.5 0.5}}} -core

connect_pg_net -automatic -all_blocks
compile_pg -strategies core_ring

#-----------------------------------------
# MESH
#-----------------------------------------
#create_pg_mesh_pattern mesh_pattern -layers { {{horizontal_layer: met1} {width: 0.75} {pitch: 15} {spacing: interleaving}}  {{vertical_layer: met2} {width: 0.84} {pitch: 33.6} {spacing: interleaving}} }
#set_pg_strategy mesh_strategy  -polygon {{1.000 4.880} {16.144 11.990}} -pattern {{pattern: mesh_pattern}{nets: {VDD VSS}}} -blockage {macros: all}
#create_pg_std_cell_conn_pattern std_cell_pattern
#set_pg_strategy std_cell_strategy  -polygon {{1.000 4.880} {16.144 11.990}} -pattern {{pattern: std_cell_pattern}{nets: {VDD VSS}}}
#compile_pg -ignore_via_drc

create_pg_mesh_pattern mesh_pattern \
   -layers {{{vertical_layer: met1} {width: 0.6}\
             {pitch: 20} {offset: 20}}\
            {{horizontal_layer: met2} {width: 0.6}\
             {pitch: 20} {offset: 20}}}

set_pg_strategy M5M6_mesh \
   -pattern {{name: mesh_pattern} \
             {nets: VDD VSS VDD VSS}} -core

compile_pg -strategies M5M6_mesh
        
#------------------------------------------
#  Pin I/O - MODIFY the pins as required
# -----------------------------------------
place_pins -self -ports {VDD VSS SrcA SrcB ALUControl ALUResult Zero}

#------------------------------------------
#  Placement
# -----------------------------------------
create_placement -floorplan -timing_driven

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