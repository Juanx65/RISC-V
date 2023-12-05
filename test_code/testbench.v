
module testbench;

  // Parámetros
  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 5;
  parameter RAM_DEPTH = 1 << ADDR_WIDTH;

  // Señales
  reg clk;
  reg resetn;

  reg [DATA_WIDTH-1:0] imem_wdata;
  reg imem_web;
  reg [ADDR_WIDTH-1:0] imem_addr_input;

  // Instancia del módulo principal
  main #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .RAM_DEPTH(RAM_DEPTH)) uut (
    .clk(clk),
    .resetn(resetn),
    .imem_wdata(imem_wdata),
    .imem_web(imem_web),
    .imem_addr_input(imem_addr_input)
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
    imem_addr_input = 5'b0;

    // Secuencia de instrucciones 
    // Añade aquí las instrucciones con tiempos y señales adecuadas.
    // Ejemplo:
    #20 imem_wdata = 32'h00500113; imem_web = 0; imem_addr_input = 5'd0;
    #20 imem_wdata = 32'h00C00193; imem_web = 0; imem_addr_input = 5'd1;
    #20 imem_wdata = 32'hFF718393; imem_web = 0; imem_addr_input = 5'd2;
    #20 imem_wdata = 32'h0023E233; imem_web = 0; imem_addr_input = 5'd3;
    #20 imem_wdata = 32'h0041F2B3; imem_web = 0; imem_addr_input = 5'd4;
    #20 imem_wdata = 32'h004282B3; imem_web = 0; imem_addr_input = 5'd5;
    #20 imem_wdata = 32'h02728863; imem_web = 0; imem_addr_input = 5'd6;
    #20 imem_wdata = 32'h0041A233; imem_web = 0; imem_addr_input = 5'd7;
    #20 imem_wdata = 32'h0041A233; imem_web = 0; imem_addr_input = 5'd8;
    #20 imem_wdata = 32'h00020463; imem_web = 0; imem_addr_input = 5'd9;
    #20 imem_wdata = 32'h00000293; imem_web = 0; imem_addr_input = 5'd10;
    #20 imem_wdata = 32'h0023A233; imem_web = 0; imem_addr_input = 5'd11;
    #20 imem_wdata = 32'h005203B3; imem_web = 0; imem_addr_input = 5'd12;
    #20 imem_wdata = 32'h402383B3; imem_web = 0; imem_addr_input = 5'd13;
    #20 imem_wdata = 32'h0471AA23; imem_web = 0; imem_addr_input = 5'd14;
    #20 imem_wdata = 32'h06002103; imem_web = 0; imem_addr_input = 5'd15;
    #20 imem_wdata = 32'h005104B3; imem_web = 0; imem_addr_input = 5'd16;
    #20 imem_wdata = 32'h008001EF; imem_web = 0; imem_addr_input = 5'd17;
    #20 imem_wdata = 32'h00100113; imem_web = 0; imem_addr_input = 5'd18;
    #20 imem_wdata = 32'h00910133; imem_web = 0; imem_addr_input = 5'd19;
    #20 imem_wdata = 32'h0221A023; imem_web = 0; imem_addr_input = 5'd20;
    #20 imem_wdata = 32'h00210063; imem_web = 0; imem_addr_input = 5'd21;
    #20 imem_web = 1'b1; 

    // Reset
    #20 resetn = 1'b1;

    #1000 $finish;
  end

endmodule
