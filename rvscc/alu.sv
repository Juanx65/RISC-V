`include "timescale.sv"
import rv32i_defs::*;

module alu (
    input logic [OperandSize-1:0] a,
    input logic [OperandSize-1:0] b,
    input alu_opcode_t operation,
    output logic [OperandSize-1:0] result,
    output logic [3:0] status
);
  logic n, z, c, v;
  always_comb begin
    case (operation)
      SUM: begin
        {c, result} = a + b;
        v = (result[OperandSize-1] & !a[OperandSize-1] & !b[OperandSize-1]) |
            (!result[OperandSize-1] & a[OperandSize-1] & b[OperandSize-1]);
      end
      SUB: begin
        {c, result} = a - b;
        v = (result[OperandSize-1] & !a[OperandSize-1] & !b[OperandSize-1]) |
            (!result[OperandSize-1] & a[OperandSize-1] & !b[OperandSize-1]);
      end
      OR: begin
        result = a | b;
        c = 'b0;
        v = 'b0;
      end
      AND: begin
        result = a & b;
        c = 'b0;
        v = 'b0;
      end
      SLT: begin
        result = {31'd0, a < b};
        c = 'b0;
        v = 'b0;
      end
      default: begin
        result = 'dx;
        c = 1'bx;
        v = 1'bx;
      end
    endcase
    n = result[OperandSize-1];
    z = (result == '0);
    status = {n, z, c, v};
  end
endmodule
