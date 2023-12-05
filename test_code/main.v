
// Módulo principal que conecta PicoRV32 con SRAM
module main (input clk); //UART POR DEFINIR
	parameter DATA_WIDTH = 32 ;
  parameter ADDR_WIDTH = 5 ;
  parameter RAM_DEPTH = 1 << ADDR_WIDTH;
  
	reg [ADDR_WIDTH-1:0] mem_addr;
	reg [DATA_WIDTH-1:0] mem_wdata;
	reg [DATA_WIDTH-1:0] masked_data;
	reg [DATA_WIDTH-1:0] mem_rdata;
	reg [DATA_WIDTH-1:0] imem_rdata;
	reg [DATA_WIDTH-1:0] dmem_rdata;
	reg [ 3:0] mem_wstrb;
	wire mem_instr;
	wire mem_valid;
	
	
	always@(posedge clk)
	begin
		mem_rdata <= mem_instr ? imem_rdata : dmem_rdata;
	end
	
	
    // Enmascaramiento para cada bloque de 8 bits
	always@(posedge clk)
	begin
		masked_data[7:0]   <= mem_wstrb[0] ? mem_rdata[7:0] : 8'b0;
		masked_data[15:8]  <= mem_wstrb[1] ? mem_rdata[15:8] : 8'b0;
		masked_data[23:16] <= mem_wstrb[2] ? mem_rdata[23:16] : 8'b0;
		masked_data[31:24] <= mem_wstrb[3] ? mem_rdata[31:24] : 8'b0;
	end
	
  // Instanciando PicoRV32
  picorv32 cpu(
  .clk(clk),
	.mem_addr({27'b0,mem_addr}),
	.mem_wdata(mem_wdata),
	.mem_rdata(mem_rdata),
	.mem_wstrb(mem_wstrb),
	.mem_valid(mem_valid),
	.mem_ready(1'b1)
  );
	

	
  // Instanciando SRAM
  //INSTRUCCIONES
  sram_32_32_sky130A imem(
  .clk0(clk),
	.addr0({1'b0,mem_addr}),
	.din0(mem_wdata),//debería venir de la uart
	.dout0(imem_rdata),
	.csb0(1'b0),
	.web0(1'b1) //depende de la uart
  );

  // Instanciando SRAM
  //DATOS
  sram_32_32_sky130A dmem(
  .clk0(clk),
	.addr0({1'b0,mem_addr}),
	.din0(masked_data), 
	.dout0(dmem_rdata),
	.csb0(1'b0),
	.web0(~(mem_valid && ~mem_instr))
  );
  
endmodule