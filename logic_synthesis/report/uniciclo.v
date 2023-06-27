/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5-4
// Date      : Tue Jun 27 18:05:49 2023
/////////////////////////////////////////////////////////////


module alu ( SrcA, SrcB, ALUControl, ALUResult, Zero );
  input [3:0] SrcA;
  input [3:0] SrcB;
  input [2:0] ALUControl;
  output [3:0] ALUResult;
  output Zero;
  wire   n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83;

  sky130_fd_sc_hd__nor4_2 U47 ( .A(ALUResult[3]), .B(ALUResult[2]), .C(
        ALUResult[1]), .D(ALUResult[0]), .Y(Zero) );
  sky130_fd_sc_hd__o21ai_0 U48 ( .A1(n47), .A2(n48), .B1(n49), .Y(ALUResult[3]) );
  sky130_fd_sc_hd__mux2i_1 U49 ( .A0(n50), .A1(n51), .S(SrcB[3]), .Y(n49) );
  sky130_fd_sc_hd__nand2_1 U50 ( .A(n52), .B(n47), .Y(n51) );
  sky130_fd_sc_hd__mux2i_1 U51 ( .A0(n53), .A1(n54), .S(SrcA[3]), .Y(n52) );
  sky130_fd_sc_hd__a21oi_1 U52 ( .A1(n55), .A2(n56), .B1(ALUControl[2]), .Y(
        n54) );
  sky130_fd_sc_hd__nor2b_1 U53 ( .B_N(n55), .A(n57), .Y(n53) );
  sky130_fd_sc_hd__nor2_1 U54 ( .A(n58), .B(n57), .Y(n50) );
  sky130_fd_sc_hd__xor2_1 U55 ( .A(SrcA[3]), .B(n55), .X(n58) );
  sky130_fd_sc_hd__xnor2_1 U56 ( .A(n59), .B(n60), .Y(n55) );
  sky130_fd_sc_hd__a21oi_1 U57 ( .A1(n61), .A2(n62), .B1(n63), .Y(n60) );
  sky130_fd_sc_hd__o21a_1 U58 ( .A1(n62), .A2(n61), .B1(SrcA[2]), .X(n63) );
  sky130_fd_sc_hd__clkinv_1 U59 ( .A(SrcA[3]), .Y(n48) );
  sky130_fd_sc_hd__o221ai_1 U60 ( .A1(n64), .A2(n65), .B1(n57), .B2(n66), .C1(
        n67), .Y(ALUResult[2]) );
  sky130_fd_sc_hd__nand2_1 U61 ( .A(SrcA[2]), .B(n68), .Y(n67) );
  sky130_fd_sc_hd__xor2_1 U62 ( .A(n61), .B(n69), .X(n66) );
  sky130_fd_sc_hd__xnor2_1 U63 ( .A(SrcA[2]), .B(n62), .Y(n69) );
  sky130_fd_sc_hd__maj3_1 U64 ( .A(n70), .B(SrcA[1]), .C(n71), .X(n62) );
  sky130_fd_sc_hd__xor2_1 U65 ( .A(n65), .B(n59), .X(n61) );
  sky130_fd_sc_hd__clkinv_1 U66 ( .A(SrcB[2]), .Y(n65) );
  sky130_fd_sc_hd__a21oi_1 U67 ( .A1(n72), .A2(SrcA[2]), .B1(n68), .Y(n64) );
  sky130_fd_sc_hd__clkinv_1 U68 ( .A(n47), .Y(n68) );
  sky130_fd_sc_hd__clkinv_1 U69 ( .A(n73), .Y(n72) );
  sky130_fd_sc_hd__o221ai_1 U70 ( .A1(n74), .A2(n57), .B1(n47), .B2(n75), .C1(
        n76), .Y(ALUResult[1]) );
  sky130_fd_sc_hd__nand2_1 U71 ( .A(SrcB[1]), .B(n77), .Y(n76) );
  sky130_fd_sc_hd__o21ai_0 U72 ( .A1(n75), .A2(n73), .B1(n47), .Y(n77) );
  sky130_fd_sc_hd__xor2_1 U73 ( .A(n78), .B(n70), .X(n74) );
  sky130_fd_sc_hd__mux2i_1 U74 ( .A0(n59), .A1(n79), .S(SrcB[0]), .Y(n70) );
  sky130_fd_sc_hd__clkinv_1 U75 ( .A(ALUControl[0]), .Y(n59) );
  sky130_fd_sc_hd__xor2_1 U76 ( .A(n75), .B(n71), .X(n78) );
  sky130_fd_sc_hd__xor2_1 U77 ( .A(SrcB[1]), .B(ALUControl[0]), .X(n71) );
  sky130_fd_sc_hd__clkinv_1 U78 ( .A(SrcA[1]), .Y(n75) );
  sky130_fd_sc_hd__o221ai_1 U79 ( .A1(n80), .A2(n57), .B1(n47), .B2(n79), .C1(
        n81), .Y(ALUResult[0]) );
  sky130_fd_sc_hd__nand2_1 U80 ( .A(SrcB[0]), .B(n82), .Y(n81) );
  sky130_fd_sc_hd__o21ai_0 U81 ( .A1(n79), .A2(n73), .B1(n47), .Y(n82) );
  sky130_fd_sc_hd__nand2_1 U82 ( .A(ALUControl[1]), .B(n83), .Y(n73) );
  sky130_fd_sc_hd__nand3_1 U83 ( .A(ALUControl[0]), .B(n83), .C(ALUControl[1]), 
        .Y(n47) );
  sky130_fd_sc_hd__nand2_1 U84 ( .A(n56), .B(n83), .Y(n57) );
  sky130_fd_sc_hd__clkinv_1 U85 ( .A(ALUControl[2]), .Y(n83) );
  sky130_fd_sc_hd__clkinv_1 U86 ( .A(ALUControl[1]), .Y(n56) );
  sky130_fd_sc_hd__xor2_1 U87 ( .A(SrcB[0]), .B(n79), .X(n80) );
  sky130_fd_sc_hd__clkinv_1 U88 ( .A(SrcA[0]), .Y(n79) );
endmodule

