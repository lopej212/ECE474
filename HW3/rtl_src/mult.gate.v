/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Sun Apr 28 13:55:27 2019
/////////////////////////////////////////////////////////////


module mult_DW01_add_0 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [31:1] carry;

  FADDX1 U1_30 ( .A(A[30]), .B(B[30]), .CI(carry[30]), .CO(carry[31]), .S(
        SUM[30]) );
  FADDX1 U1_29 ( .A(A[29]), .B(B[29]), .CI(carry[29]), .CO(carry[30]), .S(
        SUM[29]) );
  FADDX1 U1_28 ( .A(A[28]), .B(B[28]), .CI(carry[28]), .CO(carry[29]), .S(
        SUM[28]) );
  FADDX1 U1_27 ( .A(A[27]), .B(B[27]), .CI(carry[27]), .CO(carry[28]), .S(
        SUM[27]) );
  FADDX1 U1_26 ( .A(A[26]), .B(B[26]), .CI(carry[26]), .CO(carry[27]), .S(
        SUM[26]) );
  FADDX1 U1_25 ( .A(A[25]), .B(B[25]), .CI(carry[25]), .CO(carry[26]), .S(
        SUM[25]) );
  FADDX1 U1_24 ( .A(A[24]), .B(B[24]), .CI(carry[24]), .CO(carry[25]), .S(
        SUM[24]) );
  FADDX1 U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(carry[24]), .S(
        SUM[23]) );
  FADDX1 U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  FADDX1 U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  FADDX1 U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  FADDX1 U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  FADDX1 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  FADDX1 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  FADDX1 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  FADDX1 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  FADDX1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X1 U1_31 ( .IN1(A[31]), .IN2(B[31]), .IN3(carry[31]), .Q(SUM[31]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
  AND2X1 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(n1) );
endmodule


module mult ( reset, clk, a_in, b_in, start, product, done );
  input [31:0] a_in;
  input [31:0] b_in;
  output [63:0] product;
  input reset, clk, start;
  output done;
  wire   N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98,
         N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N131, N132, N133,
         N134, N135, N137, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45;
  wire   [1:0] present_state;
  wire   [1:0] next_state;
  wire   [63:0] mult_product;
  wire   [31:0] multiplicand_reg;
  assign product[63] = 1'b0;
  assign done = 1'b1;

  mult_DW01_add_0 add_54 ( .A(mult_product[63:32]), .B(multiplicand_reg), .CI(
        1'b0), .SUM({N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, 
        N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, 
        N22, N21, N20, N19, N18, N17, N16}) );
  LATCHX1 \mult_product_reg[0]  ( .CLK(N64), .D(N65), .QN(n38) );
  LATCHX1 \counter_reg_reg[4]  ( .CLK(N64), .D(N135), .QN(n43) );
  LATCHX1 \counter_reg_reg[3]  ( .CLK(N64), .D(N134), .Q(n20), .QN(n42) );
  LATCHX1 \counter_reg_reg[2]  ( .CLK(N64), .D(N133), .QN(n41) );
  LATCHX1 \counter_reg_reg[1]  ( .CLK(N64), .D(N132), .QN(n40) );
  LATCHX1 \counter_reg_reg[0]  ( .CLK(N64), .D(N131), .QN(n39) );
  LATCHX1 \mult_product_reg[31]  ( .CLK(N64), .D(N96), .Q(mult_product[31]) );
  LATCHX1 \mult_product_reg[30]  ( .CLK(N64), .D(N95), .Q(mult_product[30]) );
  LATCHX1 \mult_product_reg[29]  ( .CLK(N64), .D(N94), .Q(mult_product[29]) );
  LATCHX1 \mult_product_reg[28]  ( .CLK(N64), .D(N93), .Q(mult_product[28]) );
  LATCHX1 \mult_product_reg[27]  ( .CLK(N64), .D(N92), .Q(mult_product[27]) );
  LATCHX1 \mult_product_reg[26]  ( .CLK(N64), .D(N91), .Q(mult_product[26]) );
  LATCHX1 \mult_product_reg[25]  ( .CLK(N64), .D(N90), .Q(mult_product[25]) );
  LATCHX1 \mult_product_reg[24]  ( .CLK(N64), .D(N89), .Q(mult_product[24]) );
  LATCHX1 \mult_product_reg[23]  ( .CLK(N64), .D(N88), .Q(mult_product[23]) );
  LATCHX1 \mult_product_reg[22]  ( .CLK(N64), .D(N87), .Q(mult_product[22]) );
  LATCHX1 \mult_product_reg[21]  ( .CLK(N64), .D(N86), .Q(mult_product[21]) );
  LATCHX1 \mult_product_reg[20]  ( .CLK(N64), .D(N85), .Q(mult_product[20]) );
  LATCHX1 \mult_product_reg[19]  ( .CLK(N64), .D(N84), .Q(mult_product[19]) );
  LATCHX1 \mult_product_reg[18]  ( .CLK(N64), .D(N83), .Q(mult_product[18]) );
  LATCHX1 \mult_product_reg[17]  ( .CLK(N64), .D(N82), .Q(mult_product[17]) );
  LATCHX1 \mult_product_reg[16]  ( .CLK(N64), .D(N81), .Q(mult_product[16]) );
  LATCHX1 \mult_product_reg[15]  ( .CLK(N64), .D(N80), .Q(mult_product[15]) );
  LATCHX1 \mult_product_reg[14]  ( .CLK(N64), .D(N79), .Q(mult_product[14]) );
  LATCHX1 \mult_product_reg[13]  ( .CLK(N64), .D(N78), .Q(mult_product[13]) );
  LATCHX1 \mult_product_reg[12]  ( .CLK(N64), .D(N77), .Q(mult_product[12]) );
  LATCHX1 \mult_product_reg[11]  ( .CLK(N64), .D(N76), .Q(mult_product[11]) );
  LATCHX1 \mult_product_reg[10]  ( .CLK(N64), .D(N75), .Q(mult_product[10]) );
  LATCHX1 \mult_product_reg[9]  ( .CLK(N64), .D(N74), .Q(mult_product[9]) );
  LATCHX1 \mult_product_reg[8]  ( .CLK(N64), .D(N73), .Q(mult_product[8]) );
  LATCHX1 \mult_product_reg[7]  ( .CLK(N64), .D(N72), .Q(mult_product[7]) );
  LATCHX1 \mult_product_reg[6]  ( .CLK(N64), .D(N71), .Q(mult_product[6]) );
  LATCHX1 \mult_product_reg[5]  ( .CLK(N64), .D(N70), .Q(mult_product[5]) );
  LATCHX1 \mult_product_reg[4]  ( .CLK(N64), .D(N69), .Q(mult_product[4]) );
  LATCHX1 \mult_product_reg[3]  ( .CLK(N64), .D(N68), .Q(mult_product[3]) );
  LATCHX1 \mult_product_reg[2]  ( .CLK(N64), .D(N67), .Q(mult_product[2]) );
  LATCHX1 \mult_product_reg[1]  ( .CLK(N64), .D(N66), .Q(mult_product[1]) );
  DFFARX1 \present_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .RSTB(n44), 
        .Q(present_state[1]), .QN(n18) );
  DFFARX1 \present_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .RSTB(n44), 
        .Q(present_state[0]), .QN(n19) );
  LATCHX1 \multiplicand_reg_reg[31]  ( .CLK(n45), .D(a_in[31]), .Q(
        multiplicand_reg[31]) );
  LATCHX1 \multiplicand_reg_reg[30]  ( .CLK(n45), .D(a_in[30]), .Q(
        multiplicand_reg[30]) );
  LATCHX1 \multiplicand_reg_reg[29]  ( .CLK(n45), .D(a_in[29]), .Q(
        multiplicand_reg[29]) );
  LATCHX1 \multiplicand_reg_reg[28]  ( .CLK(n45), .D(a_in[28]), .Q(
        multiplicand_reg[28]) );
  LATCHX1 \multiplicand_reg_reg[27]  ( .CLK(n45), .D(a_in[27]), .Q(
        multiplicand_reg[27]) );
  LATCHX1 \multiplicand_reg_reg[26]  ( .CLK(n45), .D(a_in[26]), .Q(
        multiplicand_reg[26]) );
  LATCHX1 \multiplicand_reg_reg[25]  ( .CLK(n45), .D(a_in[25]), .Q(
        multiplicand_reg[25]) );
  LATCHX1 \multiplicand_reg_reg[24]  ( .CLK(n45), .D(a_in[24]), .Q(
        multiplicand_reg[24]) );
  LATCHX1 \multiplicand_reg_reg[23]  ( .CLK(n45), .D(a_in[23]), .Q(
        multiplicand_reg[23]) );
  LATCHX1 \multiplicand_reg_reg[22]  ( .CLK(n45), .D(a_in[22]), .Q(
        multiplicand_reg[22]) );
  LATCHX1 \multiplicand_reg_reg[21]  ( .CLK(n45), .D(a_in[21]), .Q(
        multiplicand_reg[21]) );
  LATCHX1 \multiplicand_reg_reg[20]  ( .CLK(n45), .D(a_in[20]), .Q(
        multiplicand_reg[20]) );
  LATCHX1 \multiplicand_reg_reg[19]  ( .CLK(n45), .D(a_in[19]), .Q(
        multiplicand_reg[19]) );
  LATCHX1 \multiplicand_reg_reg[18]  ( .CLK(n45), .D(a_in[18]), .Q(
        multiplicand_reg[18]) );
  LATCHX1 \multiplicand_reg_reg[17]  ( .CLK(n45), .D(a_in[17]), .Q(
        multiplicand_reg[17]) );
  LATCHX1 \multiplicand_reg_reg[16]  ( .CLK(n45), .D(a_in[16]), .Q(
        multiplicand_reg[16]) );
  LATCHX1 \multiplicand_reg_reg[15]  ( .CLK(n45), .D(a_in[15]), .Q(
        multiplicand_reg[15]) );
  LATCHX1 \multiplicand_reg_reg[14]  ( .CLK(n45), .D(a_in[14]), .Q(
        multiplicand_reg[14]) );
  LATCHX1 \multiplicand_reg_reg[13]  ( .CLK(n45), .D(a_in[13]), .Q(
        multiplicand_reg[13]) );
  LATCHX1 \multiplicand_reg_reg[12]  ( .CLK(n45), .D(a_in[12]), .Q(
        multiplicand_reg[12]) );
  LATCHX1 \multiplicand_reg_reg[11]  ( .CLK(n45), .D(a_in[11]), .Q(
        multiplicand_reg[11]) );
  LATCHX1 \multiplicand_reg_reg[10]  ( .CLK(n45), .D(a_in[10]), .Q(
        multiplicand_reg[10]) );
  LATCHX1 \multiplicand_reg_reg[9]  ( .CLK(n45), .D(a_in[9]), .Q(
        multiplicand_reg[9]) );
  LATCHX1 \multiplicand_reg_reg[8]  ( .CLK(n45), .D(a_in[8]), .Q(
        multiplicand_reg[8]) );
  LATCHX1 \multiplicand_reg_reg[7]  ( .CLK(n45), .D(a_in[7]), .Q(
        multiplicand_reg[7]) );
  LATCHX1 \multiplicand_reg_reg[6]  ( .CLK(n45), .D(a_in[6]), .Q(
        multiplicand_reg[6]) );
  LATCHX1 \multiplicand_reg_reg[5]  ( .CLK(n45), .D(a_in[5]), .Q(
        multiplicand_reg[5]) );
  LATCHX1 \multiplicand_reg_reg[4]  ( .CLK(n45), .D(a_in[4]), .Q(
        multiplicand_reg[4]) );
  LATCHX1 \multiplicand_reg_reg[3]  ( .CLK(n45), .D(a_in[3]), .Q(
        multiplicand_reg[3]) );
  LATCHX1 \multiplicand_reg_reg[2]  ( .CLK(n45), .D(a_in[2]), .Q(
        multiplicand_reg[2]) );
  LATCHX1 \multiplicand_reg_reg[1]  ( .CLK(n45), .D(a_in[1]), .Q(
        multiplicand_reg[1]) );
  LATCHX1 \multiplicand_reg_reg[0]  ( .CLK(n45), .D(a_in[0]), .Q(
        multiplicand_reg[0]) );
  LATCHX1 \mult_product_reg[63]  ( .CLK(N97), .D(N129), .Q(mult_product[63])
         );
  LATCHX1 \mult_product_reg[62]  ( .CLK(N97), .D(N128), .Q(mult_product[62])
         );
  LATCHX1 \mult_product_reg[61]  ( .CLK(N97), .D(N127), .Q(mult_product[61])
         );
  LATCHX1 \mult_product_reg[60]  ( .CLK(N97), .D(N126), .Q(mult_product[60])
         );
  LATCHX1 \mult_product_reg[59]  ( .CLK(N97), .D(N125), .Q(mult_product[59])
         );
  LATCHX1 \mult_product_reg[58]  ( .CLK(N97), .D(N124), .Q(mult_product[58])
         );
  LATCHX1 \mult_product_reg[57]  ( .CLK(N97), .D(N123), .Q(mult_product[57])
         );
  LATCHX1 \mult_product_reg[56]  ( .CLK(N97), .D(N122), .Q(mult_product[56])
         );
  LATCHX1 \mult_product_reg[55]  ( .CLK(N97), .D(N121), .Q(mult_product[55])
         );
  LATCHX1 \mult_product_reg[54]  ( .CLK(N97), .D(N120), .Q(mult_product[54])
         );
  LATCHX1 \mult_product_reg[53]  ( .CLK(N97), .D(N119), .Q(mult_product[53])
         );
  LATCHX1 \mult_product_reg[52]  ( .CLK(N97), .D(N118), .Q(mult_product[52])
         );
  LATCHX1 \mult_product_reg[51]  ( .CLK(N97), .D(N117), .Q(mult_product[51])
         );
  LATCHX1 \mult_product_reg[50]  ( .CLK(N97), .D(N116), .Q(mult_product[50])
         );
  LATCHX1 \mult_product_reg[49]  ( .CLK(N97), .D(N115), .Q(mult_product[49])
         );
  LATCHX1 \mult_product_reg[48]  ( .CLK(N97), .D(N114), .Q(mult_product[48])
         );
  LATCHX1 \mult_product_reg[47]  ( .CLK(N97), .D(N113), .Q(mult_product[47])
         );
  LATCHX1 \mult_product_reg[46]  ( .CLK(N97), .D(N112), .Q(mult_product[46])
         );
  LATCHX1 \mult_product_reg[45]  ( .CLK(N97), .D(N111), .Q(mult_product[45])
         );
  LATCHX1 \mult_product_reg[44]  ( .CLK(N97), .D(N110), .Q(mult_product[44])
         );
  LATCHX1 \mult_product_reg[43]  ( .CLK(N97), .D(N109), .Q(mult_product[43])
         );
  LATCHX1 \mult_product_reg[42]  ( .CLK(N97), .D(N108), .Q(mult_product[42])
         );
  LATCHX1 \mult_product_reg[41]  ( .CLK(N97), .D(N107), .Q(mult_product[41])
         );
  LATCHX1 \mult_product_reg[40]  ( .CLK(N97), .D(N106), .Q(mult_product[40])
         );
  LATCHX1 \mult_product_reg[39]  ( .CLK(N97), .D(N105), .Q(mult_product[39])
         );
  LATCHX1 \mult_product_reg[38]  ( .CLK(N97), .D(N104), .Q(mult_product[38])
         );
  LATCHX1 \mult_product_reg[37]  ( .CLK(N97), .D(N103), .Q(mult_product[37])
         );
  LATCHX1 \mult_product_reg[36]  ( .CLK(N97), .D(N102), .Q(mult_product[36])
         );
  LATCHX1 \mult_product_reg[35]  ( .CLK(N97), .D(N101), .Q(mult_product[35])
         );
  LATCHX1 \mult_product_reg[34]  ( .CLK(N97), .D(N100), .Q(mult_product[34])
         );
  LATCHX1 \mult_product_reg[33]  ( .CLK(N97), .D(N99), .Q(mult_product[33]) );
  LATCHX1 \mult_product_reg[32]  ( .CLK(N97), .D(N98), .Q(mult_product[32]) );
  LATCHX1 \next_state_reg[0]  ( .CLK(N61), .D(N62), .Q(next_state[0]) );
  LATCHX1 \next_state_reg[1]  ( .CLK(N61), .D(N63), .Q(next_state[1]) );
  LATCHX1 \product_reg[0]  ( .CLK(N137), .D(mult_product[1]), .Q(product[0])
         );
  LATCHX1 \product_reg[1]  ( .CLK(N137), .D(mult_product[2]), .Q(product[1])
         );
  LATCHX1 \product_reg[2]  ( .CLK(N137), .D(mult_product[3]), .Q(product[2])
         );
  LATCHX1 \product_reg[3]  ( .CLK(N137), .D(mult_product[4]), .Q(product[3])
         );
  LATCHX1 \product_reg[4]  ( .CLK(N137), .D(mult_product[5]), .Q(product[4])
         );
  LATCHX1 \product_reg[5]  ( .CLK(N137), .D(mult_product[6]), .Q(product[5])
         );
  LATCHX1 \product_reg[6]  ( .CLK(N137), .D(mult_product[7]), .Q(product[6])
         );
  LATCHX1 \product_reg[7]  ( .CLK(N137), .D(mult_product[8]), .Q(product[7])
         );
  LATCHX1 \product_reg[8]  ( .CLK(N137), .D(mult_product[9]), .Q(product[8])
         );
  LATCHX1 \product_reg[9]  ( .CLK(N137), .D(mult_product[10]), .Q(product[9])
         );
  LATCHX1 \product_reg[10]  ( .CLK(N137), .D(mult_product[11]), .Q(product[10]) );
  LATCHX1 \product_reg[11]  ( .CLK(N137), .D(mult_product[12]), .Q(product[11]) );
  LATCHX1 \product_reg[12]  ( .CLK(N137), .D(mult_product[13]), .Q(product[12]) );
  LATCHX1 \product_reg[13]  ( .CLK(N137), .D(mult_product[14]), .Q(product[13]) );
  LATCHX1 \product_reg[14]  ( .CLK(N137), .D(mult_product[15]), .Q(product[14]) );
  LATCHX1 \product_reg[15]  ( .CLK(N137), .D(mult_product[16]), .Q(product[15]) );
  LATCHX1 \product_reg[16]  ( .CLK(N137), .D(mult_product[17]), .Q(product[16]) );
  LATCHX1 \product_reg[17]  ( .CLK(N137), .D(mult_product[18]), .Q(product[17]) );
  LATCHX1 \product_reg[18]  ( .CLK(N137), .D(mult_product[19]), .Q(product[18]) );
  LATCHX1 \product_reg[19]  ( .CLK(N137), .D(mult_product[20]), .Q(product[19]) );
  LATCHX1 \product_reg[20]  ( .CLK(N137), .D(mult_product[21]), .Q(product[20]) );
  LATCHX1 \product_reg[21]  ( .CLK(N137), .D(mult_product[22]), .Q(product[21]) );
  LATCHX1 \product_reg[22]  ( .CLK(N137), .D(mult_product[23]), .Q(product[22]) );
  LATCHX1 \product_reg[23]  ( .CLK(N137), .D(mult_product[24]), .Q(product[23]) );
  LATCHX1 \product_reg[24]  ( .CLK(N137), .D(mult_product[25]), .Q(product[24]) );
  LATCHX1 \product_reg[25]  ( .CLK(N137), .D(mult_product[26]), .Q(product[25]) );
  LATCHX1 \product_reg[26]  ( .CLK(N137), .D(mult_product[27]), .Q(product[26]) );
  LATCHX1 \product_reg[27]  ( .CLK(N137), .D(mult_product[28]), .Q(product[27]) );
  LATCHX1 \product_reg[28]  ( .CLK(N137), .D(mult_product[29]), .Q(product[28]) );
  LATCHX1 \product_reg[29]  ( .CLK(N137), .D(mult_product[30]), .Q(product[29]) );
  LATCHX1 \product_reg[30]  ( .CLK(N137), .D(mult_product[31]), .Q(product[30]) );
  LATCHX1 \product_reg[31]  ( .CLK(N137), .D(mult_product[32]), .Q(product[31]) );
  LATCHX1 \product_reg[32]  ( .CLK(N137), .D(mult_product[33]), .Q(product[32]) );
  LATCHX1 \product_reg[33]  ( .CLK(N137), .D(mult_product[34]), .Q(product[33]) );
  LATCHX1 \product_reg[34]  ( .CLK(N137), .D(mult_product[35]), .Q(product[34]) );
  LATCHX1 \product_reg[35]  ( .CLK(N137), .D(mult_product[36]), .Q(product[35]) );
  LATCHX1 \product_reg[36]  ( .CLK(N137), .D(mult_product[37]), .Q(product[36]) );
  LATCHX1 \product_reg[37]  ( .CLK(N137), .D(mult_product[38]), .Q(product[37]) );
  LATCHX1 \product_reg[38]  ( .CLK(N137), .D(mult_product[39]), .Q(product[38]) );
  LATCHX1 \product_reg[39]  ( .CLK(N137), .D(mult_product[40]), .Q(product[39]) );
  LATCHX1 \product_reg[40]  ( .CLK(N137), .D(mult_product[41]), .Q(product[40]) );
  LATCHX1 \product_reg[41]  ( .CLK(N137), .D(mult_product[42]), .Q(product[41]) );
  LATCHX1 \product_reg[42]  ( .CLK(N137), .D(mult_product[43]), .Q(product[42]) );
  LATCHX1 \product_reg[43]  ( .CLK(N137), .D(mult_product[44]), .Q(product[43]) );
  LATCHX1 \product_reg[44]  ( .CLK(N137), .D(mult_product[45]), .Q(product[44]) );
  LATCHX1 \product_reg[45]  ( .CLK(N137), .D(mult_product[46]), .Q(product[45]) );
  LATCHX1 \product_reg[46]  ( .CLK(N137), .D(mult_product[47]), .Q(product[46]) );
  LATCHX1 \product_reg[47]  ( .CLK(N137), .D(mult_product[48]), .Q(product[47]) );
  LATCHX1 \product_reg[48]  ( .CLK(N137), .D(mult_product[49]), .Q(product[48]) );
  LATCHX1 \product_reg[49]  ( .CLK(N137), .D(mult_product[50]), .Q(product[49]) );
  LATCHX1 \product_reg[50]  ( .CLK(N137), .D(mult_product[51]), .Q(product[50]) );
  LATCHX1 \product_reg[51]  ( .CLK(N137), .D(mult_product[52]), .Q(product[51]) );
  LATCHX1 \product_reg[52]  ( .CLK(N137), .D(mult_product[53]), .Q(product[52]) );
  LATCHX1 \product_reg[53]  ( .CLK(N137), .D(mult_product[54]), .Q(product[53]) );
  LATCHX1 \product_reg[54]  ( .CLK(N137), .D(mult_product[55]), .Q(product[54]) );
  LATCHX1 \product_reg[55]  ( .CLK(N137), .D(mult_product[56]), .Q(product[55]) );
  LATCHX1 \product_reg[56]  ( .CLK(N137), .D(mult_product[57]), .Q(product[56]) );
  LATCHX1 \product_reg[57]  ( .CLK(N137), .D(mult_product[58]), .Q(product[57]) );
  LATCHX1 \product_reg[58]  ( .CLK(N137), .D(mult_product[59]), .Q(product[58]) );
  LATCHX1 \product_reg[59]  ( .CLK(N137), .D(mult_product[60]), .Q(product[59]) );
  LATCHX1 \product_reg[60]  ( .CLK(N137), .D(mult_product[61]), .Q(product[60]) );
  LATCHX1 \product_reg[61]  ( .CLK(N137), .D(mult_product[62]), .Q(product[61]) );
  LATCHX1 \product_reg[62]  ( .CLK(N137), .D(mult_product[63]), .Q(product[62]) );
  INVX0 U96 ( .IN(reset), .QN(n44) );
  INVX0 U97 ( .IN(n21), .QN(n45) );
  AO22X1 U98 ( .IN1(N17), .IN2(n22), .IN3(n23), .IN4(mult_product[34]), .Q(N99) );
  AO22X1 U99 ( .IN1(N16), .IN2(n22), .IN3(n23), .IN4(mult_product[33]), .Q(N98) );
  NAND3X0 U100 ( .IN1(n24), .IN2(n25), .IN3(n26), .QN(N97) );
  OR2X1 U101 ( .IN1(n27), .IN2(start), .Q(n26) );
  AO22X1 U102 ( .IN1(n23), .IN2(mult_product[32]), .IN3(b_in[31]), .IN4(n28), 
        .Q(N96) );
  AO22X1 U103 ( .IN1(n23), .IN2(mult_product[31]), .IN3(b_in[30]), .IN4(n28), 
        .Q(N95) );
  AO22X1 U104 ( .IN1(n23), .IN2(mult_product[30]), .IN3(b_in[29]), .IN4(n28), 
        .Q(N94) );
  AO22X1 U105 ( .IN1(n23), .IN2(mult_product[29]), .IN3(b_in[28]), .IN4(n28), 
        .Q(N93) );
  AO22X1 U106 ( .IN1(n23), .IN2(mult_product[28]), .IN3(b_in[27]), .IN4(n28), 
        .Q(N92) );
  AO22X1 U107 ( .IN1(n23), .IN2(mult_product[27]), .IN3(b_in[26]), .IN4(n28), 
        .Q(N91) );
  AO22X1 U108 ( .IN1(n23), .IN2(mult_product[26]), .IN3(b_in[25]), .IN4(n28), 
        .Q(N90) );
  AO22X1 U109 ( .IN1(n23), .IN2(mult_product[25]), .IN3(b_in[24]), .IN4(n28), 
        .Q(N89) );
  AO22X1 U110 ( .IN1(n23), .IN2(mult_product[24]), .IN3(b_in[23]), .IN4(n28), 
        .Q(N88) );
  AO22X1 U111 ( .IN1(n23), .IN2(mult_product[23]), .IN3(b_in[22]), .IN4(n28), 
        .Q(N87) );
  AO22X1 U112 ( .IN1(n23), .IN2(mult_product[22]), .IN3(b_in[21]), .IN4(n28), 
        .Q(N86) );
  AO22X1 U113 ( .IN1(n23), .IN2(mult_product[21]), .IN3(b_in[20]), .IN4(n28), 
        .Q(N85) );
  AO22X1 U114 ( .IN1(n23), .IN2(mult_product[20]), .IN3(b_in[19]), .IN4(n28), 
        .Q(N84) );
  AO22X1 U115 ( .IN1(n23), .IN2(mult_product[19]), .IN3(b_in[18]), .IN4(n28), 
        .Q(N83) );
  AO22X1 U116 ( .IN1(n23), .IN2(mult_product[18]), .IN3(b_in[17]), .IN4(n28), 
        .Q(N82) );
  AO22X1 U117 ( .IN1(n23), .IN2(mult_product[17]), .IN3(b_in[16]), .IN4(n28), 
        .Q(N81) );
  AO22X1 U118 ( .IN1(n23), .IN2(mult_product[16]), .IN3(b_in[15]), .IN4(n28), 
        .Q(N80) );
  AO22X1 U119 ( .IN1(n23), .IN2(mult_product[15]), .IN3(b_in[14]), .IN4(n28), 
        .Q(N79) );
  AO22X1 U120 ( .IN1(n23), .IN2(mult_product[14]), .IN3(b_in[13]), .IN4(n28), 
        .Q(N78) );
  AO22X1 U121 ( .IN1(n23), .IN2(mult_product[13]), .IN3(b_in[12]), .IN4(n28), 
        .Q(N77) );
  AO22X1 U122 ( .IN1(n23), .IN2(mult_product[12]), .IN3(b_in[11]), .IN4(n28), 
        .Q(N76) );
  AO22X1 U123 ( .IN1(n23), .IN2(mult_product[11]), .IN3(b_in[10]), .IN4(n28), 
        .Q(N75) );
  AO22X1 U124 ( .IN1(n23), .IN2(mult_product[10]), .IN3(b_in[9]), .IN4(n28), 
        .Q(N74) );
  AO22X1 U125 ( .IN1(n23), .IN2(mult_product[9]), .IN3(b_in[8]), .IN4(n28), 
        .Q(N73) );
  AO22X1 U126 ( .IN1(n23), .IN2(mult_product[8]), .IN3(b_in[7]), .IN4(n28), 
        .Q(N72) );
  AO22X1 U127 ( .IN1(n23), .IN2(mult_product[7]), .IN3(b_in[6]), .IN4(n28), 
        .Q(N71) );
  AO22X1 U128 ( .IN1(n23), .IN2(mult_product[6]), .IN3(b_in[5]), .IN4(n28), 
        .Q(N70) );
  AO22X1 U129 ( .IN1(n23), .IN2(mult_product[5]), .IN3(b_in[4]), .IN4(n28), 
        .Q(N69) );
  AO22X1 U130 ( .IN1(n23), .IN2(mult_product[4]), .IN3(b_in[3]), .IN4(n28), 
        .Q(N68) );
  AO22X1 U131 ( .IN1(n23), .IN2(mult_product[3]), .IN3(b_in[2]), .IN4(n28), 
        .Q(N67) );
  AO22X1 U132 ( .IN1(n23), .IN2(mult_product[2]), .IN3(b_in[1]), .IN4(n28), 
        .Q(N66) );
  AO22X1 U133 ( .IN1(n23), .IN2(mult_product[1]), .IN3(b_in[0]), .IN4(n28), 
        .Q(N65) );
  NAND4X0 U134 ( .IN1(n29), .IN2(n30), .IN3(n25), .IN4(n27), .QN(N62) );
  NAND2X0 U135 ( .IN1(n38), .IN2(n18), .QN(n29) );
  OR2X1 U136 ( .IN1(N63), .IN2(N64), .Q(N61) );
  NAND2X0 U137 ( .IN1(n21), .IN2(n24), .QN(N64) );
  NAND2X0 U138 ( .IN1(start), .IN2(n28), .QN(n21) );
  INVX0 U139 ( .IN(n27), .QN(n28) );
  NAND2X0 U140 ( .IN1(n19), .IN2(n18), .QN(n27) );
  AO21X1 U141 ( .IN1(present_state[0]), .IN2(n18), .IN3(n22), .Q(N63) );
  NOR3X0 U142 ( .IN1(n31), .IN2(n43), .IN3(n24), .QN(N137) );
  AOI21X1 U143 ( .IN1(n31), .IN2(n43), .IN3(n30), .QN(N135) );
  NOR2X0 U144 ( .IN1(n30), .IN2(n32), .QN(N134) );
  XOR2X1 U145 ( .IN1(n42), .IN2(n33), .Q(n32) );
  MUX21X1 U146 ( .IN1(n34), .IN2(n35), .S(n41), .Q(N133) );
  NOR3X0 U147 ( .IN1(n30), .IN2(n39), .IN3(n40), .QN(n35) );
  AO21X1 U148 ( .IN1(n40), .IN2(n36), .IN3(N131), .Q(n34) );
  MUX21X1 U149 ( .IN1(N131), .IN2(n37), .S(n40), .Q(N132) );
  NOR2X0 U150 ( .IN1(n39), .IN2(n30), .QN(n37) );
  INVX0 U151 ( .IN(n36), .QN(n30) );
  AND2X1 U152 ( .IN1(n39), .IN2(n36), .Q(N131) );
  OA21X1 U153 ( .IN1(n31), .IN2(n43), .IN3(n23), .Q(n36) );
  NAND2X0 U154 ( .IN1(n33), .IN2(n20), .QN(n31) );
  NOR3X0 U155 ( .IN1(n40), .IN2(n39), .IN3(n41), .QN(n33) );
  AND2X1 U156 ( .IN1(N47), .IN2(n22), .Q(N129) );
  AO22X1 U157 ( .IN1(N46), .IN2(n22), .IN3(n23), .IN4(mult_product[63]), .Q(
        N128) );
  AO22X1 U158 ( .IN1(N45), .IN2(n22), .IN3(n23), .IN4(mult_product[62]), .Q(
        N127) );
  AO22X1 U159 ( .IN1(N44), .IN2(n22), .IN3(n23), .IN4(mult_product[61]), .Q(
        N126) );
  AO22X1 U160 ( .IN1(N43), .IN2(n22), .IN3(n23), .IN4(mult_product[60]), .Q(
        N125) );
  AO22X1 U161 ( .IN1(N42), .IN2(n22), .IN3(n23), .IN4(mult_product[59]), .Q(
        N124) );
  AO22X1 U162 ( .IN1(N41), .IN2(n22), .IN3(n23), .IN4(mult_product[58]), .Q(
        N123) );
  AO22X1 U163 ( .IN1(N40), .IN2(n22), .IN3(n23), .IN4(mult_product[57]), .Q(
        N122) );
  AO22X1 U164 ( .IN1(N39), .IN2(n22), .IN3(n23), .IN4(mult_product[56]), .Q(
        N121) );
  AO22X1 U165 ( .IN1(N38), .IN2(n22), .IN3(n23), .IN4(mult_product[55]), .Q(
        N120) );
  AO22X1 U166 ( .IN1(N37), .IN2(n22), .IN3(n23), .IN4(mult_product[54]), .Q(
        N119) );
  AO22X1 U167 ( .IN1(N36), .IN2(n22), .IN3(n23), .IN4(mult_product[53]), .Q(
        N118) );
  AO22X1 U168 ( .IN1(N35), .IN2(n22), .IN3(n23), .IN4(mult_product[52]), .Q(
        N117) );
  AO22X1 U169 ( .IN1(N34), .IN2(n22), .IN3(n23), .IN4(mult_product[51]), .Q(
        N116) );
  AO22X1 U170 ( .IN1(N33), .IN2(n22), .IN3(n23), .IN4(mult_product[50]), .Q(
        N115) );
  AO22X1 U171 ( .IN1(N32), .IN2(n22), .IN3(n23), .IN4(mult_product[49]), .Q(
        N114) );
  AO22X1 U172 ( .IN1(N31), .IN2(n22), .IN3(n23), .IN4(mult_product[48]), .Q(
        N113) );
  AO22X1 U173 ( .IN1(N30), .IN2(n22), .IN3(n23), .IN4(mult_product[47]), .Q(
        N112) );
  AO22X1 U174 ( .IN1(N29), .IN2(n22), .IN3(n23), .IN4(mult_product[46]), .Q(
        N111) );
  AO22X1 U175 ( .IN1(N28), .IN2(n22), .IN3(n23), .IN4(mult_product[45]), .Q(
        N110) );
  AO22X1 U176 ( .IN1(N27), .IN2(n22), .IN3(n23), .IN4(mult_product[44]), .Q(
        N109) );
  AO22X1 U177 ( .IN1(N26), .IN2(n22), .IN3(n23), .IN4(mult_product[43]), .Q(
        N108) );
  AO22X1 U178 ( .IN1(N25), .IN2(n22), .IN3(n23), .IN4(mult_product[42]), .Q(
        N107) );
  AO22X1 U179 ( .IN1(N24), .IN2(n22), .IN3(n23), .IN4(mult_product[41]), .Q(
        N106) );
  AO22X1 U180 ( .IN1(N23), .IN2(n22), .IN3(n23), .IN4(mult_product[40]), .Q(
        N105) );
  AO22X1 U181 ( .IN1(N22), .IN2(n22), .IN3(n23), .IN4(mult_product[39]), .Q(
        N104) );
  AO22X1 U182 ( .IN1(N21), .IN2(n22), .IN3(n23), .IN4(mult_product[38]), .Q(
        N103) );
  AO22X1 U183 ( .IN1(N20), .IN2(n22), .IN3(n23), .IN4(mult_product[37]), .Q(
        N102) );
  AO22X1 U184 ( .IN1(N19), .IN2(n22), .IN3(n23), .IN4(mult_product[36]), .Q(
        N101) );
  AO22X1 U185 ( .IN1(N18), .IN2(n22), .IN3(n23), .IN4(mult_product[35]), .Q(
        N100) );
  INVX0 U186 ( .IN(n24), .QN(n23) );
  NAND2X0 U187 ( .IN1(present_state[1]), .IN2(present_state[0]), .QN(n24) );
  INVX0 U188 ( .IN(n25), .QN(n22) );
  NAND2X0 U189 ( .IN1(present_state[1]), .IN2(n19), .QN(n25) );
endmodule

