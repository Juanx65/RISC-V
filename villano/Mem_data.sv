module Mem_data(
    input logic clk, rst,
    
    input logic reg_wrM,
    input logic [1:0] result_srcM,
    input logic mem_wrM,
    
    input logic [31:0] ALU_resultM, wr_dataM, PCp4M,
    input logic [4:0] rdM,
    
    output logic reg_wrW,
    output logic [1:0] result_srcW,
    
    output logic [31:0] ALU_resultW, rd_dataW, PCp4W,
    output logic [4:0] rdW
    );

logic [31:0] rd_dataM;
//dmem data_memory(clk, mem_wrM, ALU_resultM, wr_dataM, rd_dataM);

parameter ADDR_WIDTH = 5;
logic [ADDR_WIDTH-1:0] mem_addr;
assign mem_addr = ALU_resultM[ADDR_WIDTH-1:0] >> 2;
sram_32_32_sky130A dmem(
		.clk0(clk),
		.addr0({1'b0, mem_addr}),
		.din0(wr_dataM), 
		.dout0(rd_dataM),
		.csb0(1'b0),
		.web0(~mem_wrM)
	);

always_ff @(posedge clk)
begin
    if(rst) begin
        reg_wrW <= 'd0;
        result_srcW <= 'd0;
        
        ALU_resultW <= 'd0;
        rd_dataW <= 'd0;
        rdW <= 'd0;
        PCp4W <= 'd0;
    end
    else begin
        reg_wrW <= reg_wrM;
        result_srcW <= result_srcM;
        
        ALU_resultW <= ALU_resultM;
        rd_dataW <= rd_dataM;
        rdW <= rdM;
        PCp4W <= PCp4M;
    end
end
endmodule
