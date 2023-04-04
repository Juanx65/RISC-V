`timescale 1ns / 1ps
module adder1bit(input a, input b, input cin, output sum, output cout);

  assign sum = a ^ b ^ cin; // sum bit calculation
  assign cout = (a & b) | (a & cin) | (b & cin); // carry bit calculation

endmodule

module test_adder1bit();

  // Declare signals to connect to the DUT inputs and outputs
  logic a, b, cin, sum, cout;

  // Instantiate the DUT
  adder1bit dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    // Test case 1: a=0, b=0, cin=0
    a = 0; b = 0; cin = 0;
    #10 a = 0; b = 0; cin = 1;
    #10 a = 0; b = 1; cin = 0;
    #10 a = 0; b = 1; cin = 1;
    #10 a = 1; b = 0; cin = 0;
    #10 a = 1; b = 0; cin = 1;
    #10 a = 1; b = 1; cin = 0;
    #10 a = 1; b = 1; cin = 1;
  end
endmodule