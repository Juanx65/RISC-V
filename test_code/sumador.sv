module adder1bit(input a, input b, input cin, output sum, output cout);

  assign sum = a ^ b ^ cin; // sum bit calculation
  assign cout = (a & b) | (a & cin) | (b & cin); // carry bit calculation

endmodule