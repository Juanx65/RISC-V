`include "timescale.sv"

import rv32i_defs::*;

module instr_memory #(
    //parameter string FILE_PATH = "",
    parameter int NUM_INSTR = 32
) (
    instr_memory_if.mem instr_mem_if
);
  // Number of bits referenced with one address
  localparam int BlockSize = 8;
  localparam int NumBlocks = NUM_INSTR * 4;
  logic [BlockSize-1:0] mem [NumBlocks];
  //logic [31:0] mem[63:0];
  
  assign instr_mem_if.instr = {
    mem[instr_mem_if.addr+'d0],
    mem[instr_mem_if.addr+'d1],
    mem[instr_mem_if.addr+'d2],
    mem[instr_mem_if.addr+'d3]
  };

  initial $readmemh("rvscc/rvscctest.mem", mem);
endmodule
