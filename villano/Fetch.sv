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
logic [31:0] PCF_new;

logic [31:0] instrF;

logic [1:0] PC_select;
assign PC_select = {rst, PC_srcE};
mux3 #(32) pcmux(PCp4F, PC_targetE, 32'd0, PC_select, PCF_new);
logic [31:0] addr_rd;
assign addr_rd = stallF ? PCF: PCF_new;
assign PCp4F = PCF + 'd4;
//imem instr_memory(PCF, instrF);
parameter ADDR_WIDTH = 5;
logic [31:0] mem_addr_temp;
logic [31:0] mem_addr_temp2;
logic [ADDR_WIDTH-1:0] mem_addr;
assign mem_addr_temp = imem_web ? addr_rd : imem_addr;
logic [31:0] instrF_mem;
assign mem_addr_temp2 = mem_addr_temp >> 2;
assign mem_addr = mem_addr_temp2[ADDR_WIDTH-1:0];
sram_32_32_sky130A imem(
		.clk0(~clk),
		.addr0({1'b0,mem_addr}),
		.din0(imem_din),//debería venir de la uart
		.dout0(instrF_mem),
		.csb0(1'b0),
		.web0(imem_web), //depende de la uart
        .wmask0(4'b0)
	);


always_ff @(negedge clk)
begin
    if(rst) begin 
        instrF <= 32'd0;
    end
    else if(stallF) begin
        instrF <= instrF;
    end
    else begin
        instrF <= instrF_mem;
    end
end

always_ff @(posedge clk)
begin
    if(rst) begin 
        PCF <= 'd0;
    end
    else if(stallF) begin
        PCF <= PCF;
    end
    else begin
        PCF <= PCF_new;
    end
end

always_ff @(posedge clk)
begin
    if(flushD || rst) begin
        PCp4D <= 'd0;
        PCD <= 'd0;
    end
    else if(stallD) begin
        PCp4D <= PCp4D;
        PCD <= PCD;
    end
    
    else begin
        PCp4D <= PCp4F;
        PCD <= PCF;
    end
end

always_ff @(posedge clk)  begin
    if(flushD || rst) begin
        instrD <= 'd0;
    end
    else if(stallD) begin
        instrD <= instrD;
    end
    
    else begin
        instrD <= instrF;
    end
end
endmodule