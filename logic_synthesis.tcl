#### run this command as: dc_shell -f config_tcl.tcl

# set sykwalk130 cell library

set link_library [list sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v65.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v56.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v65.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v76.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v76.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v40.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v60.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v60.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v28.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v35.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v40.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v44.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v76.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_025C_1v80.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_100C_1v80.db]
set target_library [list sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v65.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_100C_1v95.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v56.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v65.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v76.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ff_n40C_1v76.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v40.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v60.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_100C_1v60.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v28.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v35.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v40.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v44.db /home/usuario12/test1/sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__ss_n40C_1v76.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_025C_1v80.db sky130_fd_sc_hd/db_nldm/sky130_fd_sc_hd__tt_100C_1v80.db]
set symbol_library ""

#read, analyze and elaborate the rtl code
read_file -format sverilog {/home/usuario12/test1/sumador.sv}
analyze -library WORK -format verilog {/home/usuario12/test1/sumador.sv}
elaborate adder1bit -architecture verilog -library WORK
analyze {}

#provide constraints
#create_clock -name "clk" -period 10 -waveform { 5 10 }
set_max_area 8000
set_max_fanout 8 adder1bit
set_max_transition 5 adder1bit

#compile the rtl code
compile -exact_map

#report generation
file mkdir report
write -hierarchy -format verilog -output /home/usuario12/test1/report/sumador_gtlvl.v
write_sdc -nosplit -version 2.0 /home/usuario12/test1/report/sumador.sdc
report_area -hierarchy > /home/usuario12/test1/report/sumador.area
report_timing > /home/usuario12/test1/report/sumador.timing
report_power > /home/usuario12/test1/report/sumador.power

#start GUI
gui_start