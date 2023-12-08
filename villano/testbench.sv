module testbench;

  // Parámetros
  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 5;
  parameter RAM_DEPTH = 1 << ADDR_WIDTH;

  logic [31:0] wr_dataM, ALU_resultM;
  logic mem_wrM;

  // Señales
  logic clk;
  logic resetn;

  logic [DATA_WIDTH-1:0] imem_wdata;
  logic imem_web;
  logic [32:0] imem_addr_input;

  top_risc dut(
    .clk(clk),
    .rstn(resetn),
    .imem_din(imem_wdata),
    .imem_web(imem_web),
    .imem_addr(imem_addr_input),
    .wr_dataM(wr_dataM), 
    .ALU_resultM(ALU_resultM), 
    .mem_wrM(mem_wrM)
);

  // Generación de reloj
  always #10 clk = ~clk;

  // Inicialización y secuencia de prueba
  initial begin
    // Inicializar señales
    clk = 1'b0;  
    resetn = 1'b0;
    imem_wdata = 32'b0;
    imem_web = 1'b1;
    imem_addr_input = 32'b0;

    // Secuencia de instrucciones 
    // Añade aquí las instrucciones con tiempos y señales adecuadas.
    // Ejemplo:
    
    #30 imem_wdata = 32'h00500113; imem_web = 0; imem_addr_input = 32'd0;
    #20 imem_wdata = 32'h00C00193; imem_web = 0; imem_addr_input = 32'd4;
    #20 imem_wdata = 32'hFF718393; imem_web = 0; imem_addr_input = 32'd8;
    #20 imem_wdata = 32'h0023E233; imem_web = 0; imem_addr_input = 32'd12;
    #20 imem_wdata = 32'h0041F2B3; imem_web = 0; imem_addr_input = 32'd16;
    #20 imem_wdata = 32'h004282B3; imem_web = 0; imem_addr_input = 32'd20;
    #20 imem_wdata = 32'h02728863; imem_web = 0; imem_addr_input = 32'd24;
    #20 imem_wdata = 32'h0041A233; imem_web = 0; imem_addr_input = 32'd28;
    #20 imem_wdata = 32'h00020463; imem_web = 0; imem_addr_input = 32'd32;
    #20 imem_wdata = 32'h00000293; imem_web = 0; imem_addr_input = 32'd36;
    #20 imem_wdata = 32'h0023A233; imem_web = 0; imem_addr_input = 32'd40;
    #20 imem_wdata = 32'h005203B3; imem_web = 0; imem_addr_input = 32'd44;
    #20 imem_wdata = 32'h402383B3; imem_web = 0; imem_addr_input = 32'd48;
    #20 imem_wdata = 32'h0471AA23; imem_web = 0; imem_addr_input = 32'd52;
    #20 imem_wdata = 32'h06002103; imem_web = 0; imem_addr_input = 32'd56;
    #20 imem_wdata = 32'h005104B3; imem_web = 0; imem_addr_input = 32'd60;
    #20 imem_wdata = 32'h008001EF; imem_web = 0; imem_addr_input = 32'd64;
    #20 imem_wdata = 32'h00100113; imem_web = 0; imem_addr_input = 32'd68;
    #20 imem_wdata = 32'h00910133; imem_web = 0; imem_addr_input = 32'd72;
    #20 imem_wdata = 32'h0221A023; imem_web = 0; imem_addr_input = 32'd76;
    #20 imem_wdata = 32'h00210063; imem_web = 0; imem_addr_input = 32'd80;
    #20 imem_web = 1'b1; 

    // Reset
    #50 resetn = 1'b1;
    end
    
    always_ff @(negedge clk) begin
    if(mem_wrM) begin
            if(ALU_resultM === 100 & wr_dataM === 25) begin
              $display("Simulation succeeded");
              $stop;
            end else if (ALU_resultM !== 96) begin
                $display("Simulation failed");
                $stop;
            end
        end 
      end
  

endmodule