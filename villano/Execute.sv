module Execute(
    input logic clk, rst,
    
    input logic reg_wrE,
    input logic [1:0] result_srcE,
    input logic mem_wrE,
    input logic jumpE,
    input logic branchE,
    input logic [2:0] ALU_ctrlE,
    input logic ALU_srcE,
    
    output logic result_srcE0,
    input logic [1:0] fwdAE, fwdBE,
    
    output logic reg_wrM,
    output logic [1:0] result_srcM,
    output logic mem_wrM,
    
    //input logic [4:0] rs1E, rs2E, //en Decode
    input logic [4:0] rdE,
    input logic [31:0] rd1E, rd2E, imm_extE,
    input logic [31:0] PCE, PCp4E,
    
    input logic [31:0] resultW,
    
    output logic [31:0] PC_targetE,
    output logic PC_srcE,

    output logic [31:0] ALU_resultM, wr_dataM, PCp4M,
    output logic [4:0] rdM
    );
    
logic [31:0] srcA, srcB, wr_dataE;
mux3 #(32) srcAmux(rd1E, resultW, ALU_resultM, fwdAE, srcA);
mux3 #(32) srcBmux(rd2E, resultW, ALU_resultM, fwdBE, wr_dataE);
mux2 #(32) srcBmux2(wr_dataE, imm_extE, ALU_srcE, srcB);

logic [31:0] ALU_resultE;
logic zeroE;
alu aluE(srcA, srcB, ALU_ctrlE, ALU_resultE, zeroE);

assign PC_srcE = jumpE || (branchE && zeroE);
assign PC_targetE = PCE + imm_extE;
assign result_srcE0 = result_srcE[0];

always_ff @(posedge clk)
begin
    if(rst) begin
        reg_wrM <= 'd0;
        result_srcM <= 'd0;
        mem_wrM <= 'd0;
        
        ALU_resultM <= 'd0;
        wr_dataM <= 'd0;
        rdM <= 'd0;
        PCp4M <= 'd0;
    end
    else begin
        reg_wrM <= reg_wrE;
        result_srcM <= result_srcE;
        mem_wrM <= mem_wrE;
        
        ALU_resultM <= ALU_resultE;
        wr_dataM <= wr_dataE;
        rdM <= rdE;
        PCp4M <= PCp4E;
    end
end
    
    
endmodule