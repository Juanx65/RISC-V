## call out libraries
set_app_var target_library "sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db"
set_app_var link_library "* $target_library"

## change design here
#sh rm -r /home/usuario12/RISC-V/icc2out/uniciclo_LIB

## create milkway enviroment

## change desigm here
create_lib -tech "sky130_fd_sc_hd/skywater130_fd_sc_hd.tf" -ref_libs "sky130_fd_sc_hd/ndm/sky130_fd_sc_hd.ndm" uniciclo_LIB

## 
open_lib uniciclo_LIB

##
read_parasitic_tech  -tlup "sky130_fd_sc_hd/skywater130.nominal.tluplus" -layermap "sky130_fd_sc_hd/skywater130.mw2itf.map" -name nomTLU

## 
read_verilog "report/alu.v"

##
read_sdc "report/alu.sdc"

##
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0} -core_offset {0.5}  -flip_first_row true  -coincident_boundary true

#
create_placement -floorplan
## ring
create_io_ring -name outer_ring -corner_height 0.5

create_net -power VDD2
create_net -ground VSS2
create_power_domain PD1
#create_power_switch SW1 -input_supply_port {vin VDD2} -domain {PD1}
connect_pg_net -automatic

set_power_io_constraints -reference_cell {VDD2 VSS2}

place_io

#ring prometedor

connect_pg_net -automatic -all_blocks

create_pg_ring_pattern ring_pattern -horizontal_layer M1 \
   -horizontal_width {1.5} -horizontal_spacing {0.5} \
   -vertical_layer M2 -vertical_width {1.5} -vertical_spacing {0.5}
set_pg_strategy core_ring \
   -pattern {{name: ring_pattern} \
   {nets: {VDD VSS}} {offset: {0.5 0.5}}} -core
compile_pg -strategies core_ring

## or guides: ver man pages de icc2
#create_io_guide -name "io_guide1" -line {{100 100} 100} -side left -pad_cells { pad1 pad2 }

## power constraints: # no funciona porque dice que VDD_NS no existe
#set_power_io_constraints -io_guide_object [get_io_guides *] -ratio {{3 VDD_NS} {7 VSS_NS}} -reference_cell {VDD_NS VSS_NS}

##
#create_routing_rule rdlrule -widths {met2 2} -spacings {met2 1}

## place pins
#place_pins -self

## floorplan: actualmente fallando en uniciclo
#create_placement -floorplan

### run with: icc2_shell -gui -f icc2_test.tcl

## exit shell
# exit