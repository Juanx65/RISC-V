###################################################################

# Created by write_sdc on Tue Jun 27 18:05:49 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.04 [get_ports {ALUResult[3]}]
set_load -pin_load 0.04 [get_ports {ALUResult[2]}]
set_load -pin_load 0.04 [get_ports {ALUResult[1]}]
set_load -pin_load 0.04 [get_ports {ALUResult[0]}]
set_load -pin_load 0.04 [get_ports Zero]
set_input_transition -max 1  [get_ports {SrcA[3]}]
set_input_transition -min 0.1  [get_ports {SrcA[3]}]
set_input_transition -max 1  [get_ports {SrcA[2]}]
set_input_transition -min 0.1  [get_ports {SrcA[2]}]
set_input_transition -max 1  [get_ports {SrcA[1]}]
set_input_transition -min 0.1  [get_ports {SrcA[1]}]
set_input_transition -max 1  [get_ports {SrcA[0]}]
set_input_transition -min 0.1  [get_ports {SrcA[0]}]
set_input_transition -max 1  [get_ports {SrcB[3]}]
set_input_transition -min 0.1  [get_ports {SrcB[3]}]
set_input_transition -max 1  [get_ports {SrcB[2]}]
set_input_transition -min 0.1  [get_ports {SrcB[2]}]
set_input_transition -max 1  [get_ports {SrcB[1]}]
set_input_transition -min 0.1  [get_ports {SrcB[1]}]
set_input_transition -max 1  [get_ports {SrcB[0]}]
set_input_transition -min 0.1  [get_ports {SrcB[0]}]
set_input_transition -max 1  [get_ports {ALUControl[2]}]
set_input_transition -min 0.1  [get_ports {ALUControl[2]}]
set_input_transition -max 1  [get_ports {ALUControl[1]}]
set_input_transition -min 0.1  [get_ports {ALUControl[1]}]
set_input_transition -max 1  [get_ports {ALUControl[0]}]
set_input_transition -min 0.1  [get_ports {ALUControl[0]}]
