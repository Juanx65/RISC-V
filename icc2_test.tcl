## call out libraries
set_app_var target_library "sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db"
set_app_var link_library "* $target_library"

## change design here
#sh rm -r /home/usuario12/RISC-V/icc2out/uniciclo_LIB

## create milkway enviroment

## change desigm here
create_lib -tech "/home/usuario12/RISC-V/sky130_fd_sc_hd/skywater130_fd_sc_hd.tf" -ref_libs "/home/usuario12/RISC-V/sky130_fd_sc_hd/ndm/sky130_fd_sc_hd.ndm" uniciclo_LIB

## 
open_lib uniciclo_LIB

#set_tlu_plus_files \
    -nom_tluplus "/home/usuario12/RISC-V/sky130_fd_sc_hd/skywater130.nominal.tluplus" \
    -tech2itf_map "/home/usuario12/RISC-V/sky130_fd_sc_hd/skywater130.mw2itf.map"

## 
read_verilog "report/uniciclo.v"

##
read_sdc "report/uniciclo.sdc"

### run with: icc2_shell -gui -f icc2_test.tcl