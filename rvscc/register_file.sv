`include "timescale.sv"

import rv32i_defs::*;

module register_file (
    input logic clk,
    input logic rst,
    input logic [RegisterSize-1:0] addr_1,
    input logic [RegisterSize-1:0] addr_2,
    input logic [RegisterSize-1:0] addr_3,
    input logic write_enable_3,
    input logic [OperandSize-1:0] write_data_3,
    output logic [OperandSize-1:0] read_data_1,
    output logic [OperandSize-1:0] read_data_2
);
  logic [OperandSize-1:0] mem  [NumRegisters-1:1];
  logic [OperandSize-1:0] zero;

  always_comb begin
    zero = 'd0;
    if (addr_1 == 'd0) read_data_1 = zero;
    else read_data_1 = mem[addr_1];
    if (addr_2 == 'd0) read_data_2 = zero;
    else read_data_2 = mem[addr_2];
  end

  always_ff @(posedge clk) begin
    if (rst) begin
      mem <= '{default: '0};
      mem[2] <= 'd255;
    end else if (write_enable_3) begin
      mem[addr_3] <= write_data_3;
    end
  end
endmodule
