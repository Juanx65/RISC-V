##############################################################
# Function: Run Routing ICC2
# Created by Ahmed Abdelazeem
##############################################################
source scripts/00_common_initial_settings.tcl

### variables
set current_step "07_icc2_route"
set before_step  "06_icc2_clockopt"

### open database
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib
open_block ${design}

### initialize tool
source scripts/initialization_settings.tcl

### create scenarios
set scenarios_list $default_scenarios
source scripts/scenarios_setup.tcl
foreach scenario [get_att [all_scenarios] name] {
    echo "Setting propagated clock on scenario $scenario"
    current_scenario $scenario
    set_propagated_clock [get_clocks -filter "is_virtual == false"]
}

### set routing layers
set_ignored_layers -min_routing_layer M1 -max_routing_layer M9

### set lib cell purpose for tie
set_lib_cell_purpose -include optimization [get_lib_cells */*TIE*]
set_dont_touch [get_lib_cells */*TIE*] false
set_app_options -name opt.tie_cell.max_fanout -value 8

### set lib cell purpose for hold fix
set_dont_touch $holdfix_ref false
set_attribute $holdfix_ref dont_use false
set_lib_cell_purpose -exclude hold [get_lib_cells */*]
set_lib_cell_purpose -include hold $holdfix_ref

### choose CTS cells type
set CTS_LIB_CELL_PATTERN_LIST "*/NBUFF*LVT */INVX*_LVT */CG* */AOBUFX*_LVT */AOINV* */*DFF*"
set CTS_CELLS [get_lib_cells $CTS_LIB_CELL_PATTERN_LIST]
set_dont_touch $CTS_CELLS false
set_attribute $CTS_CELLS dont_use false
set_lib_cell_purpose -exclude cts [get_lib_cells */*]
set_lib_cell_purpose -include cts $CTS_CELLS

### set CTS NDR
if { [get_routing_rule CTS_NDR_2w2s -quiet] == "" } {
    create_routing_rule CTS_NDR_2w2s -default_reference_rule \
    -widths   {M1 0.1 M2 0.112 M3 0.112 M4 0.112 M5 0.112 M6 0.112 M7 0.112 M8 0.112 M9 0.32} \
    -spacings {M1 0.1 M2 0.112 M3 0.112 M4 0.112 M5 0.112 M6 0.112 M7 0.112 M8 0.112 M9 0.32} \
    -spacing_weight_levels { M1 {medium} M2 {medium} M3 {medium} M4 {medium} M5 {hard} M6 {hard} M7 {hard} M8 {hard} M9 {medium}}
}

### set CTS settings (spec)
set_app_options -name time.remove_clock_reconvergence_pessimism -value true
set_app_options -name clock_opt.flow.enable_ccd -value false
set_app_options -name clock_opt.hold.effort -value high
set_app_options -name clock_opt.place.congestion_effort -value high
set_app_options -name clock_opt.place.effort -value high
set_app_options -name opt.dft.clock_aware_scan_reorder -value true

### set cell prefix added by cts command
set_app_options -name cts.common.user_instance_name_prefix -value CTS_
set_app_options -name opt.common.user_instance_name_prefix -value ROPT_

### set route app options
set_app_options -name route.global.effort_level -value high
set_app_options -name route.global.timing_driven -value true
set_app_options -name route.global.crosstalk_driven -value true
set_app_options -name route.track.timing_driven -value true
set_app_options -name route.track.crosstalk_driven -value true
set_app_options -name route.detail.timing_driven -value true

set_app_options -name route.detail.save_after_iterations -value 30
set_app_options -name route.detail.antenna_fixing_preference -value use_diodes
set_app_options -name route.detail.insert_diodes_during_routing -value true
#set_app_options -name route.common.global_max_layer_mode -value soft
#set_app_options -name route.common.global_min_layer_mode -value soft
set_app_options -name route.detail.diode_libcell_names -value */ANTENNA_RVT

### run route
route_auto
#route_global
#route_track
#route_detail

### connect pg
connect_pg_net -automatic

### save design
save_block -force
save_lib

### get reports
set report_dir "reports/$current_step"
file mkdir $report_dir
check_legality > ${report_dir}/check_legality.rpt
check_mv_design > ${report_dir}/check_mv_design.rpt
report_qor -summary > ${report_dir}/report_qor.summary.rpt
report_timing -nosplit -report_by scenario -transition_time -capacitance -physical -nets -input_pins -nworst 1 -max_paths 200 -attribute -derate -voltage -delay_type max > ${report_dir}/report_timing.rpt
if { [get_utilization_configurations util_config -quiet] == "" } {
    create_utilization_configuration util_config -exclude {hard_macros macro_keepouts soft_macros io_cells hard_blockages}
}
report_utilization -config util_config > ${report_dir}/report_utilization.rpt
report_utilization -config util_config -of_objects [get_voltage_areas PD_RISC_CORE] > ${report_dir}/report_utilization.PD_RISC_CORE.rpt

### exit icc2
print_message_info
quit!

##############################################################
# END
##############################################################