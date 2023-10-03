#
# ORCA_TOP
# Define port collections for easier access and constraining
#


set risc_ports(clocks) [get_ports "*clk"]
set risc_ports(mode_reset)  [get_ports "scan_enable test_mode occ_bypass occ_reset prst_n shutdown"]

set risc_ports(test_si) [get_ports test_si*]
set risc_ports(test_so) [get_ports test_so*]

# Filter out the clock ports, scan_en, test_mode and reset.
set risc_ports(inputs)  [remove_from_collection [all_inputs]  "$risc_ports(mode_reset) $risc_ports(clocks) $risc_ports(test_si)"]
set risc_ports(outputs) [remove_from_collection [all_outputs] $risc_ports(test_so)]

set risc_ports(sdram_inputs)  [get_ports sd_* -filter "port_direction == in"]
set risc_ports(sdram_outputs) [get_ports sd_* -filter "port_direction == out"]
set risc_ports(pci_inputs)    [remove_from_collection $risc_ports(inputs)  $risc_ports(sdram_inputs)]
set risc_ports(pci_outputs)   [remove_from_collection $risc_ports(outputs) $risc_ports(sdram_outputs)]

set risc_ports(sd_ddr_outputs) [get_ports "sd_DQ_out*"]
set risc_ports(sd_ddr_inputs)  [get_ports "sd_DQ_in*"]
set risc_ports(sdram_outputs)  [remove_from_collection $risc_ports(sdram_outputs) [add_to_collection $risc_ports(sd_ddr_outputs) "sd_CK sd_CKn"]]

set DRIVING_CELL_CLOCKS NBUFFX16_RVT
set DRIVING_CELL_PORTS NBUFFX4_RVT

return 1
