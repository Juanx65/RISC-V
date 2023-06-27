##############################################################
# Function: read gate level netlist into ICC2
# Created by Juan Aguilera
# Reference: https://github.com/abdelazeem201/ORCA
##############################################################
source 00_initial_settings.tcl

### variables
set current_step "01_icc2_import"

### create nlib
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
create_lib -technology $synopsys_tech_tf -ref_libs $ndm_files $nlib_dir/${design}_${current_step}.nlib

### read verilog
read_verilog -library ${design}_${current_step}.nlib -design ${design} -top $design $import_netlists

### read sdc
read_sdc $import_sdc

### initialization script
source initialization_settings.tcl

### load upf
set_app_options -name mv.upf.enable_golden_upf -value true
reset_upf
load_upf $golden_upf
commit_upf

### connect pg
connect_pg_net -automatic

### save design
save_block
save_lib

### exit icc2
print_message_info
quit!

##############################################################
# END
##############################################################