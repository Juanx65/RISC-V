## Librarys
set_app_var target_library "sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v40.db"
set_app_var link_library "* $target_library"

## RTL Reading and Link
analyze -format sverilog {test_code/sumador_ff.v}
elaborate adder_tree_fp

link

## Constrains Setup
set clk_val 10

create_clock -period $clk_val [get_ports clk*] -name clk
set_clock_uncertainty -setup [expr $clk_val*0.1] [get_clocks clk]
set_clock_transition -max [expr $clk_val*0.2] [get_clocks clk]
set_clock_latency -source -max [expr $clk_val*0.05] [get_clocks clk]

set_input_delay -max [expr $clk_val*0.4] -clock clk [get_ports [remove_from_collection [all_inputs] clk]]
set_output_delay -max [expr $clk_val*0.5] -clock clk [get_ports [all_outputs]]

set_load -max 0.04 [get_ports [all_outputs]]
set_input_transition -min [expr $clk_val*0.01] [get_ports [all_inputs]]
set_input_transition -max [expr $clk_val*0.1] [get_ports [all_inputs]]

## Pre-compile Reports
#report_clock > report/report_clock.rpt
#analyze_datapath_extraction > report/analyze_datapath_extraction.rpt                                                       

## Compile/Synthesis
# compile_ultra -no_autoungroup
compile -exact_map

## Post-compile Reports
#analyze_datapath > report/analyze_datapath.rpt
#report_resources -hierarchy > report/report_resources.rpt
#report_qor > report/report_qor.rpt
#report_timing > report/report_timing.rpt
#report_area > report/report_area.rpt
#report_power > report/report_power.rpt

## Save Design
#write_file -format ddc -hierarchy -out report/test1.ddc

#write_file -format verilog -hierarchy -out report/test11.v
#write_sdc report/test.sdc

## Start GUI
gui_start

# Exit
# exit
