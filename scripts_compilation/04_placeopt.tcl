##############################################################
# Function: Run place_opt in ICC2
# Created by Ahmed Abdelazeem
##############################################################
source scripts/00_common_initial_settings.tcl

### variables
set current_step "04_icc2_placeopt"
set before_step  "03_icc2_pgrouting"

### open database
file mkdir $nlib_dir
file delete -force $nlib_dir/${design}_${current_step}.nlib
copy_lib -from_lib ${nlib_dir}/${design}_${before_step}.nlib -to_lib ${nlib_dir}/${design}_${current_step}.nlib -force
current_lib ${design}_${current_step}.nlib
open_block ${design}

### initialize tool
source scripts/initialization_settings.tcl

### create scenarios
set scenarios_list $placeopt_scenarios
source scripts/scenarios_setup.tcl

### set routing layers
set_ignored_layers -min_routing_layer M1 -max_routing_layer M8

### enable tie cell insertion during optimization
set_lib_cell_purpose -include optimization [get_lib_cells */*TIE*]
set_dont_touch [get_lib_cells */*TIE*] false
set_app_options -name opt.tie_cell.max_fanout -value 8

### manually control density
#set_app_options -name place.coarse.congestion_driven_max_util -value 0.70
#set_app_options -name place.coarse.congestion_layer_aware -value true
#set_app_options -name place.coarse.max_density -value 0.50
#set_app_options -name place.coarse.pin_density_aware -value true

### auto density control
set_app_options -name opt.common.enable_rde -value true
set_app_options -name place.coarse.enhanced_auto_density_control -value true

### read and optimize scan def
set_app_options -name place.coarse.continue_on_missing_scandef -value false
remove_scan_def
read_def $scandef_file
set_app_options -name opt.dft.optimize_scan_chain -value true

### optimization options
set_app_options -name place.legalize.enable_advanced_legalizer -value true
set_app_options -name place_opt.congestion.effort -value high
set_app_options -name route.global.effort_level -value high
set_app_options -name opt.area.effort -value ultra
set_app_options -name opt.common.buffer_area_effort -value ultra
set_app_options -name place_opt.flow.clock_aware_placement -value true
set_app_options -name refine_opt.flow.clock_aware_placement -value true
set_app_options -name place_opt.flow.enable_power -value true
set_app_options -name opt.power.leakage_type -value conventional
set_app_options -name place.coarse.auto_timing_control -value true
set_app_options -name place_opt.final_place.effort -value high
set_app_options -name route.global.timing_driven_effort_level -value high
set_app_options -name opt.timing.effort -value high

### set cell prefix added by place_opt command
set_app_options -name opt.common.user_instance_name_prefix -value POPT_

### disable default enabled advanced feature
set_app_options -name place_opt.flow.estimate_clock_gate_latency -value false
set_app_options -name place_opt.flow.enable_ccd -value false

### run placeopt
place_opt

### connect pg
connect_pg_net -automatic

### get reports
set report_dir "reports/$current_step"
file mkdir $report_dir
check_legality > ${report_dir}/check_legality.rpt
check_mv_design > ${report_dir}/check_mv_design.rpt
report_qor -summary > ${report_dir}/report_qor.summary.rpt
report_timing -nosplit -report_by scenario -transition_time -capacitance -physical -nets -input_pins -nworst 1 -max_paths 200 -attribute -derate -voltage -delay_type max > ${report_dir}/report_timing.rpt
create_utilization_configuration util_config -exclude {hard_macros macro_keepouts soft_macros io_cells hard_blockages}
report_utilization -config util_config > ${report_dir}/report_utilization.rpt
report_utilization -config util_config -of_objects [get_voltage_areas PD_RISC_CORE] > ${report_dir}/report_utilization.PD_RISC_CORE.rpt

### save design
save_block -force
save_lib

### exit icc2
print_message_info
quit!

##############################################################
# END
##############################################################