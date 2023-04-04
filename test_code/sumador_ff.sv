module seq_adder(
  input logic clk,
  input logic rst,
  input logic [7:0] input_a,
  input logic [7:0] input_b,
  output logic [8:0] salida
);
  logic [7:0] sum;
  logic carry;
  
  always_ff @(posedge clk)
  begin
    if (rst) begin
      sum <= 8'b0;
      carry <= 1'b0;
    end else begin
      {carry, sum} <= input_a + input_b + carry;
    end
  end
  
  assign salida = {carry, sum};
endmodule
