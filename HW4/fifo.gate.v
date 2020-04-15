/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Tue May 14 18:59:04 2019
/////////////////////////////////////////////////////////////


module fifo ( wr_clk, rd_clk, reset_n, wr, rd, data_in, data_out, empty, full
 );
  input [7:0] data_in;
  output [7:0] data_out;
  input wr_clk, rd_clk, reset_n, wr, rd;
  output empty, full;
  wire   N16, N17, N18, \rd_ptr[3] , \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] ,
         \mem[1][7] , \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] ,
         \mem[1][2] , \mem[1][1] , \mem[1][0] , \mem[2][7] , \mem[2][6] ,
         \mem[2][5] , \mem[2][4] , \mem[2][3] , \mem[2][2] , \mem[2][1] ,
         \mem[2][0] , \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] ,
         \mem[3][3] , \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[4][7] ,
         \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] , \mem[4][2] ,
         \mem[4][1] , \mem[4][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[6][7] , \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] ,
         \mem[6][2] , \mem[6][1] , \mem[6][0] , \mem[7][7] , \mem[7][6] ,
         \mem[7][5] , \mem[7][4] , \mem[7][3] , \mem[7][2] , \mem[7][1] ,
         \mem[7][0] , N53, N54, N55, N56, N57, N58, N59, N60, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193;
  wire   [3:0] wr_ptr;

  DFFX1 \mem_reg[0][7]  ( .D(n68), .CLK(wr_clk), .Q(\mem[0][7] ) );
  DFFX1 \mem_reg[0][6]  ( .D(n69), .CLK(wr_clk), .Q(\mem[0][6] ) );
  DFFX1 \mem_reg[0][5]  ( .D(n70), .CLK(wr_clk), .Q(\mem[0][5] ) );
  DFFX1 \mem_reg[0][4]  ( .D(n71), .CLK(wr_clk), .Q(\mem[0][4] ) );
  DFFX1 \mem_reg[0][3]  ( .D(n72), .CLK(wr_clk), .Q(\mem[0][3] ) );
  DFFX1 \mem_reg[0][2]  ( .D(n73), .CLK(wr_clk), .Q(\mem[0][2] ) );
  DFFX1 \mem_reg[0][1]  ( .D(n74), .CLK(wr_clk), .Q(\mem[0][1] ) );
  DFFX1 \mem_reg[0][0]  ( .D(n75), .CLK(wr_clk), .Q(\mem[0][0] ) );
  DFFX1 \mem_reg[1][7]  ( .D(n76), .CLK(wr_clk), .Q(\mem[1][7] ) );
  DFFX1 \mem_reg[1][6]  ( .D(n77), .CLK(wr_clk), .Q(\mem[1][6] ) );
  DFFX1 \mem_reg[1][5]  ( .D(n78), .CLK(wr_clk), .Q(\mem[1][5] ) );
  DFFX1 \mem_reg[1][4]  ( .D(n79), .CLK(wr_clk), .Q(\mem[1][4] ) );
  DFFX1 \mem_reg[1][3]  ( .D(n80), .CLK(wr_clk), .Q(\mem[1][3] ) );
  DFFX1 \mem_reg[1][2]  ( .D(n81), .CLK(wr_clk), .Q(\mem[1][2] ) );
  DFFX1 \mem_reg[1][1]  ( .D(n82), .CLK(wr_clk), .Q(\mem[1][1] ) );
  DFFX1 \mem_reg[1][0]  ( .D(n83), .CLK(wr_clk), .Q(\mem[1][0] ) );
  DFFX1 \mem_reg[3][7]  ( .D(n92), .CLK(wr_clk), .Q(\mem[3][7] ) );
  DFFX1 \mem_reg[3][6]  ( .D(n93), .CLK(wr_clk), .Q(\mem[3][6] ) );
  DFFX1 \mem_reg[3][5]  ( .D(n94), .CLK(wr_clk), .Q(\mem[3][5] ) );
  DFFX1 \mem_reg[3][4]  ( .D(n95), .CLK(wr_clk), .Q(\mem[3][4] ) );
  DFFX1 \mem_reg[3][3]  ( .D(n96), .CLK(wr_clk), .Q(\mem[3][3] ) );
  DFFX1 \mem_reg[3][2]  ( .D(n97), .CLK(wr_clk), .Q(\mem[3][2] ) );
  DFFX1 \mem_reg[3][1]  ( .D(n98), .CLK(wr_clk), .Q(\mem[3][1] ) );
  DFFX1 \mem_reg[3][0]  ( .D(n99), .CLK(wr_clk), .Q(\mem[3][0] ) );
  DFFX1 \mem_reg[2][7]  ( .D(n84), .CLK(wr_clk), .Q(\mem[2][7] ) );
  DFFX1 \mem_reg[2][6]  ( .D(n85), .CLK(wr_clk), .Q(\mem[2][6] ) );
  DFFX1 \mem_reg[2][5]  ( .D(n86), .CLK(wr_clk), .Q(\mem[2][5] ) );
  DFFX1 \mem_reg[2][4]  ( .D(n87), .CLK(wr_clk), .Q(\mem[2][4] ) );
  DFFX1 \mem_reg[2][3]  ( .D(n88), .CLK(wr_clk), .Q(\mem[2][3] ) );
  DFFX1 \mem_reg[2][2]  ( .D(n89), .CLK(wr_clk), .Q(\mem[2][2] ) );
  DFFX1 \mem_reg[2][1]  ( .D(n90), .CLK(wr_clk), .Q(\mem[2][1] ) );
  DFFX1 \mem_reg[2][0]  ( .D(n91), .CLK(wr_clk), .Q(\mem[2][0] ) );
  DFFX1 \mem_reg[7][7]  ( .D(n124), .CLK(wr_clk), .Q(\mem[7][7] ) );
  DFFX1 \mem_reg[7][6]  ( .D(n125), .CLK(wr_clk), .Q(\mem[7][6] ) );
  DFFX1 \mem_reg[7][5]  ( .D(n126), .CLK(wr_clk), .Q(\mem[7][5] ) );
  DFFX1 \mem_reg[7][4]  ( .D(n127), .CLK(wr_clk), .Q(\mem[7][4] ) );
  DFFX1 \mem_reg[7][3]  ( .D(n128), .CLK(wr_clk), .Q(\mem[7][3] ) );
  DFFX1 \mem_reg[7][2]  ( .D(n129), .CLK(wr_clk), .Q(\mem[7][2] ) );
  DFFX1 \mem_reg[7][1]  ( .D(n130), .CLK(wr_clk), .Q(\mem[7][1] ) );
  DFFX1 \mem_reg[7][0]  ( .D(n131), .CLK(wr_clk), .Q(\mem[7][0] ) );
  DFFX1 \mem_reg[6][7]  ( .D(n116), .CLK(wr_clk), .Q(\mem[6][7] ) );
  DFFX1 \mem_reg[6][6]  ( .D(n117), .CLK(wr_clk), .Q(\mem[6][6] ) );
  DFFX1 \mem_reg[6][5]  ( .D(n118), .CLK(wr_clk), .Q(\mem[6][5] ) );
  DFFX1 \mem_reg[6][4]  ( .D(n119), .CLK(wr_clk), .Q(\mem[6][4] ) );
  DFFX1 \mem_reg[6][3]  ( .D(n120), .CLK(wr_clk), .Q(\mem[6][3] ) );
  DFFX1 \mem_reg[6][2]  ( .D(n121), .CLK(wr_clk), .Q(\mem[6][2] ) );
  DFFX1 \mem_reg[6][1]  ( .D(n122), .CLK(wr_clk), .Q(\mem[6][1] ) );
  DFFX1 \mem_reg[6][0]  ( .D(n123), .CLK(wr_clk), .Q(\mem[6][0] ) );
  DFFX1 \mem_reg[4][7]  ( .D(n100), .CLK(wr_clk), .Q(\mem[4][7] ) );
  DFFX1 \mem_reg[4][6]  ( .D(n101), .CLK(wr_clk), .Q(\mem[4][6] ) );
  DFFX1 \mem_reg[4][5]  ( .D(n102), .CLK(wr_clk), .Q(\mem[4][5] ) );
  DFFX1 \mem_reg[4][4]  ( .D(n103), .CLK(wr_clk), .Q(\mem[4][4] ) );
  DFFX1 \mem_reg[4][3]  ( .D(n104), .CLK(wr_clk), .Q(\mem[4][3] ) );
  DFFX1 \mem_reg[4][2]  ( .D(n105), .CLK(wr_clk), .Q(\mem[4][2] ) );
  DFFX1 \mem_reg[4][1]  ( .D(n106), .CLK(wr_clk), .Q(\mem[4][1] ) );
  DFFX1 \mem_reg[4][0]  ( .D(n107), .CLK(wr_clk), .Q(\mem[4][0] ) );
  DFFX1 \mem_reg[5][7]  ( .D(n108), .CLK(wr_clk), .Q(\mem[5][7] ) );
  DFFX1 \mem_reg[5][6]  ( .D(n109), .CLK(wr_clk), .Q(\mem[5][6] ) );
  DFFX1 \mem_reg[5][5]  ( .D(n110), .CLK(wr_clk), .Q(\mem[5][5] ) );
  DFFX1 \mem_reg[5][4]  ( .D(n111), .CLK(wr_clk), .Q(\mem[5][4] ) );
  DFFX1 \mem_reg[5][3]  ( .D(n112), .CLK(wr_clk), .Q(\mem[5][3] ) );
  DFFX1 \mem_reg[5][2]  ( .D(n113), .CLK(wr_clk), .Q(\mem[5][2] ) );
  DFFX1 \mem_reg[5][1]  ( .D(n114), .CLK(wr_clk), .Q(\mem[5][1] ) );
  DFFX1 \mem_reg[5][0]  ( .D(n115), .CLK(wr_clk), .Q(\mem[5][0] ) );
  DFFARX1 \wr_ptr_reg[2]  ( .D(n65), .CLK(wr_clk), .RSTB(reset_n), .Q(
        wr_ptr[2]), .QN(n134) );
  DFFARX1 \rd_ptr_reg[3]  ( .D(n60), .CLK(rd_clk), .RSTB(reset_n), .Q(
        \rd_ptr[3] ) );
  DFFARX1 \wr_ptr_reg[3]  ( .D(n64), .CLK(wr_clk), .RSTB(reset_n), .Q(
        wr_ptr[3]) );
  DFFARX1 \wr_ptr_reg[1]  ( .D(n66), .CLK(wr_clk), .RSTB(reset_n), .Q(
        wr_ptr[1]), .QN(n133) );
  DFFARX1 \rd_ptr_reg[1]  ( .D(n62), .CLK(rd_clk), .RSTB(reset_n), .Q(N17), 
        .QN(n58) );
  DFFARX1 \rd_ptr_reg[2]  ( .D(n61), .CLK(rd_clk), .RSTB(reset_n), .Q(N18), 
        .QN(n57) );
  DFFARX1 \wr_ptr_reg[0]  ( .D(n67), .CLK(wr_clk), .RSTB(reset_n), .Q(
        wr_ptr[0]), .QN(n132) );
  DFFARX1 \rd_ptr_reg[0]  ( .D(n63), .CLK(rd_clk), .RSTB(reset_n), .Q(N16), 
        .QN(n59) );
  NOR2X0 U129 ( .IN1(n57), .IN2(N17), .QN(n168) );
  NOR2X0 U130 ( .IN1(n57), .IN2(n58), .QN(n167) );
  NOR2X0 U131 ( .IN1(n58), .IN2(N18), .QN(n165) );
  NOR2X0 U132 ( .IN1(N17), .IN2(N18), .QN(n164) );
  AO22X1 U133 ( .IN1(\mem[3][0] ), .IN2(n165), .IN3(\mem[1][0] ), .IN4(n164), 
        .Q(n135) );
  AO221X1 U134 ( .IN1(\mem[5][0] ), .IN2(n168), .IN3(\mem[7][0] ), .IN4(n167), 
        .IN5(n135), .Q(n138) );
  AO22X1 U135 ( .IN1(\mem[2][0] ), .IN2(n165), .IN3(\mem[0][0] ), .IN4(n164), 
        .Q(n136) );
  AO221X1 U136 ( .IN1(\mem[4][0] ), .IN2(n168), .IN3(\mem[6][0] ), .IN4(n167), 
        .IN5(n136), .Q(n137) );
  AO22X1 U137 ( .IN1(n138), .IN2(N16), .IN3(n137), .IN4(n59), .Q(N60) );
  AO22X1 U138 ( .IN1(\mem[3][1] ), .IN2(n165), .IN3(\mem[1][1] ), .IN4(n164), 
        .Q(n139) );
  AO221X1 U139 ( .IN1(\mem[5][1] ), .IN2(n168), .IN3(\mem[7][1] ), .IN4(n167), 
        .IN5(n139), .Q(n142) );
  AO22X1 U140 ( .IN1(\mem[2][1] ), .IN2(n165), .IN3(\mem[0][1] ), .IN4(n164), 
        .Q(n140) );
  AO221X1 U141 ( .IN1(\mem[4][1] ), .IN2(n168), .IN3(\mem[6][1] ), .IN4(n167), 
        .IN5(n140), .Q(n141) );
  AO22X1 U142 ( .IN1(n142), .IN2(N16), .IN3(n141), .IN4(n59), .Q(N59) );
  AO22X1 U143 ( .IN1(\mem[3][2] ), .IN2(n165), .IN3(\mem[1][2] ), .IN4(n164), 
        .Q(n143) );
  AO221X1 U144 ( .IN1(\mem[5][2] ), .IN2(n168), .IN3(\mem[7][2] ), .IN4(n167), 
        .IN5(n143), .Q(n146) );
  AO22X1 U145 ( .IN1(\mem[2][2] ), .IN2(n165), .IN3(\mem[0][2] ), .IN4(n164), 
        .Q(n144) );
  AO221X1 U146 ( .IN1(\mem[4][2] ), .IN2(n168), .IN3(\mem[6][2] ), .IN4(n167), 
        .IN5(n144), .Q(n145) );
  AO22X1 U147 ( .IN1(n146), .IN2(N16), .IN3(n145), .IN4(n59), .Q(N58) );
  AO22X1 U148 ( .IN1(\mem[3][3] ), .IN2(n165), .IN3(\mem[1][3] ), .IN4(n164), 
        .Q(n147) );
  AO221X1 U149 ( .IN1(\mem[5][3] ), .IN2(n168), .IN3(\mem[7][3] ), .IN4(n167), 
        .IN5(n147), .Q(n150) );
  AO22X1 U150 ( .IN1(\mem[2][3] ), .IN2(n165), .IN3(\mem[0][3] ), .IN4(n164), 
        .Q(n148) );
  AO221X1 U151 ( .IN1(\mem[4][3] ), .IN2(n168), .IN3(\mem[6][3] ), .IN4(n167), 
        .IN5(n148), .Q(n149) );
  AO22X1 U152 ( .IN1(n150), .IN2(N16), .IN3(n149), .IN4(n59), .Q(N57) );
  AO22X1 U153 ( .IN1(\mem[3][4] ), .IN2(n165), .IN3(\mem[1][4] ), .IN4(n164), 
        .Q(n151) );
  AO221X1 U154 ( .IN1(\mem[5][4] ), .IN2(n168), .IN3(\mem[7][4] ), .IN4(n167), 
        .IN5(n151), .Q(n154) );
  AO22X1 U155 ( .IN1(\mem[2][4] ), .IN2(n165), .IN3(\mem[0][4] ), .IN4(n164), 
        .Q(n152) );
  AO221X1 U156 ( .IN1(\mem[4][4] ), .IN2(n168), .IN3(\mem[6][4] ), .IN4(n167), 
        .IN5(n152), .Q(n153) );
  AO22X1 U157 ( .IN1(n154), .IN2(N16), .IN3(n153), .IN4(n59), .Q(N56) );
  AO22X1 U158 ( .IN1(\mem[3][5] ), .IN2(n165), .IN3(\mem[1][5] ), .IN4(n164), 
        .Q(n155) );
  AO221X1 U159 ( .IN1(\mem[5][5] ), .IN2(n168), .IN3(\mem[7][5] ), .IN4(n167), 
        .IN5(n155), .Q(n158) );
  AO22X1 U160 ( .IN1(\mem[2][5] ), .IN2(n165), .IN3(\mem[0][5] ), .IN4(n164), 
        .Q(n156) );
  AO221X1 U161 ( .IN1(\mem[4][5] ), .IN2(n168), .IN3(\mem[6][5] ), .IN4(n167), 
        .IN5(n156), .Q(n157) );
  AO22X1 U162 ( .IN1(n158), .IN2(N16), .IN3(n157), .IN4(n59), .Q(N55) );
  AO22X1 U163 ( .IN1(\mem[3][6] ), .IN2(n165), .IN3(\mem[1][6] ), .IN4(n164), 
        .Q(n159) );
  AO221X1 U164 ( .IN1(\mem[5][6] ), .IN2(n168), .IN3(\mem[7][6] ), .IN4(n167), 
        .IN5(n159), .Q(n162) );
  AO22X1 U165 ( .IN1(\mem[2][6] ), .IN2(n165), .IN3(\mem[0][6] ), .IN4(n164), 
        .Q(n160) );
  AO221X1 U166 ( .IN1(\mem[4][6] ), .IN2(n168), .IN3(\mem[6][6] ), .IN4(n167), 
        .IN5(n160), .Q(n161) );
  AO22X1 U167 ( .IN1(n162), .IN2(N16), .IN3(n161), .IN4(n59), .Q(N54) );
  AO22X1 U168 ( .IN1(\mem[3][7] ), .IN2(n165), .IN3(\mem[1][7] ), .IN4(n164), 
        .Q(n163) );
  AO221X1 U169 ( .IN1(\mem[5][7] ), .IN2(n168), .IN3(\mem[7][7] ), .IN4(n167), 
        .IN5(n163), .Q(n170) );
  AO22X1 U170 ( .IN1(\mem[2][7] ), .IN2(n165), .IN3(\mem[0][7] ), .IN4(n164), 
        .Q(n166) );
  AO221X1 U171 ( .IN1(\mem[4][7] ), .IN2(n168), .IN3(\mem[6][7] ), .IN4(n167), 
        .IN5(n166), .Q(n169) );
  AO22X1 U172 ( .IN1(N16), .IN2(n170), .IN3(n169), .IN4(n59), .Q(N53) );
  MUX21X1 U173 ( .IN1(\mem[3][0] ), .IN2(data_in[0]), .S(n171), .Q(n99) );
  MUX21X1 U174 ( .IN1(\mem[3][1] ), .IN2(data_in[1]), .S(n171), .Q(n98) );
  MUX21X1 U175 ( .IN1(\mem[3][2] ), .IN2(data_in[2]), .S(n171), .Q(n97) );
  MUX21X1 U176 ( .IN1(\mem[3][3] ), .IN2(data_in[3]), .S(n171), .Q(n96) );
  MUX21X1 U177 ( .IN1(\mem[3][4] ), .IN2(data_in[4]), .S(n171), .Q(n95) );
  MUX21X1 U178 ( .IN1(\mem[3][5] ), .IN2(data_in[5]), .S(n171), .Q(n94) );
  MUX21X1 U179 ( .IN1(\mem[3][6] ), .IN2(data_in[6]), .S(n171), .Q(n93) );
  MUX21X1 U180 ( .IN1(\mem[3][7] ), .IN2(data_in[7]), .S(n171), .Q(n92) );
  AND3X1 U181 ( .IN1(wr_ptr[0]), .IN2(n172), .IN3(wr_ptr[1]), .Q(n171) );
  MUX21X1 U182 ( .IN1(\mem[2][0] ), .IN2(data_in[0]), .S(n173), .Q(n91) );
  MUX21X1 U183 ( .IN1(\mem[2][1] ), .IN2(data_in[1]), .S(n173), .Q(n90) );
  MUX21X1 U184 ( .IN1(\mem[2][2] ), .IN2(data_in[2]), .S(n173), .Q(n89) );
  MUX21X1 U185 ( .IN1(\mem[2][3] ), .IN2(data_in[3]), .S(n173), .Q(n88) );
  MUX21X1 U186 ( .IN1(\mem[2][4] ), .IN2(data_in[4]), .S(n173), .Q(n87) );
  MUX21X1 U187 ( .IN1(\mem[2][5] ), .IN2(data_in[5]), .S(n173), .Q(n86) );
  MUX21X1 U188 ( .IN1(\mem[2][6] ), .IN2(data_in[6]), .S(n173), .Q(n85) );
  MUX21X1 U189 ( .IN1(\mem[2][7] ), .IN2(data_in[7]), .S(n173), .Q(n84) );
  AND3X1 U190 ( .IN1(n172), .IN2(n132), .IN3(wr_ptr[1]), .Q(n173) );
  MUX21X1 U191 ( .IN1(\mem[1][0] ), .IN2(data_in[0]), .S(n174), .Q(n83) );
  MUX21X1 U192 ( .IN1(\mem[1][1] ), .IN2(data_in[1]), .S(n174), .Q(n82) );
  MUX21X1 U193 ( .IN1(\mem[1][2] ), .IN2(data_in[2]), .S(n174), .Q(n81) );
  MUX21X1 U194 ( .IN1(\mem[1][3] ), .IN2(data_in[3]), .S(n174), .Q(n80) );
  MUX21X1 U195 ( .IN1(\mem[1][4] ), .IN2(data_in[4]), .S(n174), .Q(n79) );
  MUX21X1 U196 ( .IN1(\mem[1][5] ), .IN2(data_in[5]), .S(n174), .Q(n78) );
  MUX21X1 U197 ( .IN1(\mem[1][6] ), .IN2(data_in[6]), .S(n174), .Q(n77) );
  MUX21X1 U198 ( .IN1(\mem[1][7] ), .IN2(data_in[7]), .S(n174), .Q(n76) );
  AND3X1 U199 ( .IN1(n172), .IN2(n133), .IN3(wr_ptr[0]), .Q(n174) );
  MUX21X1 U200 ( .IN1(\mem[0][0] ), .IN2(data_in[0]), .S(n175), .Q(n75) );
  MUX21X1 U201 ( .IN1(\mem[0][1] ), .IN2(data_in[1]), .S(n175), .Q(n74) );
  MUX21X1 U202 ( .IN1(\mem[0][2] ), .IN2(data_in[2]), .S(n175), .Q(n73) );
  MUX21X1 U203 ( .IN1(\mem[0][3] ), .IN2(data_in[3]), .S(n175), .Q(n72) );
  MUX21X1 U204 ( .IN1(\mem[0][4] ), .IN2(data_in[4]), .S(n175), .Q(n71) );
  MUX21X1 U205 ( .IN1(\mem[0][5] ), .IN2(data_in[5]), .S(n175), .Q(n70) );
  MUX21X1 U206 ( .IN1(\mem[0][6] ), .IN2(data_in[6]), .S(n175), .Q(n69) );
  MUX21X1 U207 ( .IN1(\mem[0][7] ), .IN2(data_in[7]), .S(n175), .Q(n68) );
  AND3X1 U208 ( .IN1(n132), .IN2(n133), .IN3(n172), .Q(n175) );
  AND3X1 U209 ( .IN1(reset_n), .IN2(n134), .IN3(wr), .Q(n172) );
  XOR2X1 U210 ( .IN1(wr_ptr[0]), .IN2(wr), .Q(n67) );
  XOR2X1 U211 ( .IN1(n133), .IN2(n176), .Q(n66) );
  NAND2X0 U212 ( .IN1(wr_ptr[0]), .IN2(wr), .QN(n176) );
  XOR2X1 U213 ( .IN1(n134), .IN2(n177), .Q(n65) );
  XNOR2X1 U214 ( .IN1(wr_ptr[3]), .IN2(n178), .Q(n64) );
  OR2X1 U215 ( .IN1(n177), .IN2(n134), .Q(n178) );
  NAND3X0 U216 ( .IN1(wr_ptr[0]), .IN2(wr), .IN3(wr_ptr[1]), .QN(n177) );
  XOR2X1 U217 ( .IN1(N16), .IN2(rd), .Q(n63) );
  XOR2X1 U218 ( .IN1(n179), .IN2(n58), .Q(n62) );
  NAND2X0 U219 ( .IN1(rd), .IN2(N16), .QN(n179) );
  XOR2X1 U220 ( .IN1(n180), .IN2(N18), .Q(n61) );
  XNOR2X1 U221 ( .IN1(\rd_ptr[3] ), .IN2(n181), .Q(n60) );
  NAND2X0 U222 ( .IN1(n180), .IN2(N18), .QN(n181) );
  NOR3X0 U223 ( .IN1(n58), .IN2(n59), .IN3(n182), .QN(n180) );
  INVX0 U224 ( .IN(rd), .QN(n182) );
  MUX21X1 U225 ( .IN1(\mem[7][0] ), .IN2(data_in[0]), .S(n183), .Q(n131) );
  MUX21X1 U226 ( .IN1(\mem[7][1] ), .IN2(data_in[1]), .S(n183), .Q(n130) );
  MUX21X1 U227 ( .IN1(\mem[7][2] ), .IN2(data_in[2]), .S(n183), .Q(n129) );
  MUX21X1 U228 ( .IN1(\mem[7][3] ), .IN2(data_in[3]), .S(n183), .Q(n128) );
  MUX21X1 U229 ( .IN1(\mem[7][4] ), .IN2(data_in[4]), .S(n183), .Q(n127) );
  MUX21X1 U230 ( .IN1(\mem[7][5] ), .IN2(data_in[5]), .S(n183), .Q(n126) );
  MUX21X1 U231 ( .IN1(\mem[7][6] ), .IN2(data_in[6]), .S(n183), .Q(n125) );
  MUX21X1 U232 ( .IN1(\mem[7][7] ), .IN2(data_in[7]), .S(n183), .Q(n124) );
  AND3X1 U233 ( .IN1(wr_ptr[1]), .IN2(wr_ptr[0]), .IN3(n184), .Q(n183) );
  MUX21X1 U234 ( .IN1(\mem[6][0] ), .IN2(data_in[0]), .S(n185), .Q(n123) );
  MUX21X1 U235 ( .IN1(\mem[6][1] ), .IN2(data_in[1]), .S(n185), .Q(n122) );
  MUX21X1 U236 ( .IN1(\mem[6][2] ), .IN2(data_in[2]), .S(n185), .Q(n121) );
  MUX21X1 U237 ( .IN1(\mem[6][3] ), .IN2(data_in[3]), .S(n185), .Q(n120) );
  MUX21X1 U238 ( .IN1(\mem[6][4] ), .IN2(data_in[4]), .S(n185), .Q(n119) );
  MUX21X1 U239 ( .IN1(\mem[6][5] ), .IN2(data_in[5]), .S(n185), .Q(n118) );
  MUX21X1 U240 ( .IN1(\mem[6][6] ), .IN2(data_in[6]), .S(n185), .Q(n117) );
  MUX21X1 U241 ( .IN1(\mem[6][7] ), .IN2(data_in[7]), .S(n185), .Q(n116) );
  AND3X1 U242 ( .IN1(wr_ptr[1]), .IN2(n132), .IN3(n184), .Q(n185) );
  MUX21X1 U243 ( .IN1(\mem[5][0] ), .IN2(data_in[0]), .S(n186), .Q(n115) );
  MUX21X1 U244 ( .IN1(\mem[5][1] ), .IN2(data_in[1]), .S(n186), .Q(n114) );
  MUX21X1 U245 ( .IN1(\mem[5][2] ), .IN2(data_in[2]), .S(n186), .Q(n113) );
  MUX21X1 U246 ( .IN1(\mem[5][3] ), .IN2(data_in[3]), .S(n186), .Q(n112) );
  MUX21X1 U247 ( .IN1(\mem[5][4] ), .IN2(data_in[4]), .S(n186), .Q(n111) );
  MUX21X1 U248 ( .IN1(\mem[5][5] ), .IN2(data_in[5]), .S(n186), .Q(n110) );
  MUX21X1 U249 ( .IN1(\mem[5][6] ), .IN2(data_in[6]), .S(n186), .Q(n109) );
  MUX21X1 U250 ( .IN1(\mem[5][7] ), .IN2(data_in[7]), .S(n186), .Q(n108) );
  AND3X1 U251 ( .IN1(wr_ptr[0]), .IN2(n133), .IN3(n184), .Q(n186) );
  MUX21X1 U252 ( .IN1(\mem[4][0] ), .IN2(data_in[0]), .S(n187), .Q(n107) );
  MUX21X1 U253 ( .IN1(\mem[4][1] ), .IN2(data_in[1]), .S(n187), .Q(n106) );
  MUX21X1 U254 ( .IN1(\mem[4][2] ), .IN2(data_in[2]), .S(n187), .Q(n105) );
  MUX21X1 U255 ( .IN1(\mem[4][3] ), .IN2(data_in[3]), .S(n187), .Q(n104) );
  MUX21X1 U256 ( .IN1(\mem[4][4] ), .IN2(data_in[4]), .S(n187), .Q(n103) );
  MUX21X1 U257 ( .IN1(\mem[4][5] ), .IN2(data_in[5]), .S(n187), .Q(n102) );
  MUX21X1 U258 ( .IN1(\mem[4][6] ), .IN2(data_in[6]), .S(n187), .Q(n101) );
  MUX21X1 U259 ( .IN1(\mem[4][7] ), .IN2(data_in[7]), .S(n187), .Q(n100) );
  AND3X1 U260 ( .IN1(n132), .IN2(n133), .IN3(n184), .Q(n187) );
  AND3X1 U261 ( .IN1(wr), .IN2(reset_n), .IN3(wr_ptr[2]), .Q(n184) );
  AND4X1 U262 ( .IN1(n188), .IN2(n189), .IN3(n190), .IN4(n191), .Q(full) );
  INVX0 U263 ( .IN(empty), .QN(n188) );
  NAND2X0 U264 ( .IN1(reset_n), .IN2(n192), .QN(empty) );
  NAND4X0 U265 ( .IN1(n193), .IN2(n191), .IN3(n190), .IN4(n189), .QN(n192) );
  XOR2X1 U266 ( .IN1(n58), .IN2(wr_ptr[1]), .Q(n189) );
  XOR2X1 U267 ( .IN1(N16), .IN2(n132), .Q(n190) );
  XOR2X1 U268 ( .IN1(N18), .IN2(n134), .Q(n191) );
  XNOR2X1 U269 ( .IN1(\rd_ptr[3] ), .IN2(wr_ptr[3]), .Q(n193) );
  MUX21X1 U270 ( .IN1(\mem[0][7] ), .IN2(N53), .S(reset_n), .Q(data_out[7]) );
  MUX21X1 U271 ( .IN1(\mem[0][6] ), .IN2(N54), .S(reset_n), .Q(data_out[6]) );
  MUX21X1 U272 ( .IN1(\mem[0][5] ), .IN2(N55), .S(reset_n), .Q(data_out[5]) );
  MUX21X1 U273 ( .IN1(\mem[0][4] ), .IN2(N56), .S(reset_n), .Q(data_out[4]) );
  MUX21X1 U274 ( .IN1(\mem[0][3] ), .IN2(N57), .S(reset_n), .Q(data_out[3]) );
  MUX21X1 U275 ( .IN1(\mem[0][2] ), .IN2(N58), .S(reset_n), .Q(data_out[2]) );
  MUX21X1 U276 ( .IN1(\mem[0][1] ), .IN2(N59), .S(reset_n), .Q(data_out[1]) );
  MUX21X1 U277 ( .IN1(\mem[0][0] ), .IN2(N60), .S(reset_n), .Q(data_out[0]) );
endmodule

