module Decode(
    input logic clk, rst,
    
    input logic [31:0] instrD,

    input logic flushE,
    input logic [31:0] PCD, PCp4D,
    
    input logic reg_wrW,
    input logic [31:0] resultW,
    input logic [4:0] rdW,
    
    output logic reg_wrE,
    output logic [1:0] result_srcE,
    output logic mem_wrE,
    output logic jumpE,
    output logic branchE,
    output logic [2:0] ALU_ctrlE,
    output logic ALU_srcE,
    
    output logic [4:0] rs1E, rs2E, rdE, rs1D, rs2D,
    output logic [31:0] rd1E, rd2E, PCE, imm_extE, PCp4E
    );
    
//control inputs
logic [6:0] op;
assign op = instrD[6:0];
logic [2:0] funct3;
assign funct3 = instrD[14:12];
logic funct7b5;
assign funct7b5 = instrD[30];

//control outputs
logic reg_wrD;
logic [1:0] result_srcD;
logic mem_wrD;
logic jumpD;
logic branchD;
logic [2:0] ALU_ctrlD;
logic ALU_srcD;
logic [1:0] imm_srcD;

control_unit ctrl_unit(.*);


//reg file
assign rs1D = instrD[19:15];
assign rs2D = instrD[24:20];
logic [4:0] rdD;
assign rdD = instrD[11:7];
logic [31:0] rd1D, rd2D;//cambiar nombres
regfile reg_file(clk, reg_wrW, rs1D, rs2D, rdW, resultW, rd1D, rd2D);

//extend
logic [31:7] imm_pre_ext;
assign imm_pre_ext = instrD[31:7];
logic [31:0] imm_extD;
extend imm_ext(imm_pre_ext, imm_srcD, imm_extD);


always_ff @(posedge clk)
begin
    if(flushE || rst) begin
        reg_wrE <= 'd0;
        result_srcE <= 'd0;
        mem_wrE <= 'd0;
        jumpE <= 'd0;
        branchE <= 'd0;
        ALU_ctrlE <= 'd0;
        ALU_srcE <= 'd0;
        
        rd1E <= 'd0;
        rd2E <= 'd0;
        
        PCE <= 'd0;
        rs1E <= 'd0;
        rs2E <= 'd0;
        rdE <= 'd0;
        imm_extE <= 'd0;
        PCp4E <= 'd0;
    end
    else begin
        reg_wrE <= reg_wrD;
        result_srcE <= result_srcD;
        mem_wrE <= mem_wrD;
        jumpE <= jumpD;
        branchE <= branchD;
        ALU_ctrlE <= ALU_ctrlD;
        ALU_srcE <= ALU_srcD;
        
        rd1E <= rd1D;
        rd2E <= rd2D;
        
        PCE <= PCD;
        rs1E <= rs1D;
        rs2E <= rs2D;
        rdE <= rdD;
        imm_extE <= imm_extD;
        PCp4E <= PCp4D;
    end
end
    
endmodule