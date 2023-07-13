`include "timescale.sv"

module pipelined_control_unit (
    input logic [6:0] opcode,
    input logic [2:0] funct_3,
    input logic [6:0] funct_7,
    output logic reg_write,
    output logic [1:0] result_src,
    output logic mem_write,
    output logic branch,
    output logic [2:0] alu_ctrl,
    output logic alu_src,
    output logic [1:0] imm_src
);
  logic [1:0] alu_op;
  main_decoder main_decoder (
      .opcode(opcode),
      .branch(branch),
      .jump(jump),
      .result_src(result_src),
      .mem_write(mem_write),
      .alu_src(alu_src),
      .imm_src(imm_src),
      .reg_write(reg_write),
      .alu_op(alu_op)
  );

  alu_decoder alu_decoder (
      .opcode_5(opcode[5]),
      .funct_3(funct_3),
      .funct_7_5(funct_7[5]),
      .alu_op(alu_op),
      .alu_ctrl(alu_ctrl),
      .branch_neg(branch_neg)
  );
endmodule
