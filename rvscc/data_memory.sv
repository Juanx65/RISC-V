`include "timescale.sv"

import rv32i_defs::*;

module data_memory #(
    parameter int BLOCK_SIZE = 8,
    parameter int NUM_BLOCKS = 32
) (
    data_memory_if.ram data_mem_if
);
  logic [NUM_BLOCKS-1:0][BLOCK_SIZE-1:0] mem;

  assign data_mem_if.read_data = {
    mem[data_mem_if.addr+'d3],
    mem[data_mem_if.addr+'d2],
    mem[data_mem_if.addr+'d1],
    mem[data_mem_if.addr+'d0]
  };

  always_ff @(posedge data_mem_if.clk) begin
    if (data_mem_if.rst) mem <= '{default: '0};
    else if (data_mem_if.write_enable)
      {mem[data_mem_if.addr+'d3],
       mem[data_mem_if.addr+'d2],
       mem[data_mem_if.addr+'d1],
       mem[data_mem_if.addr+'d0]} <= data_mem_if.write_data;
  end
endmodule
