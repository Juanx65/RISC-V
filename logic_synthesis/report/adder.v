/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5-4
// Date      : Fri Jun 23 18:08:48 2023
/////////////////////////////////////////////////////////////


module seq_adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;

  wire   [8:1] carry;

  sky130_fd_sc_hd__fa_1 U1_7 ( .A(A[7]), .B(B[7]), .CIN(carry[7]), .COUT(
        SUM[8]), .SUM(SUM[7]) );
  sky130_fd_sc_hd__fa_1 U1_0 ( .A(A[0]), .B(B[0]), .CIN(CI), .COUT(carry[1]), 
        .SUM(SUM[0]) );
  sky130_fd_sc_hd__fa_1 U1_6 ( .A(A[6]), .B(B[6]), .CIN(carry[6]), .COUT(
        carry[7]), .SUM(SUM[6]) );
  sky130_fd_sc_hd__fa_1 U1_5 ( .A(A[5]), .B(B[5]), .CIN(carry[5]), .COUT(
        carry[6]), .SUM(SUM[5]) );
  sky130_fd_sc_hd__fa_1 U1_4 ( .A(A[4]), .B(B[4]), .CIN(carry[4]), .COUT(
        carry[5]), .SUM(SUM[4]) );
  sky130_fd_sc_hd__fa_1 U1_3 ( .A(A[3]), .B(B[3]), .CIN(carry[3]), .COUT(
        carry[4]), .SUM(SUM[3]) );
  sky130_fd_sc_hd__fa_1 U1_2 ( .A(A[2]), .B(B[2]), .CIN(carry[2]), .COUT(
        carry[3]), .SUM(SUM[2]) );
  sky130_fd_sc_hd__fa_1 U1_1 ( .A(A[1]), .B(B[1]), .CIN(carry[1]), .COUT(
        carry[2]), .SUM(SUM[1]) );
endmodule


module seq_adder ( clk, rst, input_a, input_b, salida );
  input [7:0] input_a;
  input [7:0] input_b;
  output [8:0] salida;
  input clk, rst;
  wire   carry, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, N44, N45, n1, n6;
  wire   [7:0] sum;
  wire   [7:0] input_a_ff;
  wire   [7:0] input_b_ff;

  sky130_fd_sc_hd__edfxtp_1 \salida_reg[0]  ( .D(sum[0]), .DE(n6), .CLK(clk), 
        .Q(salida[0]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[1]  ( .D(sum[1]), .DE(n6), .CLK(clk), 
        .Q(salida[1]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[2]  ( .D(sum[2]), .DE(n6), .CLK(clk), 
        .Q(salida[2]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[3]  ( .D(sum[3]), .DE(n6), .CLK(clk), 
        .Q(salida[3]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[4]  ( .D(sum[4]), .DE(n6), .CLK(clk), 
        .Q(salida[4]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[5]  ( .D(sum[5]), .DE(n6), .CLK(clk), 
        .Q(salida[5]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[6]  ( .D(sum[6]), .DE(n6), .CLK(clk), 
        .Q(salida[6]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[7]  ( .D(sum[7]), .DE(n6), .CLK(clk), 
        .Q(salida[7]) );
  sky130_fd_sc_hd__edfxtp_1 \salida_reg[8]  ( .D(carry), .DE(n6), .CLK(clk), 
        .Q(salida[8]) );
  sky130_fd_sc_hd__nor2b_1 U4 ( .B_N(input_b[7]), .A(rst), .Y(N45) );
  sky130_fd_sc_hd__nor2b_1 U5 ( .B_N(input_b[6]), .A(rst), .Y(N44) );
  sky130_fd_sc_hd__nor2b_1 U7 ( .B_N(input_b[5]), .A(rst), .Y(N43) );
  sky130_fd_sc_hd__nor2b_1 U8 ( .B_N(input_b[4]), .A(rst), .Y(N42) );
  sky130_fd_sc_hd__nor2b_1 U9 ( .B_N(input_b[3]), .A(rst), .Y(N41) );
  sky130_fd_sc_hd__nor2b_1 U10 ( .B_N(input_b[2]), .A(rst), .Y(N40) );
  sky130_fd_sc_hd__nor2b_1 U11 ( .B_N(input_b[1]), .A(rst), .Y(N39) );
  sky130_fd_sc_hd__nor2b_1 U12 ( .B_N(input_b[0]), .A(rst), .Y(N38) );
  sky130_fd_sc_hd__nor2b_1 U13 ( .B_N(input_a[7]), .A(rst), .Y(N37) );
  sky130_fd_sc_hd__nor2b_1 U14 ( .B_N(input_a[6]), .A(rst), .Y(N36) );
  sky130_fd_sc_hd__nor2b_1 U15 ( .B_N(input_a[5]), .A(rst), .Y(N35) );
  sky130_fd_sc_hd__nor2b_1 U16 ( .B_N(input_a[4]), .A(rst), .Y(N34) );
  sky130_fd_sc_hd__nor2b_1 U17 ( .B_N(input_a[3]), .A(rst), .Y(N33) );
  sky130_fd_sc_hd__nor2b_1 U18 ( .B_N(input_a[2]), .A(rst), .Y(N32) );
  sky130_fd_sc_hd__nor2b_1 U19 ( .B_N(input_a[1]), .A(rst), .Y(N31) );
  sky130_fd_sc_hd__nor2b_1 U20 ( .B_N(input_a[0]), .A(rst), .Y(N30) );
  sky130_fd_sc_hd__nor2b_1 U21 ( .B_N(N20), .A(rst), .Y(N29) );
  sky130_fd_sc_hd__nor2b_1 U22 ( .B_N(N19), .A(rst), .Y(N28) );
  sky130_fd_sc_hd__nor2b_1 U23 ( .B_N(N18), .A(rst), .Y(N27) );
  sky130_fd_sc_hd__nor2b_1 U24 ( .B_N(N17), .A(rst), .Y(N26) );
  sky130_fd_sc_hd__nor2b_1 U25 ( .B_N(N16), .A(rst), .Y(N25) );
  sky130_fd_sc_hd__nor2b_1 U26 ( .B_N(N15), .A(rst), .Y(N24) );
  sky130_fd_sc_hd__nor2b_1 U27 ( .B_N(N14), .A(rst), .Y(N23) );
  sky130_fd_sc_hd__nor2b_1 U28 ( .B_N(N13), .A(rst), .Y(N22) );
  sky130_fd_sc_hd__nor2b_1 U29 ( .B_N(N12), .A(rst), .Y(N21) );
  seq_adder_DW01_add_0 add_1_root_add_25_2 ( .A({n1, input_a_ff}), .B({n1, 
        input_b_ff}), .CI(carry), .SUM({N20, N19, N18, N17, N16, N15, N14, N13, 
        N12}) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[7]  ( .D(N45), .CLK(clk), .Q(
        input_b_ff[7]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[7]  ( .D(N37), .CLK(clk), .Q(
        input_a_ff[7]) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[6]  ( .D(N44), .CLK(clk), .Q(
        input_b_ff[6]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[6]  ( .D(N36), .CLK(clk), .Q(
        input_a_ff[6]) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[5]  ( .D(N43), .CLK(clk), .Q(
        input_b_ff[5]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[5]  ( .D(N35), .CLK(clk), .Q(
        input_a_ff[5]) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[4]  ( .D(N42), .CLK(clk), .Q(
        input_b_ff[4]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[4]  ( .D(N34), .CLK(clk), .Q(
        input_a_ff[4]) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[3]  ( .D(N41), .CLK(clk), .Q(
        input_b_ff[3]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[3]  ( .D(N33), .CLK(clk), .Q(
        input_a_ff[3]) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[2]  ( .D(N40), .CLK(clk), .Q(
        input_b_ff[2]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[2]  ( .D(N32), .CLK(clk), .Q(
        input_a_ff[2]) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[1]  ( .D(N39), .CLK(clk), .Q(
        input_b_ff[1]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[1]  ( .D(N31), .CLK(clk), .Q(
        input_a_ff[1]) );
  sky130_fd_sc_hd__dfxtp_1 carry_reg ( .D(N29), .CLK(clk), .Q(carry) );
  sky130_fd_sc_hd__dfxtp_1 \input_b_ff_reg[0]  ( .D(N38), .CLK(clk), .Q(
        input_b_ff[0]) );
  sky130_fd_sc_hd__dfxtp_1 \input_a_ff_reg[0]  ( .D(N30), .CLK(clk), .Q(
        input_a_ff[0]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[0]  ( .D(N21), .CLK(clk), .Q(sum[0]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[1]  ( .D(N22), .CLK(clk), .Q(sum[1]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[2]  ( .D(N23), .CLK(clk), .Q(sum[2]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[3]  ( .D(N24), .CLK(clk), .Q(sum[3]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[4]  ( .D(N25), .CLK(clk), .Q(sum[4]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[5]  ( .D(N26), .CLK(clk), .Q(sum[5]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[6]  ( .D(N27), .CLK(clk), .Q(sum[6]) );
  sky130_fd_sc_hd__dfxtp_1 \sum_reg[7]  ( .D(N28), .CLK(clk), .Q(sum[7]) );
  sky130_fd_sc_hd__inv_2 U30 ( .A(rst), .Y(n6) );
  sky130_fd_sc_hd__conb_1 U31 ( .LO(n1) );
endmodule

