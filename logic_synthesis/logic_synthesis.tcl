## Librarys
set_app_var target_library "../sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_100C_1v80.db"
set_app_var link_library "* $target_library"

## RTL Reading and Link

## villano
#analyze -format sverilog { ../villano/alu.sv ../villano/aludec.sv ../villano/control_unit.sv ../villano/Decode.sv ../villano/dmem.sv ../villano/Execute.sv ../villano/extend.sv ../villano/Fetch.sv ../villano/hazard_unit.sv ../villano/imem.sv ../villano/maindec.sv ../villano/Mem_data.sv ../villano/mux2.sv ../villano/mux3.sv ../villano/regfile.sv ../villano/top_risc.sv ../villano/Wrback.sv }
#elaborate top_risc

#analyze -format sverilog { ../villano/alu.sv ../villano/aludec.sv ../villano/control_unit.sv ../villano/Decode.sv ../villano/dmem.sv ../villano/Execute.sv ../villano/extend.sv ../villano/Fetch.sv ../villano/hazard_unit.sv ../villano/imem.sv ../villano/maindec.sv ../villano/Mem_data.sv ../villano/mux2.sv ../villano/mux3.sv ../villano/regfile.sv ../villano/top_risc.sv ../villano/Wrback.sv }
#elaborate hazard_unit

#analyze -format sverilog { ../villano/alu.sv ../villano/aludec.sv ../villano/control_unit.sv ../villano/Decode.sv ../villano/dmem.sv ../villano/Execute.sv ../villano/extend.sv ../villano/Fetch.sv ../villano/hazard_unit.sv ../villano/imem.sv ../villano/maindec.sv ../villano/Mem_data.sv ../villano/mux2.sv ../villano/mux3.sv ../villano/regfile.sv ../villano/top_risc.sv ../villano/Wrback.sv }
#elaborate Fetch

analyze -format sverilog { ../villano/alu.sv ../villano/aludec.sv ../villano/control_unit.sv ../villano/Decode.sv ../villano/dmem.sv ../villano/Execute.sv ../villano/extend.sv ../villano/Fetch.sv ../villano/hazard_unit.sv ../villano/imem.sv ../villano/maindec.sv ../villano/Mem_data.sv ../villano/mux2.sv ../villano/mux3.sv ../villano/regfile.sv ../villano/top_risc.sv ../villano/Wrback.sv }
elaborate alu

## rvscc
#analyze -format sverilog {../rvscc/timescale.sv ../rvscc/rv32i_defs.sv ../rvscc/alu_decoder.sv ../rvscc/alu.sv ../rvscc/cache_memory.sv ../rvscc/control_unit.sv ../rvscc/data_memory_if.sv ../rvscc/data_memory.sv ../rvscc/five_stage_pipeline_datapath.sv ../rvscc/hazard_unit.sv ../rvscc/imm_extend.sv ../rvscc/instr_memory_if.sv ../rvscc/instr_memory.sv ../rvscc/jump_control.sv ../rvscc/main_decoder.sv ../rvscc/pipelined_control_unit.sv ../rvscc/priority_encoder.sv ../rvscc/register_file.sv}
#elaborate five_stage_pipeline_datapath

## uniciclo
#analyze -format sverilog {../Uniciclo/top.sv ../Uniciclo/adder.sv ../Uniciclo/alu.sv ../Uniciclo/aludec.sv ../Uniciclo/controller.sv ../Uniciclo/datapath.sv ../Uniciclo/dmem.sv ../Uniciclo/extend.sv ../Uniciclo/flopr.sv ../Uniciclo/flopenr.sv ../Uniciclo/imem.sv ../Uniciclo/maindec.sv ../Uniciclo/mux2.sv ../Uniciclo/mux3.sv ../Uniciclo/regfile.sv ../Uniciclo/riscvsingle.sv}
#elaborate top

## alu
#analyze -format sverilog ../test_code/alu_test.sv
#elaborate alu

## sumador ff
#analyze -format sverilog ../test_code/sumador_ff.v
#elaborate seq_adder

link

## Constrains Setup
## reloj de 100MHz (10ns)
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
# Nombre del directorio que deseas crear
set directorio "report"

# Crear el directorio usando el comando 'file mkdir'
if {[file exists $directorio]} {
    puts "El directorio $directorio ya existe."
} else {
    file mkdir $directorio
    puts "Directorio $directorio creado exitosamente."
}
# report_clock > report/report_clock.rpt
# analyze_datapath_extraction > report/analyze_datapath_extraction.rpt                                                       

## Compile/Synthesis
#compile_ultra -no_autoungroup
compile -exact_map

## Post-compile Reports
# analyze_datapath > report/analyze_datapath.rpt
#report_resources -hierarchy > report/report_resources.rpt
# report_qor > report/report_qor.rpt
#report_timing > report/report_timing.rpt
#report_area > report/report_area.rpt
# report_power > report/report_power.rpt

## Save Design
write_file -format ddc -hierarchy -out report/uniciclo.ddc
write_file -format verilog -hierarchy -out report/uniciclo.v
write_sdc report/uniciclo.sdc

## Start GUI
#gui_start

# Exit
exit
