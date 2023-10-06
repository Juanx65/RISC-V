
set_case_analysis 0 test_mode
set_case_analysis 0 scan_enable

# PCI clock at 100 MHz (default)
create_clock -period 10 -name clk [get_ports clk]
