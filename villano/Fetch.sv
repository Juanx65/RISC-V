module Fetch(
    input logic clk, rst,

    input logic [31:0] PC_targetE, 
    input logic stallF, stallD, flushD,
    input logic PC_srcE,
    output logic [31:0] instrD,
    output logic [31:0] PCD, PCp4D
    
    );
    
logic [31:0] PCp4F,  PCF;
logic [31:0] PCF_new, instrF;

mux2 #(32) pcmux(PCp4F, PC_targetE, PC_srcE, PCF_new);   
assign PCp4F = PCF + 'd4;
imem instr_memory(PCF, instrF);

always_ff @(posedge clk)
begin
    if(rst) PCF <= 'd0;
    else if(stallF) PCF <= PCF;
    else PCF <= PCF_new;
end

always_ff @(posedge clk)
begin
    if(flushD || rst) begin
        instrD <= 'd0;
        PCp4D <= 'd0;
        PCD <= 'd0;
    end
    else if(stallD) begin
        instrD <= instrD;
        PCp4D <= PCp4D;
        PCD <= PCD;
    end
    
    else begin
        instrD <= instrF;
        PCp4D <= PCp4F;
        PCD <= PCF;
    end
end
    
endmodule
