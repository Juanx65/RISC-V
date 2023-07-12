`include "timescale.sv"

import rv32i_defs::*;

interface instr_memory_if #(
    parameter int NUM_INSTR = 32
);
  localparam int AddrSize = $clog2(NUM_INSTR) * 4;
  logic [AddrSize-1:0] addr;
  logic [InstructionSize-1:0] instr;

  modport mem(input addr, output instr);
  modport datapath(input instr, output addr);

  /* function static void next_instr();
    addr = addr + 'd4;
  endfunction */
endinterface
