##############################################################
# Function: Run ChipFinish in ICC2
# Created by Ahmed Abdelazeem
##############################################################
### load setting
source scripts/00_common_initial_settings.tcl

### variables
set current_step "09_icc2_chipfinish"
set before_step  "08_icc2_routeopt"

### open database
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib
open_block ${design}

### initialize setting
source scripts/initialization_settings.tcl

### insert decap/fillers
#create_stdcell_fillers -lib_cells $decap_ref
#remove_stdcell_fillers_with_violation
create_stdcell_fillers -lib_cells $fillers_ref

### connect pg
connect_pg_net -all_blocks -automatic

### save
save_block
save_lib -all

### write gds/oasis
set gds_file "data/${design}_${current_step}.oas"
set_app_options -as_user_default -name file.oasis.contact_prefix -value $design
set_app_options -as_user_default -name file.gds.contact_prefix -value $design
set_app_options -as_user_default -name file.verilog.write_internal_pins -value true
if { [get_routing_blockages * -quiet] != "" } {
    remove_routing_blockages *
}
write_gds -long_names -design $design -hierarchy design_lib -lib_cell_view frame -compress -keep_data_type -output_pin geometry -fill exclude $gds_file
write_oasis -design $design -hierarchy design_lib -lib_cell_view frame -compress 9 -keep_data_type -output_pin geometry -fill exclude $gds_file

### write final netlist for common use
set def_name "data/${design}_${current_step}.v.lvs.gz"
set_app_options -as_user_default -name file.verilog.write_internal_pins -value false
write_verilog $def_name -compress gzip \
-exclude {pad_spacer_cells empty_modules end_cap_cell well_tap_cells filler_cells leaf_module_declarations pg_objects corner_cells physical_only_cells}

### write final netlist for LVS
set_app_options -as_user_default -name file.verilog.write_internal_pins -value false
set lvs_netlist "data/${design}_${current_step}.v.gz"
write_verilog -compress gzip -exclude {end_cap_cells well_tap_cells supply_statements empty_modules} $lvs_netlist

### write def
set def_name "data/${design}_${current_step}.def.gz"
write_def $def_name -version 5.8 -compress gzip -include_tech_via_definitions \
-include {bounds specialnets nets routing_rules rows_tracks vias cells ports blockages} -exclude_physical_status unplaced

### write block level lef
set lef_name "data/${design}_${current_step}.lef"
create_frame -block_all used_layers -hierarchical true -merge_metal_blockage true
write_lef -include cell -design ${design}.frame $lef_name

### exit
print_message_info
quit!

##############################################################
# END
##############################################################
