##source example_port_lists.tcl

remove_scenarios -all
remove_corners -all
remove_modes -all 

### create modes, corners and scenarios : check errors
## func_tt0p80v100c_cmax
if { [get_scenarios func_tt0p80v100c_cmax -quiet] == "" && [info exists scenarios_list] && [lsearch $scenarios_list "func_tt0p80v100c_cmax"] != -1 } {
    if { [get_modes func -quiet] == "" } {
        create_mode func
    } 
    if { [get_corner tt0p80v100c_cmax -quiet] == "" } {
        create_corner tt0p80v100c_cmax
    }
    create_scenario -mode func -corner tt0p80v100c_cmax -name func_tt0p80v100c_cmax
    current_scenario func_tt0p80v100c_cmax
    read_parasitic_tech -layermap $itf_tluplus_map -tlup $icc2rc_tech(cmax) -name maxTLU
    remove_sdc -scenarios [current_scenario]
    source $data_dir/constraints/RISC_TOP_m_func.tcl
    source $data_dir/constraints/RISC_TOP_c_tt_100c.tcl
    source $data_dir/constraints/RISC_TOP_s_func.ss_100c.tcl
    # set clock uncertainty
    set_clock_uncertainty -setup 0.200 [get_clocks *]
    set_clock_uncertainty -setup 0.300 [get_clocks *]

    set_max_transition 0.15 [get_clock *] -clock_path
    set_max_transition 0.25 [get_clock *] -data_path
    set_max_capacitance 150 [current_design]
    set_scenario_status func_tt0p80v100c_cmax -active true -setup true -hold true -max_capacitance true -max_transition true -min_capacitance true -leakage_power false -dynamic_power false
}