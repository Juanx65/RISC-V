#
# ORCA_TOP
# Define port collections for easier access and constraining
#


set orca_ports(clocks) [get_ports "*clk"]
set orca_ports(mode_reset)  [get_ports "scan_enable test_mode occ_bypass occ_reset prst_n shutdown"]

set orca_ports(test_si) [get_ports test_si*]
set orca_ports(test_so) [get_ports test_so*]

# Filter out the clock ports, scan_en, test_mode and reset.
set orca_ports(inputs)  [remove_from_collection [all_inputs]  "$orca_ports(mode_reset) $orca_ports(clocks) $orca_ports(test_si)"]
set orca_ports(outputs) [remove_from_collection [all_outputs] $orca_ports(test_so)]

set orca_ports(sdram_inputs)  [get_ports sd_* -filter "port_direction == in"]
set orca_ports(sdram_outputs) [get_ports sd_* -filter "port_direction == out"]
set orca_ports(pci_inputs)    [remove_from_collection $orca_ports(inputs)  $orca_ports(sdram_inputs)]
set orca_ports(pci_outputs)   [remove_from_collection $orca_ports(outputs) $orca_ports(sdram_outputs)]

set orca_ports(sd_ddr_outputs) [get_ports "sd_DQ_out*"]
set orca_ports(sd_ddr_inputs)  [get_ports "sd_DQ_in*"]
set orca_ports(sdram_outputs)  [remove_from_collection $orca_ports(sdram_outputs) [add_to_collection $orca_ports(sd_ddr_outputs) "sd_CK sd_CKn"]]

set DRIVING_CELL_CLOCKS NBUFFX16_RVT
set DRIVING_CELL_PORTS NBUFFX4_RVT

return 1
