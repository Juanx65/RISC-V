`include "timescale.sv"

module test_five_stage_pipeline_core ();
  logic clk, rst;
  always #1 clk = ~clk;

  instr_memory_if instr_mem_if ();
  instr_memory instr_mem (
      .instr_mem_if(instr_mem_if.mem)
  );

  data_memory_if data_mem_if (
      .clk(clk),
      .rst(rst)
  );
  data_memory #(.NUM_BLOCKS(128)) data_mem (.data_mem_if(data_mem_if.ram));

  five_stage_pipeline_datapath dut (
      .clk(clk),
      .rst(rst),
      .instr_mem_if(instr_mem_if.datapath),
      .data_mem_if(data_mem_if.datapath)
  );

  always @(posedge clk) data_mem_if.check_fw_test_core_assertions();

  initial begin
    clk = 0;
    rst = 1;
    #4;
    rst = 0;
  end
endmodule
