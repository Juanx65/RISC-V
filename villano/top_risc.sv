module top_risc(
    input logic clk,
    input logic rstn,
    output logic [31:0] wr_dataM,
    output logic [31:0] ALU_resultM,
    output logic mem_wrM
    );

logic rst;
assign rst = ~rstn;

//FETCH
logic [31:0] PC_targetE;
logic stallF, stallD, flushD;
logic reg_wrW;
logic [31:0] instrD;
logic [31:0] PCD, PCp4D;
Fetch fetch(.*);

//DECODE
logic flushE;


logic [31:0] resultW;
logic [4:0] rdW;
logic reg_wrE;
logic [1:0] result_srcE;
logic mem_wrE;
logic jumpE;
logic branchE;
logic [2:0] ALU_ctrlE;
logic ALU_srcE;
  
logic [4:0] rs1E, rs2E, rdE, rs1D, rs2D;
logic [31:0] rd1E, rd2E, PCE, imm_extE, PCp4E;
Decode decode(.*);

//EXECUTE

logic result_srcE0;
logic [1:0] fwdAE, fwdBE;
  
logic reg_wrM;
logic [1:0] result_srcM;





logic PC_srcE;
logic [31:0] PCp4M;
logic [4:0] rdM;
Execute execute(.*);

//DATA MEMORY
logic [31:0] ALU_resultW, rd_dataW, PCp4W;
logic [1:0] result_srcW;
Mem_data mem_data(.*);

//WRITEBACK


Wrback wrback(.*);

//HAZARD UNIT
hazard_unit hzd_unit(.*);
endmodule