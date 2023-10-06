/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5-4
// Date      : Tue Oct  3 12:53:39 2023
/////////////////////////////////////////////////////////////


module mux2_WIDTH32 ( d0, d1, s, y );
  input [31:0] d0;
  input [31:0] d1;
  output [31:0] y;
  input s;
  wire   n1, n2, n3;

  sky130_fd_sc_hd__a22o_1 U2 ( .A1(n1), .A2(d1[9]), .B1(d0[9]), .B2(n3), .X(
        y[9]) );
  sky130_fd_sc_hd__a22o_1 U3 ( .A1(d1[8]), .A2(n1), .B1(d0[8]), .B2(n3), .X(
        y[8]) );
  sky130_fd_sc_hd__a22o_1 U4 ( .A1(d1[7]), .A2(n1), .B1(d0[7]), .B2(n3), .X(
        y[7]) );
  sky130_fd_sc_hd__a22o_1 U5 ( .A1(d1[6]), .A2(n1), .B1(d0[6]), .B2(n3), .X(
        y[6]) );
  sky130_fd_sc_hd__a22o_1 U6 ( .A1(d1[5]), .A2(n1), .B1(d0[5]), .B2(n3), .X(
        y[5]) );
  sky130_fd_sc_hd__a22o_1 U7 ( .A1(d1[4]), .A2(n1), .B1(d0[4]), .B2(n3), .X(
        y[4]) );
  sky130_fd_sc_hd__a22o_1 U8 ( .A1(d1[3]), .A2(n1), .B1(d0[3]), .B2(n3), .X(
        y[3]) );
  sky130_fd_sc_hd__a22o_1 U9 ( .A1(d1[31]), .A2(n1), .B1(d0[31]), .B2(n3), .X(
        y[31]) );
  sky130_fd_sc_hd__a22o_1 U10 ( .A1(d1[30]), .A2(n1), .B1(d0[30]), .B2(n3), 
        .X(y[30]) );
  sky130_fd_sc_hd__a22o_1 U11 ( .A1(d1[2]), .A2(n1), .B1(d0[2]), .B2(n2), .X(
        y[2]) );
  sky130_fd_sc_hd__a22o_1 U12 ( .A1(d1[29]), .A2(n1), .B1(d0[29]), .B2(n3), 
        .X(y[29]) );
  sky130_fd_sc_hd__a22o_1 U13 ( .A1(d1[28]), .A2(n1), .B1(d0[28]), .B2(n2), 
        .X(y[28]) );
  sky130_fd_sc_hd__a22o_1 U14 ( .A1(d1[27]), .A2(n1), .B1(d0[27]), .B2(n3), 
        .X(y[27]) );
  sky130_fd_sc_hd__a22o_1 U15 ( .A1(d1[26]), .A2(n1), .B1(d0[26]), .B2(n3), 
        .X(y[26]) );
  sky130_fd_sc_hd__a22o_1 U16 ( .A1(d1[25]), .A2(n1), .B1(d0[25]), .B2(n3), 
        .X(y[25]) );
  sky130_fd_sc_hd__a22o_1 U17 ( .A1(d1[24]), .A2(n1), .B1(d0[24]), .B2(n3), 
        .X(y[24]) );
  sky130_fd_sc_hd__a22o_1 U18 ( .A1(d1[23]), .A2(n1), .B1(d0[23]), .B2(n3), 
        .X(y[23]) );
  sky130_fd_sc_hd__a22o_1 U19 ( .A1(d1[22]), .A2(n1), .B1(d0[22]), .B2(n3), 
        .X(y[22]) );
  sky130_fd_sc_hd__a22o_1 U20 ( .A1(d1[21]), .A2(n1), .B1(d0[21]), .B2(n3), 
        .X(y[21]) );
  sky130_fd_sc_hd__a22o_1 U21 ( .A1(d1[20]), .A2(n1), .B1(d0[20]), .B2(n2), 
        .X(y[20]) );
  sky130_fd_sc_hd__a22o_1 U22 ( .A1(d1[1]), .A2(n1), .B1(d0[1]), .B2(n3), .X(
        y[1]) );
  sky130_fd_sc_hd__a22o_1 U23 ( .A1(d1[19]), .A2(n1), .B1(d0[19]), .B2(n3), 
        .X(y[19]) );
  sky130_fd_sc_hd__a22o_1 U24 ( .A1(d1[18]), .A2(n1), .B1(d0[18]), .B2(n3), 
        .X(y[18]) );
  sky130_fd_sc_hd__a22o_1 U25 ( .A1(d1[17]), .A2(n1), .B1(d0[17]), .B2(n2), 
        .X(y[17]) );
  sky130_fd_sc_hd__a22o_1 U26 ( .A1(d1[16]), .A2(n1), .B1(d0[16]), .B2(n3), 
        .X(y[16]) );
  sky130_fd_sc_hd__a22o_1 U27 ( .A1(d1[15]), .A2(n1), .B1(d0[15]), .B2(n3), 
        .X(y[15]) );
  sky130_fd_sc_hd__a22o_1 U28 ( .A1(d1[14]), .A2(n1), .B1(d0[14]), .B2(n3), 
        .X(y[14]) );
  sky130_fd_sc_hd__a22o_1 U29 ( .A1(d1[13]), .A2(n1), .B1(d0[13]), .B2(n2), 
        .X(y[13]) );
  sky130_fd_sc_hd__a22o_1 U30 ( .A1(d1[12]), .A2(n1), .B1(d0[12]), .B2(n3), 
        .X(y[12]) );
  sky130_fd_sc_hd__a22o_1 U31 ( .A1(d1[11]), .A2(n1), .B1(d0[11]), .B2(n3), 
        .X(y[11]) );
  sky130_fd_sc_hd__a22o_1 U32 ( .A1(d1[10]), .A2(n1), .B1(d0[10]), .B2(n3), 
        .X(y[10]) );
  sky130_fd_sc_hd__a22o_1 U33 ( .A1(d1[0]), .A2(n1), .B1(d0[0]), .B2(n3), .X(
        y[0]) );
  sky130_fd_sc_hd__inv_2 U1 ( .A(n2), .Y(n1) );
  sky130_fd_sc_hd__inv_2 U34 ( .A(s), .Y(n2) );
  sky130_fd_sc_hd__inv_2 U35 ( .A(s), .Y(n3) );
endmodule


module imem ( a, rd );
  input [31:0] a;
  output [31:0] rd;
  wire   \rd[19] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68;
  assign rd[24] = rd[31];
  assign rd[27] = rd[31];
  assign rd[28] = rd[31];
  assign rd[29] = rd[31];
  assign rd[2] = rd[3];
  assign rd[0] = rd[1];
  assign rd[18] = \rd[19] ;
  assign rd[19] = \rd[19] ;

  sky130_fd_sc_hd__inv_2 U3 ( .A(a[5]), .Y(n54) );
  sky130_fd_sc_hd__inv_2 U4 ( .A(a[4]), .Y(n56) );
  sky130_fd_sc_hd__inv_2 U5 ( .A(a[6]), .Y(n53) );
  sky130_fd_sc_hd__inv_2 U6 ( .A(a[3]), .Y(n60) );
  sky130_fd_sc_hd__conb_1 U7 ( .LO(\rd[19] ) );
  sky130_fd_sc_hd__nand2_1 U8 ( .A(n60), .B(n54), .Y(n35) );
  sky130_fd_sc_hd__nand2_1 U9 ( .A(n56), .B(n54), .Y(n47) );
  sky130_fd_sc_hd__o211ai_1 U10 ( .A1(a[2]), .A2(n35), .B1(n47), .C1(a[6]), 
        .Y(rd[1]) );
  sky130_fd_sc_hd__nor2_1 U11 ( .A(n53), .B(a[2]), .Y(n43) );
  sky130_fd_sc_hd__and3_1 U12 ( .A(n43), .B(n60), .C(n57), .X(rd[3]) );
  sky130_fd_sc_hd__nand2_1 U13 ( .A(n64), .B(n53), .Y(n39) );
  sky130_fd_sc_hd__nand2_1 U14 ( .A(n56), .B(n66), .Y(n18) );
  sky130_fd_sc_hd__o21ai_0 U15 ( .A1(n66), .A2(n56), .B1(n18), .Y(n20) );
  sky130_fd_sc_hd__or3_1 U16 ( .A(a[3]), .B(a[6]), .C(n20), .X(n10) );
  sky130_fd_sc_hd__nand2_1 U17 ( .A(a[4]), .B(n66), .Y(n34) );
  sky130_fd_sc_hd__nand3_1 U18 ( .A(a[3]), .B(n53), .C(n34), .Y(n2) );
  sky130_fd_sc_hd__xor2_1 U19 ( .A(a[2]), .B(a[3]), .X(n17) );
  sky130_fd_sc_hd__nand3_1 U20 ( .A(n17), .B(a[6]), .C(n57), .Y(n1) );
  sky130_fd_sc_hd__nand4_1 U21 ( .A(n39), .B(n10), .C(n2), .D(n1), .Y(rd[4])
         );
  sky130_fd_sc_hd__nand2_1 U22 ( .A(a[4]), .B(n53), .Y(n46) );
  sky130_fd_sc_hd__nand2_1 U23 ( .A(a[3]), .B(n57), .Y(n51) );
  sky130_fd_sc_hd__nand2_1 U24 ( .A(n53), .B(a[2]), .Y(n27) );
  sky130_fd_sc_hd__a22oi_1 U25 ( .A1(n58), .A2(a[6]), .B1(a[3]), .B2(n65), .Y(
        n4) );
  sky130_fd_sc_hd__nor2_1 U26 ( .A(n46), .B(a[5]), .Y(n15) );
  sky130_fd_sc_hd__nand2_1 U27 ( .A(n53), .B(n66), .Y(n52) );
  sky130_fd_sc_hd__a32oi_1 U28 ( .A1(n67), .A2(n56), .A3(a[5]), .B1(n64), .B2(
        n43), .Y(n3) );
  sky130_fd_sc_hd__o2111ai_1 U29 ( .A1(a[3]), .A2(n46), .B1(n4), .C1(n55), 
        .D1(n3), .Y(rd[5]) );
  sky130_fd_sc_hd__nor3_1 U30 ( .A(n60), .B(a[5]), .C(n68), .Y(n19) );
  sky130_fd_sc_hd__a21oi_1 U31 ( .A1(n56), .A2(n67), .B1(n54), .Y(n6) );
  sky130_fd_sc_hd__xor2_1 U32 ( .A(n53), .B(n60), .X(n7) );
  sky130_fd_sc_hd__nand2_1 U33 ( .A(a[5]), .B(n60), .Y(n28) );
  sky130_fd_sc_hd__a21oi_1 U34 ( .A1(n7), .A2(n54), .B1(n63), .Y(n5) );
  sky130_fd_sc_hd__a2111oi_0 U35 ( .A1(a[2]), .A2(n60), .B1(n19), .C1(n6), 
        .D1(n5), .Y(rd[6]) );
  sky130_fd_sc_hd__nand3_1 U36 ( .A(n7), .B(n66), .C(n57), .Y(n9) );
  sky130_fd_sc_hd__nand3b_1 U37 ( .A_N(n7), .B(n18), .C(n64), .Y(n8) );
  sky130_fd_sc_hd__nand2_1 U38 ( .A(a[5]), .B(a[3]), .Y(n24) );
  sky130_fd_sc_hd__nand2_1 U39 ( .A(n59), .B(n65), .Y(n41) );
  sky130_fd_sc_hd__o2111ai_1 U40 ( .A1(n54), .A2(n10), .B1(n9), .C1(n8), .D1(
        n41), .Y(rd[7]) );
  sky130_fd_sc_hd__a32oi_1 U41 ( .A1(a[2]), .A2(n56), .A3(n59), .B1(n66), .B2(
        n54), .Y(n12) );
  sky130_fd_sc_hd__a22oi_1 U42 ( .A1(n56), .A2(n54), .B1(a[5]), .B2(n53), .Y(
        n11) );
  sky130_fd_sc_hd__a31oi_1 U43 ( .A1(n34), .A2(n35), .A3(n12), .B1(n11), .Y(
        rd[8]) );
  sky130_fd_sc_hd__xor2_1 U44 ( .A(n56), .B(a[3]), .X(n50) );
  sky130_fd_sc_hd__a21oi_1 U45 ( .A1(a[4]), .A2(a[5]), .B1(n57), .Y(n49) );
  sky130_fd_sc_hd__o2bb2ai_1 U46 ( .B1(a[6]), .B2(n50), .A1_N(n65), .A2_N(n49), 
        .Y(rd[9]) );
  sky130_fd_sc_hd__o21ai_0 U47 ( .A1(a[4]), .A2(n60), .B1(n56), .Y(n31) );
  sky130_fd_sc_hd__o32ai_1 U48 ( .A1(n54), .A2(n52), .A3(n31), .B1(n56), .B2(
        n41), .Y(rd[10]) );
  sky130_fd_sc_hd__nand2_1 U49 ( .A(n67), .B(n54), .Y(n40) );
  sky130_fd_sc_hd__o21a_1 U50 ( .A1(n54), .A2(n27), .B1(n40), .X(n14) );
  sky130_fd_sc_hd__a21oi_1 U51 ( .A1(a[3]), .A2(n54), .B1(n63), .Y(n13) );
  sky130_fd_sc_hd__nor3_1 U52 ( .A(n14), .B(n56), .C(n13), .Y(rd[11]) );
  sky130_fd_sc_hd__nor2_1 U53 ( .A(n34), .B(n39), .Y(rd[12]) );
  sky130_fd_sc_hd__nor2_1 U54 ( .A(n56), .B(n27), .Y(n42) );
  sky130_fd_sc_hd__a22oi_1 U55 ( .A1(n67), .A2(a[3]), .B1(n60), .B2(n42), .Y(
        n48) );
  sky130_fd_sc_hd__a21oi_1 U56 ( .A1(n57), .A2(a[2]), .B1(n15), .Y(n16) );
  sky130_fd_sc_hd__o22ai_1 U57 ( .A1(n54), .A2(n48), .B1(n17), .B2(n16), .Y(
        rd[13]) );
  sky130_fd_sc_hd__o32ai_1 U58 ( .A1(n35), .A2(n52), .A3(n56), .B1(n27), .B2(
        n51), .Y(rd[14]) );
  sky130_fd_sc_hd__nand2_1 U59 ( .A(n58), .B(a[2]), .Y(n38) );
  sky130_fd_sc_hd__a221oi_1 U60 ( .A1(a[6]), .A2(n38), .B1(n18), .B2(n59), 
        .C1(n61), .Y(rd[15]) );
  sky130_fd_sc_hd__a21oi_1 U61 ( .A1(n20), .A2(n59), .B1(n19), .Y(n22) );
  sky130_fd_sc_hd__nor2_1 U62 ( .A(n28), .B(n46), .Y(n33) );
  sky130_fd_sc_hd__a21oi_1 U63 ( .A1(n64), .A2(n68), .B1(n33), .Y(n21) );
  sky130_fd_sc_hd__o221ai_1 U64 ( .A1(a[6]), .A2(n22), .B1(n53), .B2(n51), 
        .C1(n21), .Y(rd[16]) );
  sky130_fd_sc_hd__nand2_1 U65 ( .A(a[4]), .B(a[3]), .Y(n23) );
  sky130_fd_sc_hd__o32ai_1 U66 ( .A1(n24), .A2(a[6]), .A3(a[4]), .B1(n40), 
        .B2(n23), .Y(n25) );
  sky130_fd_sc_hd__a21oi_1 U67 ( .A1(n64), .A2(n42), .B1(n25), .Y(n26) );
  sky130_fd_sc_hd__o221ai_1 U68 ( .A1(n52), .A2(n28), .B1(n27), .B2(n51), .C1(
        n26), .Y(rd[17]) );
  sky130_fd_sc_hd__a32oi_1 U69 ( .A1(a[2]), .A2(n60), .A3(a[6]), .B1(a[3]), 
        .B2(n66), .Y(n29) );
  sky130_fd_sc_hd__a21oi_1 U70 ( .A1(n29), .A2(n52), .B1(n47), .Y(n30) );
  sky130_fd_sc_hd__a31oi_1 U71 ( .A1(a[5]), .A2(n65), .A3(n31), .B1(n30), .Y(
        n32) );
  sky130_fd_sc_hd__o21ai_0 U72 ( .A1(n60), .A2(n40), .B1(n32), .Y(rd[20]) );
  sky130_fd_sc_hd__nor3_1 U73 ( .A(n35), .B(n34), .C(n53), .Y(n36) );
  sky130_fd_sc_hd__a31oi_1 U74 ( .A1(n49), .A2(n67), .A3(a[3]), .B1(n36), .Y(
        n37) );
  sky130_fd_sc_hd__o2111ai_1 U75 ( .A1(a[6]), .A2(n51), .B1(n38), .C1(n62), 
        .D1(n37), .Y(rd[21]) );
  sky130_fd_sc_hd__nand4b_1 U76 ( .A_N(n42), .B(n41), .C(n40), .D(n39), .Y(
        rd[22]) );
  sky130_fd_sc_hd__a21oi_1 U77 ( .A1(n65), .A2(n60), .B1(n43), .Y(n44) );
  sky130_fd_sc_hd__nor2_1 U78 ( .A(n47), .B(n44), .Y(rd[23]) );
  sky130_fd_sc_hd__a21oi_1 U79 ( .A1(a[6]), .A2(a[2]), .B1(n67), .Y(n45) );
  sky130_fd_sc_hd__a211oi_1 U80 ( .A1(n47), .A2(n46), .B1(n60), .C1(n45), .Y(
        rd[25]) );
  sky130_fd_sc_hd__nor2_1 U81 ( .A(n49), .B(n48), .Y(rd[26]) );
  sky130_fd_sc_hd__nor3_1 U82 ( .A(n50), .B(n52), .C(n49), .Y(rd[30]) );
  sky130_fd_sc_hd__nor2_1 U83 ( .A(n52), .B(n51), .Y(rd[31]) );
  sky130_fd_sc_hd__inv_1 U84 ( .A(n15), .Y(n55) );
  sky130_fd_sc_hd__inv_1 U85 ( .A(n47), .Y(n57) );
  sky130_fd_sc_hd__inv_1 U86 ( .A(n51), .Y(n58) );
  sky130_fd_sc_hd__inv_1 U87 ( .A(n24), .Y(n59) );
  sky130_fd_sc_hd__inv_1 U88 ( .A(n31), .Y(n61) );
  sky130_fd_sc_hd__inv_1 U89 ( .A(n33), .Y(n62) );
  sky130_fd_sc_hd__inv_1 U90 ( .A(n28), .Y(n63) );
  sky130_fd_sc_hd__inv_1 U91 ( .A(n35), .Y(n64) );
  sky130_fd_sc_hd__inv_1 U92 ( .A(n27), .Y(n65) );
  sky130_fd_sc_hd__inv_1 U93 ( .A(a[2]), .Y(n66) );
  sky130_fd_sc_hd__inv_1 U94 ( .A(n52), .Y(n67) );
  sky130_fd_sc_hd__inv_1 U95 ( .A(n34), .Y(n68) );
endmodule


module Fetch_DW01_add_0 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   \A[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;
  assign SUM[1] = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  sky130_fd_sc_hd__and2_1 U1 ( .A(A[5]), .B(n15), .X(n1) );
  sky130_fd_sc_hd__and2_1 U2 ( .A(A[28]), .B(n17), .X(n2) );
  sky130_fd_sc_hd__and2_1 U3 ( .A(A[26]), .B(n18), .X(n3) );
  sky130_fd_sc_hd__and2_1 U4 ( .A(A[24]), .B(n19), .X(n4) );
  sky130_fd_sc_hd__and2_1 U5 ( .A(A[22]), .B(n20), .X(n5) );
  sky130_fd_sc_hd__and2_1 U6 ( .A(A[20]), .B(n21), .X(n6) );
  sky130_fd_sc_hd__and2_1 U7 ( .A(A[18]), .B(n22), .X(n7) );
  sky130_fd_sc_hd__and2_1 U8 ( .A(A[16]), .B(n23), .X(n8) );
  sky130_fd_sc_hd__and2_1 U9 ( .A(A[14]), .B(n24), .X(n9) );
  sky130_fd_sc_hd__and2_1 U10 ( .A(A[12]), .B(n25), .X(n10) );
  sky130_fd_sc_hd__and2_1 U11 ( .A(A[10]), .B(n26), .X(n11) );
  sky130_fd_sc_hd__and2_1 U12 ( .A(A[8]), .B(n27), .X(n12) );
  sky130_fd_sc_hd__and2_1 U13 ( .A(A[3]), .B(A[2]), .X(n13) );
  sky130_fd_sc_hd__and2_1 U14 ( .A(A[6]), .B(n1), .X(n14) );
  sky130_fd_sc_hd__and2_1 U15 ( .A(A[4]), .B(n13), .X(n15) );
  sky130_fd_sc_hd__and2_1 U16 ( .A(A[29]), .B(n2), .X(n16) );
  sky130_fd_sc_hd__and2_1 U17 ( .A(A[27]), .B(n3), .X(n17) );
  sky130_fd_sc_hd__and2_1 U18 ( .A(A[25]), .B(n4), .X(n18) );
  sky130_fd_sc_hd__and2_1 U19 ( .A(A[23]), .B(n5), .X(n19) );
  sky130_fd_sc_hd__and2_1 U20 ( .A(A[21]), .B(n6), .X(n20) );
  sky130_fd_sc_hd__and2_1 U21 ( .A(A[19]), .B(n7), .X(n21) );
  sky130_fd_sc_hd__and2_1 U22 ( .A(A[17]), .B(n8), .X(n22) );
  sky130_fd_sc_hd__and2_1 U23 ( .A(A[15]), .B(n9), .X(n23) );
  sky130_fd_sc_hd__and2_1 U24 ( .A(A[13]), .B(n10), .X(n24) );
  sky130_fd_sc_hd__and2_1 U25 ( .A(A[11]), .B(n11), .X(n25) );
  sky130_fd_sc_hd__and2_1 U26 ( .A(A[9]), .B(n12), .X(n26) );
  sky130_fd_sc_hd__and2_1 U27 ( .A(A[7]), .B(n14), .X(n27) );
  sky130_fd_sc_hd__and2_1 U28 ( .A(A[30]), .B(n16), .X(n28) );
  sky130_fd_sc_hd__xor2_1 U29 ( .A(A[31]), .B(n28), .X(SUM[31]) );
  sky130_fd_sc_hd__xor2_1 U30 ( .A(A[30]), .B(n16), .X(SUM[30]) );
  sky130_fd_sc_hd__xor2_1 U31 ( .A(A[29]), .B(n2), .X(SUM[29]) );
  sky130_fd_sc_hd__xor2_1 U32 ( .A(A[28]), .B(n17), .X(SUM[28]) );
  sky130_fd_sc_hd__xor2_1 U33 ( .A(A[27]), .B(n3), .X(SUM[27]) );
  sky130_fd_sc_hd__xor2_1 U34 ( .A(A[26]), .B(n18), .X(SUM[26]) );
  sky130_fd_sc_hd__xor2_1 U35 ( .A(A[25]), .B(n4), .X(SUM[25]) );
  sky130_fd_sc_hd__xor2_1 U36 ( .A(A[24]), .B(n19), .X(SUM[24]) );
  sky130_fd_sc_hd__xor2_1 U37 ( .A(A[23]), .B(n5), .X(SUM[23]) );
  sky130_fd_sc_hd__xor2_1 U38 ( .A(A[22]), .B(n20), .X(SUM[22]) );
  sky130_fd_sc_hd__xor2_1 U39 ( .A(A[21]), .B(n6), .X(SUM[21]) );
  sky130_fd_sc_hd__xor2_1 U40 ( .A(A[20]), .B(n21), .X(SUM[20]) );
  sky130_fd_sc_hd__xor2_1 U41 ( .A(A[19]), .B(n7), .X(SUM[19]) );
  sky130_fd_sc_hd__xor2_1 U42 ( .A(A[18]), .B(n22), .X(SUM[18]) );
  sky130_fd_sc_hd__xor2_1 U43 ( .A(A[17]), .B(n8), .X(SUM[17]) );
  sky130_fd_sc_hd__xor2_1 U44 ( .A(A[16]), .B(n23), .X(SUM[16]) );
  sky130_fd_sc_hd__xor2_1 U45 ( .A(A[15]), .B(n9), .X(SUM[15]) );
  sky130_fd_sc_hd__xor2_1 U46 ( .A(A[14]), .B(n24), .X(SUM[14]) );
  sky130_fd_sc_hd__xor2_1 U47 ( .A(A[13]), .B(n10), .X(SUM[13]) );
  sky130_fd_sc_hd__xor2_1 U48 ( .A(A[12]), .B(n25), .X(SUM[12]) );
  sky130_fd_sc_hd__xor2_1 U49 ( .A(A[11]), .B(n11), .X(SUM[11]) );
  sky130_fd_sc_hd__xor2_1 U50 ( .A(A[10]), .B(n26), .X(SUM[10]) );
  sky130_fd_sc_hd__xor2_1 U51 ( .A(A[9]), .B(n12), .X(SUM[9]) );
  sky130_fd_sc_hd__xor2_1 U52 ( .A(A[8]), .B(n27), .X(SUM[8]) );
  sky130_fd_sc_hd__xor2_1 U53 ( .A(A[7]), .B(n14), .X(SUM[7]) );
  sky130_fd_sc_hd__xor2_1 U54 ( .A(A[6]), .B(n1), .X(SUM[6]) );
  sky130_fd_sc_hd__xor2_1 U55 ( .A(A[5]), .B(n15), .X(SUM[5]) );
  sky130_fd_sc_hd__xor2_1 U56 ( .A(A[4]), .B(n13), .X(SUM[4]) );
  sky130_fd_sc_hd__xor2_1 U57 ( .A(A[3]), .B(A[2]), .X(SUM[3]) );
  sky130_fd_sc_hd__inv_1 U58 ( .A(A[2]), .Y(SUM[2]) );
endmodule


module Fetch ( clk, rst, PC_targetE, stallF, stallD, flushD, PC_srcE, instrD, 
        PCD, PCp4D );
  input [31:0] PC_targetE;
  output [31:0] instrD;
  output [31:0] PCD;
  output [31:0] PCp4D;
  input clk, rst, stallF, stallD, flushD, PC_srcE;
  wire   \*Logic1* , net2871, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14,
         N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, N32, N33, N34, N35, N41, N42, N43, N44, N45, N46, N47,
         N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N61, N62, N63,
         N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77,
         N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91,
         N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N126,
         N127, N128, N129, N130, N131, N132, N133, N134, N135, N136, N139,
         N140, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [31:0] PCp4F;
  wire   [31:0] PCF_new;
  wire   [31:0] PCF;
  wire   [31:0] instrF;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[0]  ( .D(N4), .DE(n27), .CLK(clk), .Q(
        PCF[0]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[1]  ( .D(N5), .DE(n27), .CLK(clk), .Q(
        PCF[1]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[2]  ( .D(N6), .DE(n27), .CLK(clk), .Q(
        PCF[2]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[3]  ( .D(N7), .DE(n27), .CLK(clk), .Q(
        PCF[3]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[4]  ( .D(N8), .DE(n27), .CLK(clk), .Q(
        PCF[4]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[5]  ( .D(N9), .DE(n27), .CLK(clk), .Q(
        PCF[5]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[6]  ( .D(N10), .DE(n27), .CLK(clk), .Q(
        PCF[6]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[7]  ( .D(N11), .DE(n27), .CLK(clk), .Q(
        PCF[7]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[8]  ( .D(N12), .DE(n27), .CLK(clk), .Q(
        PCF[8]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[9]  ( .D(N13), .DE(n27), .CLK(clk), .Q(
        PCF[9]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[10]  ( .D(N14), .DE(n27), .CLK(clk), .Q(
        PCF[10]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[11]  ( .D(N15), .DE(n27), .CLK(clk), .Q(
        PCF[11]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[12]  ( .D(N16), .DE(n28), .CLK(clk), .Q(
        PCF[12]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[13]  ( .D(N17), .DE(n28), .CLK(clk), .Q(
        PCF[13]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[14]  ( .D(N18), .DE(n28), .CLK(clk), .Q(
        PCF[14]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[15]  ( .D(N19), .DE(n28), .CLK(clk), .Q(
        PCF[15]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[16]  ( .D(N20), .DE(n28), .CLK(clk), .Q(
        PCF[16]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[17]  ( .D(N21), .DE(n28), .CLK(clk), .Q(
        PCF[17]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[18]  ( .D(N22), .DE(n28), .CLK(clk), .Q(
        PCF[18]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[19]  ( .D(N23), .DE(n28), .CLK(clk), .Q(
        PCF[19]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[20]  ( .D(N24), .DE(n28), .CLK(clk), .Q(
        PCF[20]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[21]  ( .D(N25), .DE(n28), .CLK(clk), .Q(
        PCF[21]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[22]  ( .D(N26), .DE(n28), .CLK(clk), .Q(
        PCF[22]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[23]  ( .D(N27), .DE(n28), .CLK(clk), .Q(
        PCF[23]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[24]  ( .D(N28), .DE(n29), .CLK(clk), .Q(
        PCF[24]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[25]  ( .D(N29), .DE(n29), .CLK(clk), .Q(
        PCF[25]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[26]  ( .D(N30), .DE(n29), .CLK(clk), .Q(
        PCF[26]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[27]  ( .D(N31), .DE(n29), .CLK(clk), .Q(
        PCF[27]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[28]  ( .D(N32), .DE(n29), .CLK(clk), .Q(
        PCF[28]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[29]  ( .D(N33), .DE(n29), .CLK(clk), .Q(
        PCF[29]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[30]  ( .D(N34), .DE(n29), .CLK(clk), .Q(
        PCF[30]) );
  sky130_fd_sc_hd__edfxtp_1 \PCF_reg[31]  ( .D(N35), .DE(n29), .CLK(clk), .Q(
        PCF[31]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[31]  ( .D(N136), .DE(n26), .CLK(clk), .Q(
        PCD[31]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[30]  ( .D(N135), .DE(n26), .CLK(clk), .Q(
        PCD[30]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[29]  ( .D(N134), .DE(n26), .CLK(clk), .Q(
        PCD[29]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[28]  ( .D(N133), .DE(n26), .CLK(clk), .Q(
        PCD[28]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[27]  ( .D(N132), .DE(n26), .CLK(clk), .Q(
        PCD[27]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[26]  ( .D(N131), .DE(n26), .CLK(clk), .Q(
        PCD[26]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[25]  ( .D(N130), .DE(n26), .CLK(clk), .Q(
        PCD[25]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[24]  ( .D(N129), .DE(n26), .CLK(clk), .Q(
        PCD[24]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[23]  ( .D(N128), .DE(n26), .CLK(clk), .Q(
        PCD[23]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[22]  ( .D(N127), .DE(n26), .CLK(clk), .Q(
        PCD[22]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[21]  ( .D(N126), .DE(n26), .CLK(clk), .Q(
        PCD[21]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[20]  ( .D(N125), .DE(n26), .CLK(clk), .Q(
        PCD[20]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[19]  ( .D(N124), .DE(n25), .CLK(clk), .Q(
        PCD[19]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[18]  ( .D(N123), .DE(n25), .CLK(clk), .Q(
        PCD[18]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[17]  ( .D(N122), .DE(n25), .CLK(clk), .Q(
        PCD[17]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[16]  ( .D(N121), .DE(n25), .CLK(clk), .Q(
        PCD[16]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[15]  ( .D(N120), .DE(n25), .CLK(clk), .Q(
        PCD[15]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[14]  ( .D(N119), .DE(n25), .CLK(clk), .Q(
        PCD[14]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[13]  ( .D(N118), .DE(n25), .CLK(clk), .Q(
        PCD[13]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[12]  ( .D(N117), .DE(n25), .CLK(clk), .Q(
        PCD[12]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[11]  ( .D(N116), .DE(n25), .CLK(clk), .Q(
        PCD[11]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[10]  ( .D(N115), .DE(n25), .CLK(clk), .Q(
        PCD[10]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[9]  ( .D(N114), .DE(n25), .CLK(clk), .Q(
        PCD[9]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[8]  ( .D(N113), .DE(n25), .CLK(clk), .Q(
        PCD[8]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[7]  ( .D(N112), .DE(n24), .CLK(clk), .Q(
        PCD[7]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[6]  ( .D(N111), .DE(n24), .CLK(clk), .Q(
        PCD[6]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[5]  ( .D(N110), .DE(n24), .CLK(clk), .Q(
        PCD[5]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[4]  ( .D(N109), .DE(n24), .CLK(clk), .Q(
        PCD[4]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[3]  ( .D(N108), .DE(n24), .CLK(clk), .Q(
        PCD[3]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[2]  ( .D(N107), .DE(n24), .CLK(clk), .Q(
        PCD[2]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[1]  ( .D(N106), .DE(n24), .CLK(clk), .Q(
        PCD[1]) );
  sky130_fd_sc_hd__edfxtp_1 \PCD_reg[0]  ( .D(N105), .DE(n24), .CLK(clk), .Q(
        PCD[0]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[31]  ( .D(N72), .DE(n24), .CLK(clk), 
        .Q(instrD[31]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[30]  ( .D(N71), .DE(n24), .CLK(clk), 
        .Q(instrD[30]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[29]  ( .D(N70), .DE(n24), .CLK(clk), 
        .Q(instrD[29]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[28]  ( .D(N69), .DE(n24), .CLK(clk), 
        .Q(instrD[28]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[27]  ( .D(N68), .DE(n23), .CLK(clk), 
        .Q(instrD[27]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[26]  ( .D(N67), .DE(n23), .CLK(clk), 
        .Q(instrD[26]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[25]  ( .D(N66), .DE(n23), .CLK(clk), 
        .Q(instrD[25]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[24]  ( .D(N65), .DE(n23), .CLK(clk), 
        .Q(instrD[24]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[23]  ( .D(N64), .DE(n23), .CLK(clk), 
        .Q(instrD[23]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[22]  ( .D(N63), .DE(n23), .CLK(clk), 
        .Q(instrD[22]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[21]  ( .D(N62), .DE(n23), .CLK(clk), 
        .Q(instrD[21]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[20]  ( .D(N61), .DE(n23), .CLK(clk), 
        .Q(instrD[20]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[19]  ( .D(net2871), .DE(n23), .CLK(clk), .Q(instrD[19]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[18]  ( .D(net2871), .DE(n23), .CLK(clk), .Q(instrD[18]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[17]  ( .D(N58), .DE(n23), .CLK(clk), 
        .Q(instrD[17]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[16]  ( .D(N57), .DE(n23), .CLK(clk), 
        .Q(instrD[16]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[15]  ( .D(N56), .DE(n22), .CLK(clk), 
        .Q(instrD[15]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[14]  ( .D(N55), .DE(n22), .CLK(clk), 
        .Q(instrD[14]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[13]  ( .D(N54), .DE(n22), .CLK(clk), 
        .Q(instrD[13]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[12]  ( .D(N53), .DE(n22), .CLK(clk), 
        .Q(instrD[12]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[11]  ( .D(N52), .DE(n22), .CLK(clk), 
        .Q(instrD[11]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[10]  ( .D(N51), .DE(n22), .CLK(clk), 
        .Q(instrD[10]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[9]  ( .D(N50), .DE(n22), .CLK(clk), 
        .Q(instrD[9]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[8]  ( .D(N49), .DE(n22), .CLK(clk), 
        .Q(instrD[8]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[7]  ( .D(N48), .DE(n22), .CLK(clk), 
        .Q(instrD[7]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[6]  ( .D(N47), .DE(n22), .CLK(clk), 
        .Q(instrD[6]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[5]  ( .D(N46), .DE(n22), .CLK(clk), 
        .Q(instrD[5]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[4]  ( .D(N45), .DE(n22), .CLK(clk), 
        .Q(instrD[4]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[3]  ( .D(N44), .DE(n21), .CLK(clk), 
        .Q(instrD[3]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[2]  ( .D(N43), .DE(n21), .CLK(clk), 
        .Q(instrD[2]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[1]  ( .D(N42), .DE(n21), .CLK(clk), 
        .Q(instrD[1]) );
  sky130_fd_sc_hd__edfxtp_1 \instrD_reg[0]  ( .D(N41), .DE(n21), .CLK(clk), 
        .Q(instrD[0]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[31]  ( .D(N104), .DE(n21), .CLK(clk), 
        .Q(PCp4D[31]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[30]  ( .D(N103), .DE(n21), .CLK(clk), 
        .Q(PCp4D[30]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[29]  ( .D(N102), .DE(n21), .CLK(clk), 
        .Q(PCp4D[29]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[28]  ( .D(N101), .DE(n21), .CLK(clk), 
        .Q(PCp4D[28]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[27]  ( .D(N100), .DE(n21), .CLK(clk), 
        .Q(PCp4D[27]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[26]  ( .D(N99), .DE(n21), .CLK(clk), 
        .Q(PCp4D[26]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[25]  ( .D(N98), .DE(n21), .CLK(clk), 
        .Q(PCp4D[25]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[24]  ( .D(N97), .DE(n21), .CLK(clk), 
        .Q(PCp4D[24]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[23]  ( .D(N96), .DE(n20), .CLK(clk), 
        .Q(PCp4D[23]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[22]  ( .D(N95), .DE(n20), .CLK(clk), 
        .Q(PCp4D[22]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[21]  ( .D(N94), .DE(n20), .CLK(clk), 
        .Q(PCp4D[21]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[20]  ( .D(N93), .DE(n20), .CLK(clk), 
        .Q(PCp4D[20]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[19]  ( .D(N92), .DE(n20), .CLK(clk), 
        .Q(PCp4D[19]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[18]  ( .D(N91), .DE(n20), .CLK(clk), 
        .Q(PCp4D[18]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[17]  ( .D(N90), .DE(n20), .CLK(clk), 
        .Q(PCp4D[17]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[16]  ( .D(N89), .DE(n20), .CLK(clk), 
        .Q(PCp4D[16]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[15]  ( .D(N88), .DE(n20), .CLK(clk), 
        .Q(PCp4D[15]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[14]  ( .D(N87), .DE(n20), .CLK(clk), 
        .Q(PCp4D[14]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[13]  ( .D(N86), .DE(n20), .CLK(clk), 
        .Q(PCp4D[13]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[12]  ( .D(N85), .DE(n20), .CLK(clk), 
        .Q(PCp4D[12]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[11]  ( .D(N84), .DE(n19), .CLK(clk), 
        .Q(PCp4D[11]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[10]  ( .D(N83), .DE(n19), .CLK(clk), 
        .Q(PCp4D[10]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[9]  ( .D(N82), .DE(n19), .CLK(clk), .Q(
        PCp4D[9]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[8]  ( .D(N81), .DE(n19), .CLK(clk), .Q(
        PCp4D[8]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[7]  ( .D(N80), .DE(n19), .CLK(clk), .Q(
        PCp4D[7]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[6]  ( .D(N79), .DE(n19), .CLK(clk), .Q(
        PCp4D[6]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[5]  ( .D(N78), .DE(n19), .CLK(clk), .Q(
        PCp4D[5]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[4]  ( .D(N77), .DE(n19), .CLK(clk), .Q(
        PCp4D[4]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[3]  ( .D(N76), .DE(n19), .CLK(clk), .Q(
        PCp4D[3]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[2]  ( .D(N75), .DE(n19), .CLK(clk), .Q(
        PCp4D[2]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[1]  ( .D(N74), .DE(n19), .CLK(clk), .Q(
        PCp4D[1]) );
  sky130_fd_sc_hd__edfxtp_1 \PCp4D_reg[0]  ( .D(N73), .DE(n19), .CLK(clk), .Q(
        PCp4D[0]) );
  sky130_fd_sc_hd__nand2_1 U133 ( .A(stallD), .B(n15), .Y(N140) );
  sky130_fd_sc_hd__nand2_1 U134 ( .A(stallF), .B(n7), .Y(N139) );
  sky130_fd_sc_hd__nor2_1 U135 ( .A(flushD), .B(rst), .Y(n4) );
  mux2_WIDTH32 pcmux ( .d0(PCp4F), .d1(PC_targetE), .s(PC_srcE), .y(PCF_new)
         );
  imem instr_memory ( .a(PCF), .rd({instrF[31:20], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, instrF[17:0]}) );
  Fetch_DW01_add_0 add_16 ( .A(PCF), .B({net2871, net2871, net2871, net2871, 
        net2871, net2871, net2871, net2871, net2871, net2871, net2871, net2871, 
        net2871, net2871, net2871, net2871, net2871, net2871, net2871, net2871, 
        net2871, net2871, net2871, net2871, net2871, net2871, net2871, net2871, 
        net2871, \*Logic1* , net2871, net2871}), .CI(net2871), .SUM(PCp4F) );
  sky130_fd_sc_hd__clkbuf_1 U136 ( .A(n16), .X(n19) );
  sky130_fd_sc_hd__clkbuf_1 U137 ( .A(n16), .X(n20) );
  sky130_fd_sc_hd__clkbuf_1 U138 ( .A(n16), .X(n21) );
  sky130_fd_sc_hd__clkbuf_1 U139 ( .A(n17), .X(n22) );
  sky130_fd_sc_hd__clkbuf_1 U140 ( .A(n17), .X(n23) );
  sky130_fd_sc_hd__clkbuf_1 U141 ( .A(n17), .X(n24) );
  sky130_fd_sc_hd__clkbuf_1 U142 ( .A(n18), .X(n25) );
  sky130_fd_sc_hd__clkbuf_1 U143 ( .A(n18), .X(n26) );
  sky130_fd_sc_hd__and2_1 U144 ( .A(instrF[24]), .B(n12), .X(N65) );
  sky130_fd_sc_hd__and2_1 U145 ( .A(instrF[27]), .B(n13), .X(N68) );
  sky130_fd_sc_hd__and2_1 U146 ( .A(instrF[28]), .B(n13), .X(N69) );
  sky130_fd_sc_hd__and2_1 U147 ( .A(instrF[29]), .B(n13), .X(N70) );
  sky130_fd_sc_hd__and2_1 U148 ( .A(instrF[31]), .B(n13), .X(N72) );
  sky130_fd_sc_hd__and2_1 U149 ( .A(instrF[2]), .B(n11), .X(N43) );
  sky130_fd_sc_hd__and2_1 U150 ( .A(instrF[3]), .B(n11), .X(N44) );
  sky130_fd_sc_hd__and2_1 U151 ( .A(instrF[22]), .B(n12), .X(N63) );
  sky130_fd_sc_hd__clkbuf_1 U152 ( .A(n4), .X(n15) );
  sky130_fd_sc_hd__clkbuf_1 U153 ( .A(N140), .X(n16) );
  sky130_fd_sc_hd__clkbuf_1 U154 ( .A(N140), .X(n17) );
  sky130_fd_sc_hd__clkbuf_1 U155 ( .A(N140), .X(n18) );
  sky130_fd_sc_hd__clkbuf_1 U156 ( .A(N139), .X(n28) );
  sky130_fd_sc_hd__clkbuf_1 U157 ( .A(N139), .X(n27) );
  sky130_fd_sc_hd__clkbuf_1 U158 ( .A(n30), .X(n7) );
  sky130_fd_sc_hd__clkbuf_1 U159 ( .A(N139), .X(n29) );
  sky130_fd_sc_hd__clkbuf_1 U160 ( .A(n4), .X(n8) );
  sky130_fd_sc_hd__clkbuf_1 U161 ( .A(n4), .X(n11) );
  sky130_fd_sc_hd__clkbuf_1 U162 ( .A(n4), .X(n12) );
  sky130_fd_sc_hd__clkbuf_1 U163 ( .A(n4), .X(n13) );
  sky130_fd_sc_hd__and2_1 U164 ( .A(instrF[10]), .B(n11), .X(N51) );
  sky130_fd_sc_hd__and2_1 U165 ( .A(instrF[14]), .B(n12), .X(N55) );
  sky130_fd_sc_hd__and2_1 U166 ( .A(instrF[0]), .B(n11), .X(N41) );
  sky130_fd_sc_hd__and2_1 U167 ( .A(instrF[1]), .B(n11), .X(N42) );
  sky130_fd_sc_hd__clkbuf_1 U168 ( .A(n4), .X(n14) );
  sky130_fd_sc_hd__and2_1 U169 ( .A(PCp4F[3]), .B(n13), .X(N76) );
  sky130_fd_sc_hd__and2_1 U170 ( .A(PCp4F[6]), .B(n14), .X(N79) );
  sky130_fd_sc_hd__and2_1 U171 ( .A(PCp4F[5]), .B(n14), .X(N78) );
  sky130_fd_sc_hd__and2_1 U172 ( .A(PCp4F[4]), .B(n13), .X(N77) );
  sky130_fd_sc_hd__and2_1 U173 ( .A(PCp4F[7]), .B(n14), .X(N80) );
  sky130_fd_sc_hd__and2_1 U174 ( .A(PCp4F[8]), .B(n14), .X(N81) );
  sky130_fd_sc_hd__and2_1 U175 ( .A(PCp4F[9]), .B(n14), .X(N82) );
  sky130_fd_sc_hd__and2_1 U176 ( .A(PCp4F[10]), .B(n14), .X(N83) );
  sky130_fd_sc_hd__and2_1 U177 ( .A(PCp4F[11]), .B(n14), .X(N84) );
  sky130_fd_sc_hd__and2_1 U178 ( .A(PCp4F[12]), .B(n14), .X(N85) );
  sky130_fd_sc_hd__and2_1 U179 ( .A(PCp4F[13]), .B(n14), .X(N86) );
  sky130_fd_sc_hd__and2_1 U180 ( .A(PCp4F[14]), .B(n14), .X(N87) );
  sky130_fd_sc_hd__and2_1 U181 ( .A(PCp4F[15]), .B(n14), .X(N88) );
  sky130_fd_sc_hd__and2_1 U182 ( .A(PCp4F[16]), .B(n14), .X(N89) );
  sky130_fd_sc_hd__and2_1 U183 ( .A(PCp4F[27]), .B(n8), .X(N100) );
  sky130_fd_sc_hd__and2_1 U184 ( .A(PCp4F[28]), .B(n8), .X(N101) );
  sky130_fd_sc_hd__and2_1 U185 ( .A(PCp4F[29]), .B(n8), .X(N102) );
  sky130_fd_sc_hd__and2_1 U186 ( .A(PCp4F[30]), .B(n8), .X(N103) );
  sky130_fd_sc_hd__and2_1 U187 ( .A(PCp4F[31]), .B(n8), .X(N104) );
  sky130_fd_sc_hd__and2_1 U188 ( .A(instrF[7]), .B(n11), .X(N48) );
  sky130_fd_sc_hd__and2_1 U189 ( .A(instrF[30]), .B(n13), .X(N71) );
  sky130_fd_sc_hd__clkbuf_1 U190 ( .A(n4), .X(n9) );
  sky130_fd_sc_hd__clkbuf_1 U191 ( .A(n4), .X(n10) );
  sky130_fd_sc_hd__and2_1 U192 ( .A(instrF[23]), .B(n12), .X(N64) );
  sky130_fd_sc_hd__and2_1 U193 ( .A(PCp4F[2]), .B(n13), .X(N75) );
  sky130_fd_sc_hd__and2_1 U194 ( .A(instrF[12]), .B(n12), .X(N53) );
  sky130_fd_sc_hd__and2_1 U195 ( .A(instrF[26]), .B(n13), .X(N67) );
  sky130_fd_sc_hd__and2_1 U196 ( .A(PCp4F[17]), .B(n15), .X(N90) );
  sky130_fd_sc_hd__and2_1 U197 ( .A(PCp4F[18]), .B(n15), .X(N91) );
  sky130_fd_sc_hd__and2_1 U198 ( .A(PCp4F[19]), .B(n15), .X(N92) );
  sky130_fd_sc_hd__and2_1 U199 ( .A(PCp4F[20]), .B(n15), .X(N93) );
  sky130_fd_sc_hd__and2_1 U200 ( .A(PCp4F[21]), .B(n15), .X(N94) );
  sky130_fd_sc_hd__and2_1 U201 ( .A(PCp4F[22]), .B(n15), .X(N95) );
  sky130_fd_sc_hd__and2_1 U202 ( .A(PCp4F[23]), .B(n15), .X(N96) );
  sky130_fd_sc_hd__and2_1 U203 ( .A(PCp4F[24]), .B(n15), .X(N97) );
  sky130_fd_sc_hd__and2_1 U204 ( .A(PCp4F[25]), .B(n15), .X(N98) );
  sky130_fd_sc_hd__and2_1 U205 ( .A(PCp4F[26]), .B(n15), .X(N99) );
  sky130_fd_sc_hd__clkbuf_1 U206 ( .A(n30), .X(n6) );
  sky130_fd_sc_hd__clkbuf_1 U207 ( .A(n30), .X(n5) );
  sky130_fd_sc_hd__and2_1 U208 ( .A(PCF[3]), .B(n8), .X(N108) );
  sky130_fd_sc_hd__and2_1 U209 ( .A(PCF[6]), .B(n8), .X(N111) );
  sky130_fd_sc_hd__and2_1 U210 ( .A(PCF[2]), .B(n8), .X(N107) );
  sky130_fd_sc_hd__and2_1 U211 ( .A(PCF[5]), .B(n8), .X(N110) );
  sky130_fd_sc_hd__and2_1 U212 ( .A(instrF[6]), .B(n11), .X(N47) );
  sky130_fd_sc_hd__and2_1 U213 ( .A(PCF[4]), .B(n8), .X(N109) );
  sky130_fd_sc_hd__and2_1 U214 ( .A(instrF[15]), .B(n12), .X(N56) );
  sky130_fd_sc_hd__and2_1 U215 ( .A(instrF[25]), .B(n13), .X(N66) );
  sky130_fd_sc_hd__and2_1 U216 ( .A(instrF[16]), .B(n12), .X(N57) );
  sky130_fd_sc_hd__and2_1 U217 ( .A(instrF[17]), .B(n12), .X(N58) );
  sky130_fd_sc_hd__and2_1 U218 ( .A(instrF[5]), .B(n11), .X(N46) );
  sky130_fd_sc_hd__and2_1 U219 ( .A(instrF[21]), .B(n12), .X(N62) );
  sky130_fd_sc_hd__and2_1 U220 ( .A(instrF[11]), .B(n12), .X(N52) );
  sky130_fd_sc_hd__and2_1 U221 ( .A(instrF[20]), .B(n12), .X(N61) );
  sky130_fd_sc_hd__and2_1 U222 ( .A(instrF[4]), .B(n11), .X(N45) );
  sky130_fd_sc_hd__and2_1 U223 ( .A(PCp4F[0]), .B(n13), .X(N73) );
  sky130_fd_sc_hd__and2_1 U224 ( .A(PCp4F[1]), .B(n13), .X(N74) );
  sky130_fd_sc_hd__and2_1 U225 ( .A(instrF[8]), .B(n11), .X(N49) );
  sky130_fd_sc_hd__and2_1 U226 ( .A(instrF[9]), .B(n11), .X(N50) );
  sky130_fd_sc_hd__and2_1 U227 ( .A(instrF[13]), .B(n12), .X(N54) );
  sky130_fd_sc_hd__and2_1 U228 ( .A(PCF[0]), .B(n8), .X(N105) );
  sky130_fd_sc_hd__and2_1 U229 ( .A(PCF[1]), .B(n8), .X(N106) );
  sky130_fd_sc_hd__and2_1 U230 ( .A(PCF[7]), .B(n9), .X(N112) );
  sky130_fd_sc_hd__and2_1 U231 ( .A(PCF[8]), .B(n9), .X(N113) );
  sky130_fd_sc_hd__and2_1 U232 ( .A(PCF[9]), .B(n9), .X(N114) );
  sky130_fd_sc_hd__and2_1 U233 ( .A(PCF[10]), .B(n9), .X(N115) );
  sky130_fd_sc_hd__and2_1 U234 ( .A(PCF[11]), .B(n9), .X(N116) );
  sky130_fd_sc_hd__and2_1 U235 ( .A(PCF[12]), .B(n9), .X(N117) );
  sky130_fd_sc_hd__and2_1 U236 ( .A(PCF[13]), .B(n9), .X(N118) );
  sky130_fd_sc_hd__and2_1 U237 ( .A(PCF[14]), .B(n9), .X(N119) );
  sky130_fd_sc_hd__and2_1 U238 ( .A(PCF[15]), .B(n9), .X(N120) );
  sky130_fd_sc_hd__and2_1 U239 ( .A(PCF[16]), .B(n9), .X(N121) );
  sky130_fd_sc_hd__and2_1 U240 ( .A(PCF[17]), .B(n9), .X(N122) );
  sky130_fd_sc_hd__and2_1 U241 ( .A(PCF[18]), .B(n9), .X(N123) );
  sky130_fd_sc_hd__and2_1 U242 ( .A(PCF[19]), .B(n10), .X(N124) );
  sky130_fd_sc_hd__and2_1 U243 ( .A(PCF[20]), .B(n10), .X(N125) );
  sky130_fd_sc_hd__and2_1 U244 ( .A(PCF[21]), .B(n10), .X(N126) );
  sky130_fd_sc_hd__and2_1 U245 ( .A(PCF[22]), .B(n10), .X(N127) );
  sky130_fd_sc_hd__and2_1 U246 ( .A(PCF[23]), .B(n10), .X(N128) );
  sky130_fd_sc_hd__and2_1 U247 ( .A(PCF[24]), .B(n10), .X(N129) );
  sky130_fd_sc_hd__and2_1 U248 ( .A(PCF[25]), .B(n10), .X(N130) );
  sky130_fd_sc_hd__and2_1 U249 ( .A(PCF[26]), .B(n10), .X(N131) );
  sky130_fd_sc_hd__and2_1 U250 ( .A(PCF[27]), .B(n10), .X(N132) );
  sky130_fd_sc_hd__and2_1 U251 ( .A(PCF[28]), .B(n10), .X(N133) );
  sky130_fd_sc_hd__and2_1 U252 ( .A(PCF[29]), .B(n10), .X(N134) );
  sky130_fd_sc_hd__and2_1 U253 ( .A(PCF[30]), .B(n10), .X(N135) );
  sky130_fd_sc_hd__and2_1 U254 ( .A(PCF[31]), .B(n11), .X(N136) );
  sky130_fd_sc_hd__and2_1 U255 ( .A(PCF_new[31]), .B(n7), .X(N35) );
  sky130_fd_sc_hd__and2_1 U256 ( .A(PCF_new[8]), .B(n5), .X(N12) );
  sky130_fd_sc_hd__and2_1 U257 ( .A(PCF_new[7]), .B(n5), .X(N11) );
  sky130_fd_sc_hd__and2_1 U258 ( .A(PCF_new[6]), .B(n5), .X(N10) );
  sky130_fd_sc_hd__and2_1 U259 ( .A(PCF_new[5]), .B(n7), .X(N9) );
  sky130_fd_sc_hd__and2_1 U260 ( .A(PCF_new[4]), .B(n7), .X(N8) );
  sky130_fd_sc_hd__and2_1 U261 ( .A(PCF_new[3]), .B(n7), .X(N7) );
  sky130_fd_sc_hd__and2_1 U262 ( .A(PCF_new[9]), .B(n5), .X(N13) );
  sky130_fd_sc_hd__and2_1 U263 ( .A(PCF_new[29]), .B(n6), .X(N33) );
  sky130_fd_sc_hd__and2_1 U264 ( .A(PCF_new[28]), .B(n6), .X(N32) );
  sky130_fd_sc_hd__and2_1 U265 ( .A(PCF_new[27]), .B(n6), .X(N31) );
  sky130_fd_sc_hd__and2_1 U266 ( .A(PCF_new[26]), .B(n6), .X(N30) );
  sky130_fd_sc_hd__and2_1 U267 ( .A(PCF_new[25]), .B(n6), .X(N29) );
  sky130_fd_sc_hd__and2_1 U268 ( .A(PCF_new[24]), .B(n6), .X(N28) );
  sky130_fd_sc_hd__and2_1 U269 ( .A(PCF_new[23]), .B(n6), .X(N27) );
  sky130_fd_sc_hd__and2_1 U270 ( .A(PCF_new[22]), .B(n6), .X(N26) );
  sky130_fd_sc_hd__and2_1 U271 ( .A(PCF_new[21]), .B(n6), .X(N25) );
  sky130_fd_sc_hd__and2_1 U272 ( .A(PCF_new[20]), .B(n6), .X(N24) );
  sky130_fd_sc_hd__and2_1 U273 ( .A(PCF_new[19]), .B(n6), .X(N23) );
  sky130_fd_sc_hd__and2_1 U274 ( .A(PCF_new[18]), .B(n6), .X(N22) );
  sky130_fd_sc_hd__and2_1 U275 ( .A(PCF_new[17]), .B(n5), .X(N21) );
  sky130_fd_sc_hd__and2_1 U276 ( .A(PCF_new[16]), .B(n5), .X(N20) );
  sky130_fd_sc_hd__and2_1 U277 ( .A(PCF_new[15]), .B(n5), .X(N19) );
  sky130_fd_sc_hd__and2_1 U278 ( .A(PCF_new[14]), .B(n5), .X(N18) );
  sky130_fd_sc_hd__and2_1 U279 ( .A(PCF_new[13]), .B(n5), .X(N17) );
  sky130_fd_sc_hd__and2_1 U280 ( .A(PCF_new[12]), .B(n5), .X(N16) );
  sky130_fd_sc_hd__and2_1 U281 ( .A(PCF_new[11]), .B(n5), .X(N15) );
  sky130_fd_sc_hd__and2_1 U282 ( .A(PCF_new[10]), .B(n5), .X(N14) );
  sky130_fd_sc_hd__and2_1 U283 ( .A(PCF_new[30]), .B(n7), .X(N34) );
  sky130_fd_sc_hd__and2_1 U284 ( .A(PCF_new[2]), .B(n7), .X(N6) );
  sky130_fd_sc_hd__and2_1 U285 ( .A(PCF_new[1]), .B(n7), .X(N5) );
  sky130_fd_sc_hd__and2_1 U286 ( .A(PCF_new[0]), .B(n7), .X(N4) );
  sky130_fd_sc_hd__conb_1 U287 ( .LO(net2871), .HI(\*Logic1* ) );
  sky130_fd_sc_hd__inv_1 U288 ( .A(rst), .Y(n30) );
endmodule

