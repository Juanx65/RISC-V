`include "timescale.sv"

module alu_decoder (
    input logic opcode_5,
    input logic [2:0] funct_3,
    input logic funct_7_5,
    input logic [1:0] alu_op,
    output logic [2:0] alu_ctrl,
    output logic branch_neg
);
  always_comb begin
    casez ({
      alu_op, funct_3, opcode_5, funct_7_5
    })
      'b00?????: begin
        alu_ctrl   = 3'b000;  // lw sw
        branch_neg = 1'dx;
      end
      'b01000??: begin
        alu_ctrl   = 3'b001;  // beq
        branch_neg = 1'd1;
      end
      'b01100??: begin
        alu_ctrl   = 3'b101;  // blt
        branch_neg = 1'd0;
      end
      'b01101??: begin
        alu_ctrl   = 3'b101;  // bge
        branch_neg = 1'd1;
      end
      'b1000000: begin
        alu_ctrl   = 3'b000;  // add
        branch_neg = 1'dx;
      end
      'b1000001: begin
        alu_ctrl   = 3'b000;  // add
        branch_neg = 1'dx;
      end
      'b1000010: begin
        alu_ctrl   = 3'b000;  // add
        branch_neg = 1'dx;
      end
      'b1000011: begin
        alu_ctrl   = 3'b001;  // sub
        branch_neg = 1'dx;
      end
      'b10010??: begin
        alu_ctrl   = 3'b101;  // slt
        branch_neg = 1'dx;
      end
      'b10110??: begin
        alu_ctrl   = 3'b011;  // or
        branch_neg = 1'dx;
      end
      'b10111??: begin
        alu_ctrl   = 3'b010;  // and
        branch_neg = 1'dx;
      end
      default: begin
        alu_ctrl   = 3'bxxx;
        branch_neg = 1'dx;
      end
    endcase
  end
endmodule
