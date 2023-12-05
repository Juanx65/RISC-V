//`timescale 1ns / 10ps
module testbench();
    logic clk;
    logic rstn;
    logic [31:0] wr_dataM, ALU_resultM;
    logic mem_wrM;

    // instantiate device to be tested
    top_risc dut(clk, rstn, wr_dataM, ALU_resultM, mem_wrM);
    
    logic reset;
    assign rstn = ~reset;
    // initialize test
    initial
    begin
        reset <= 1; # 22; reset <= 0;
    end

    // generate clock to sequence tests
    always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end

    // check results
    always @(negedge clk) begin
        //#500; $stop;
        if(mem_wrM) begin
                if(ALU_resultM === 100 & wr_dataM === 25) begin
                $display("Simulation succeeded");
                $stop;
                end else if (ALU_resultM !== 96) begin
                    $display("Simulation failed");
                    $stop;
                end
            end
    end
endmodule