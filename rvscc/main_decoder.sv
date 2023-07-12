`include "timescale.sv"

import rv32i_defs::*;

module main_decoder (
    input logic [6:0] opcode,
    output logic branch,
    output logic jump,
    output logic [1:0] result_src,
    output logic mem_write,
    output logic alu_src,
    output logic [1:0] imm_src,
    output logic reg_write,
    output logic [1:0] alu_op
);
  opcode_fmt_t opcode_enum;
  assign opcode_enum = opcode_fmt_t'(opcode);
  always_comb begin
    case (opcode)
      LOAD: begin  // lw
        reg_write = 1;
        imm_src = 'b00;
        alu_src = 1;
        mem_write = 0;
        result_src = 'b01;
        branch = 0;
        alu_op = 'b00;
        jump = 0;
      end
      STORE: begin  // sw
        reg_write = 0;
        imm_src = 'b01;
        alu_src = 1;
        mem_write = 1;
        result_src = 2'bx0;  // xx?
        branch = 0;
        alu_op = 'b00;
        jump = 0;
      end
      REG_OPERATION: begin  // r-type
        reg_write = 1;
        imm_src = 2'bxx;
        alu_src = 0;
        mem_write = 0;
        result_src = 'b00;
        branch = 0;
        alu_op = 'b10;
        jump = 0;
      end
      BRANCH: begin  // b-type
        reg_write = 0;
        imm_src = 'b10;
        alu_src = 0;
        mem_write = 0;
        result_src = 2'bxx;
        branch = 1;
        alu_op = 'b01;
        jump = 0;
      end
      IMM_OPERATION: begin  // i-type
        reg_write = 1;
        imm_src = 'b00;
        alu_src = 1;
        mem_write = 0;
        result_src = 'b00;
        branch = 0;
        alu_op = 'b10;
        jump = 0;
      end
      JAL: begin  // jal
        reg_write = 1;
        imm_src = 'b11;
        alu_src = 1'bx;
        mem_write = 0;
        result_src = 'b10;
        branch = 0;
        alu_op = 2'bxx;
        jump = 1;
      end
      default: begin
        reg_write = 'b0;
        imm_src = 2'bxx;
        alu_src = 1'bx;
        mem_write = 'b0;
        result_src = 'b00;
        branch = 'b0;
        alu_op = 2'bxx;
        jump = 'b0;
      end
    endcase
  end
endmodule
