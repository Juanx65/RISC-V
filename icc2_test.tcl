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
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {0.5}  -flip_first_row true  -coincident_boundary true

#------------------------------------------
#  Power Rings
# -----------------------------------------

connect_pg_net -automatic -all_blocks

create_pg_ring_pattern ring_pattern -horizontal_layer met1 \
   -horizontal_width {1.5} -horizontal_spacing {0.5} \
   -vertical_layer met2 -vertical_width {1.5} -vertical_spacing {0.5}
set_pg_strategy core_ring \
   -pattern {{name: ring_pattern} \
   {nets: {VDD VSS}} {offset: {0.5 0.5}}} -core
compile_pg -strategies core_ring

## Falta mesh grid aca https://github.com/SkillSurf/systemverilog/blob/91b4842a7377734b780b910e659ddff0a21ee7d0/asic_flow/scripts/icc2/icc2.tcl

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