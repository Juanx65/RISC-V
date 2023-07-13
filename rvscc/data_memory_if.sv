`include "timescale.sv"

interface data_memory_if #(
    parameter int ADDR_SIZE = 32,
    parameter int DATA_SIZE = 32
) (
    input logic clk,
    input logic rst
);
  logic [ADDR_SIZE-1:0] addr;
  logic write_enable;
  logic [DATA_SIZE-1:0] write_data;
  logic [DATA_SIZE-1:0] read_data;
  logic hit;
  logic ready;

  modport datapath(input read_data, output addr, write_enable, write_data);
  modport ram(input clk, rst, addr, write_enable, write_data, output read_data);
  modport cache(input clk, rst, addr, write_enable, write_data, output read_data, hit);
  modport test(input read_data, write_enable, write_data);

  /*
   * Test assertion that should be used against test-core.s firmware.
   * This function checks if the results in data memory are the expected.
   * Must be called each clock cycle.
   * ES NECESARIO PARA LA SIMULACION
   */
  function static void check_fw_test_core_assertions();
    if (write_enable) begin
      if (addr == 'd100 && write_data == 'd25) begin
        $finish;
      end else
        assert (addr == 'd96)
        else $error("Unexpected write address in test-core program");
      $finish;
    end
  endfunction
endinterface

