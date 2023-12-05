
// Módulo principal que conecta PicoRV32 con SRAM
module main #(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 5,
	parameter RAM_DEPTH = 1 << ADDR_WIDTH
) (
	input clk,
	input resetn,
	input [DATA_WIDTH-1:0] imem_wdata,
	input imem_web,
	input [ADDR_WIDTH-1:0] imem_addr_input

); //UART POR DEFINIR
  
	wire [ADDR_WIDTH-1:0] mem_addr;
	wire [ADDR_WIDTH-1:0] pre_mem_addr;
	wire [ADDR_WIDTH-1:0] dmem_addr;
	wire [ADDR_WIDTH-1:0] imem_addr;
	wire [DATA_WIDTH-1:0] dmem_wdata;
	wire [DATA_WIDTH-1:0] masked_data;
	wire [DATA_WIDTH-1:0] mem_rdata;
	wire [DATA_WIDTH-1:0] imem_rdata;
	wire [DATA_WIDTH-1:0] dmem_rdata;
	wire [ 3:0] mem_wstrb;
	wire mem_instr;
	wire mem_valid;
	
	assign mem_rdata = mem_instr ? imem_rdata : dmem_rdata;
	
    // Enmascaramiento para cada bloque de 8 bits
	assign masked_data[7:0]   = mem_wstrb[0] ? dmem_wdata[7:0]   : 8'b0;
	assign masked_data[15:8]  = mem_wstrb[1] ? dmem_wdata[15:8]  : 8'b0;
	assign masked_data[23:16] = mem_wstrb[2] ? dmem_wdata[23:16] : 8'b0;
	assign masked_data[31:24] = mem_wstrb[3] ? dmem_wdata[31:24] : 8'b0;
	

	wire [31:0] extended_mem_addr;
	assign pre_mem_addr = extended_mem_addr[ADDR_WIDTH-1:0];
	assign mem_addr = pre_mem_addr >> 2;

	// Instanciando PicoRV32
	/* 
	picorv32 cpu(
		.clk(clk),
		.resetn(resetn),
		.mem_addr(extended_mem_addr),
		.mem_wdata(dmem_wdata),
		.mem_rdata(mem_rdata),
		.mem_wstrb(mem_wstrb),
		.mem_valid(mem_valid),
		.mem_instr(mem_instr),
		.mem_ready(imem_web)
	); 
	*/
	top_risc cpu (
		.clk(clk),
		.rstn(resetn), 
		.wr_dataM(), 
		.ALU_resultM(), 
		.mem_wrM()
	);

	assign imem_addr = imem_web ? mem_addr : imem_addr_input;
	// Instanciando SRAM
	//INSTRUCCIONES
	sram_32_32_sky130A imem(
		.clk0(clk),
		.addr0({1'b0,imem_addr}),
		.din0(imem_wdata),//debería venir de la uart
		.dout0(imem_rdata),
		.csb0(1'b0),
		.web0(imem_web) //depende de la uart
	);
	wire dmem_web;
	assign dmem_web = ~(mem_valid && ~mem_instr);
	// Instanciando SRAM
	//DATOS
	sram_32_32_sky130A dmem(
		.clk0(clk),
		.addr0({1'b0, mem_addr}),
		.din0(masked_data), 
		.dout0(dmem_rdata),
		.csb0(1'b0),
		.web0(dmem_web)
	);
  
endmodule