module seq_adder(
  input clk,
  input rst,
  input [7:0] input_a,
  input [7:0] input_b,
  output reg [8:0] salida
);
  reg [7:0] sum;
  reg carry;
  reg [7:0] input_a_ff;
  reg [7:0] input_b_ff;
  reg [8:0] output_ff;
  
  always @(posedge clk)
  begin
    if (rst) begin
      sum <= 8'b0;
      carry <= 1'b0;
      input_a_ff <= 0;
      input_b_ff <= 0;
      output_ff <= 0;
    end else begin
      input_a_ff <= input_a;
      input_b_ff <= input_b;
      {carry, sum} <= input_a_ff + input_b_ff + carry;
      output_ff <= {carry, sum};
    end
  end
  
  assign salida = output_ff;
endmodule

