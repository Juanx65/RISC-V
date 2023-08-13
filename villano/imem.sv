module imem(
    //input clk,
    //input logic [31:0] addr_test, inst_test,
    input logic [31:0] a,
    output logic [31:0] rd);

logic [31:0] RAM[31:0]; // era 63:0

//always_ff @(posedge clk)
   // RAM[addr_test] <= inst_test;
assign RAM[0] = 32'h00500113;
assign RAM[1] = 32'h00C00193;
assign RAM[2] = 32'hFF718393;
assign RAM[3] = 32'h0023E233;
assign RAM[4] = 32'h0041F2B3;     
assign RAM[5] = 32'h004282B3;
assign RAM[6] = 32'h02728863;
assign RAM[7] = 32'h0041A233;
assign RAM[8] = 32'h00020463;
assign RAM[9] = 32'h00000293;
assign RAM[10] = 32'h0023A233;
assign RAM[11] = 32'h005203B3;
assign RAM[12] = 32'h402383B3;
assign RAM[13] = 32'h0471AA23;
assign RAM[14] = 32'h06002103;
assign RAM[15] = 32'h005104B3;
assign RAM[16] = 32'h008001EF;
assign RAM[17] = 32'h00100113;
assign RAM[18] = 32'h00910133;
assign RAM[19] = 32'h0221A023;
assign RAM[20] = 32'h00210063;
//initial
   //$readmemh("Uniciclo/riscvtest.txt",RAM);
assign rd = RAM[a[7:2]]; // word aligned
endmodule
