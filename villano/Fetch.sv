module Fetch(
    input logic clk, rst,

    input logic [31:0] PC_targetE, 
    input logic stallF, stallD, flushD,
    input logic PC_srcE,
    input logic [31:0] imem_din,
    input logic [31:0] imem_addr,
    input logic imem_web,
    output logic [31:0] instrD,
    output logic [31:0] PCD, PCp4D
    
    );
    
logic [31:0] PCp4F,  PCF;
logic [31:0] PCF_new, instrF;

mux2 #(32) pcmux(PCp4F, PC_targetE, PC_srcE, PCF_new);   
assign PCp4F = PCF + 'd4;
//imem instr_memory(PCF, instrF);
parameter ADDR_WIDTH = 5;
logic [31:0] mem_addr_temp;
logic [31:0] mem_addr_temp2;
logic [ADDR_WIDTH-1:0] mem_addr;
assign mem_addr_temp = imem_web ? PCp4F : imem_addr;
assign mem_addr_temp2 = mem_addr_temp >> 2;
assign mem_addr = mem_addr_temp2[ADDR_WIDTH-1:0];
sram_32_32_sky130A imem(
		.clk0(clk),
		.addr0({1'b0,mem_addr}),
		.din0(imem_din),//debería venir de la uart
		.dout0(instrF),
		.csb0(1'b0),
		.web0(imem_web) //depende de la uart
	);

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
