`include "timescale.sv"

module test_five_stage_pipeline_core ();
  logic clk, rst;
  always #1 clk = ~clk;

  instr_memory_if instr_mem_if ();
  instr_memory #(
      //.FILE_PATH("../fw/test/test-core.mem")  // lo hardcodie en el top file porque o sino muere la sintesis
  ) instr_mem (
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
    #1000;
    $error("Program execution timeout");
  end
endmodule

/* function static void next_instr();
    addr = addr + 'd4; 
endfunction 
 */
/* function static void check_fw_test_core_assertions();
    if (write_enable) begin
      if (addr == 'd100 && write_data == 'd25) begin
        $finish;
      end else
        assert (addr == 'd96)
        else $error("Unexpected write address in test-core program");
      $finish;
    end
  endfunction */