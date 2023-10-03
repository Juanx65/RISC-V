set_parasitic_parameters -early_spec maxTLU -late_spec maxTLU
set_temperature 100
set_process_number 0.99
set_process_label typical
set_voltage 0.80  -object_list VPWR
set_voltage 0.00  -object_list VGND

set_timing_derate -early 0.93 -cell_delay -net_delay

## falta setear las loads "set_load 100 $risc_ports(pci_outputs)" pero primero hay q setear los puertos uff
