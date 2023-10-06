##############################################################
# Function: Run clock tree synthesis in ICC2
# Created by Ahmed Abdelazeem
##############################################################
source scripts/00_common_initial_settings.tcl

### variables
set current_step "05_icc2_clock"
set before_step  "04_icc2_placeopt"

### open database
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib
open_block ${design}

### initialize tool
source scripts/initialization_settings.tcl

### create scenarios
set scenarios_list $clock_scenarios
source scripts/scenarios_setup.tcl

### set routing layers
set_ignored_layers -min_routing_layer M5 -max_routing_layer M8

### set lib cell purpose
set_lib_cell_purpose -include optimization [get_lib_cells */*TIE*]
set_dont_touch [get_lib_cells */*TIE*] false
set_app_options -name opt.tie_cell.max_fanout -value 8

### choose CTS cells type
set CTS_LIB_CELL_PATTERN_LIST "*/NBUFF*LVT */INVX*_LVT */CG* */AOBUFX*_LVT */AOINV* */*DFF*"
set CTS_CELLS [get_lib_cells $CTS_LIB_CELL_PATTERN_LIST]
set_dont_touch $CTS_CELLS false
set_attribute $CTS_CELLS dont_use false
set_lib_cell_purpose -exclude cts [get_lib_cells */*]
set_lib_cell_purpose -include cts $CTS_CELLS

### set CTS NDR

### set CTS settings (spec)
set_app_options -name time.remove_clock_reconvergence_pessimism -value true
set_app_options -name clock_opt.flow.enable_ccd -value false
set_app_options -name cts.compile.enable_local_skew -value true
set_app_options -name cts.optimize.enable_local_skew -value true
set_app_options -name opt.dft.clock_aware_scan_reorder -value true
set_max_transition 0.15 -clock_path [get_clocks -filter "is_virtual==false"] -corners [all_corners]
set_clock_tree_options -target_skew 100 -clocks [get_clocks -filter "is_generated==false&&is_virtual==false"]

### set cell prefix added by cts command
set_app_options -name cts.common.user_instance_name_prefix -value CTS_

### run clock_opt
clock_opt -from build_clock -to route_clock

### connect pg
connect_pg_net -automatic

### get reports
set report_dir "reports/$current_step"
file mkdir $report_dir
check_legality > ${report_dir}/check_legality.rpt
check_mv_design > ${report_dir}/check_mv_design.rpt
report_qor -summary > ${report_dir}/report_qor.summary.rpt
report_timing -nosplit -report_by scenario -transition_time -capacitance -physical -nets -input_pins -nworst 1 -max_paths 200 -attribute -derate -voltage -delay_type max > ${report_dir}/report_timing.rpt
if { [get_utilization_configurations util_config -quiet] != "" } {
    create_utilization_configuration util_config -exclude {hard_macros macro_keepouts soft_macros io_cells hard_blockages}
}
report_utilization -config util_config > ${report_dir}/report_utilization.rpt
report_utilization -config util_config -of_objects [get_voltage_areas PD_RISC_CORE] > ${report_dir}/report_utilization.PD_RISC_CORE.rpt
redirect -file ${report_dir}/report_clock_qor.structure.rpt { report_clock_qor -type structure }
redirect -file ${report_dir}/report_clock_qor.all.rpt { report_clock_qor -all }
foreach_in_collection clk [get_clocks -filter "is_virtual == false" -quiet] {
    set clk_name [get_object_name $clk]
    redirect ${report_dir}/report_clock_qor.${clk_name}.latency.rpt { report_clock_qor -clock $clk_name -type latency -show_verbose_paths -largest 1 -smallest 1 }
    redirect ${report_dir}/report_clock_qor.${clk_name}.local_skew.rpt { report_clock_qor -clock $clk_name -type local_skew -largest 1000 }
    redirect ${report_dir}/report_clock_qor.${clk_name}.summary.rpt { report_clock_qor -clock $clk_name -type summary }
}

### save design
save_block -force
save_lib

### exit icc2
print_message_info
quit!

##############################################################
# END
##############################################################