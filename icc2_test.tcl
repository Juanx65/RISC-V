## call out libraries
set_app_var target_library "sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db"
set_app_var link_library "* $target_library"

## change design here
#sh rm -r /home/usuario12/RISC-V/icc2out/uniciclo_LIB

## create milkway enviroment

## change desigm here
create_lib -tech "/home/usuario11/RISC-V/sky130_fd_sc_hd/skywater130_fd_sc_hd.tf" -ref_libs "/home/usuario11/RISC-V/sky130_fd_sc_hd/ndm/sky130_fd_sc_hd.ndm" uniciclo_LIB

## 
open_lib uniciclo_LIB

#set_tlu_plus_files \
    -nom_tluplus "/home/usuario12/RISC-V/sky130_fd_sc_hd/skywater130.nominal.tluplus" \
    -tech2itf_map "/home/usuario12/RISC-V/sky130_fd_sc_hd/skywater130.mw2itf.map"
read_parasitic_tech  -tlup "/home/usuario11/RISC-V/sky130_fd_sc_hd/skywater130.nominal.tluplus" -layermap "/home/usuario11/RISC-V/sky130_fd_sc_hd/skywater130.mw2itf.map" -name nomTLU
## 
read_verilog "report/Uniciclo.v"

##
read_sdc "report/Uniciclo.sdc"
initialize_floorplan  -core_utilization 0.7  -core_shape R  -orientation N  -core_side_ratio {1.5 1.0}  -core_offset {0}  -flip_first_row true  -coincident_boundary true
### run with: icc2_shell -gui -f icc2_test.tcl