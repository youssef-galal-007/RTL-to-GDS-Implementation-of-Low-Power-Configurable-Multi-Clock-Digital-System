/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Oct  3 03:23:07 2026
/////////////////////////////////////////////////////////////


module CLK_Gating_unit ( i_ref_clk, i_gate_en, o_gated_clk );
  input i_ref_clk, i_gate_en;
  output o_gated_clk;
  wire   latch;

  TLATNX2M latch_reg ( .D(i_gate_en), .GN(i_ref_clk), .Q(latch) );
  AND2X2M U2 ( .A(latch), .B(i_ref_clk), .Y(o_gated_clk) );
endmodule


module rst_sync_unit_Num_stg2_0 ( i_clk, i_rst_n_Async, o_rst_n_Sync );
  input i_clk, i_rst_n_Async;
  output o_rst_n_Sync;
  wire   \Sync_reg[0] ;

  DFFRQX2M \Sync_reg_reg[1]  ( .D(\Sync_reg[0] ), .CK(i_clk), .RN(
        i_rst_n_Async), .Q(o_rst_n_Sync) );
  DFFRQX2M \Sync_reg_reg[0]  ( .D(1'b1), .CK(i_clk), .RN(i_rst_n_Async), .Q(
        \Sync_reg[0] ) );
endmodule


module Reg_File_R_Width8_R_Depth16_R_Adderss_Bits4 ( i_clk_reg, i_rst_n_reg, 
        i_RdEn_reg, i_WrEn_reg, i_WrData_reg, i_Address_reg, o_REG0_reg, 
        o_REG1_reg, o_REG2_reg, o_REG3_reg, o_Valid_reg, o_RdData_reg );
  input [7:0] i_WrData_reg;
  input [3:0] i_Address_reg;
  output [7:0] o_REG0_reg;
  output [7:0] o_REG1_reg;
  output [7:0] o_REG2_reg;
  output [7:0] o_REG3_reg;
  output [7:0] o_RdData_reg;
  input i_clk_reg, i_rst_n_reg, i_RdEn_reg, i_WrEn_reg;
  output o_Valid_reg;
  wire   N9, N10, N11, N12, \Reg_F[15][7] , \Reg_F[15][6] , \Reg_F[15][5] ,
         \Reg_F[15][4] , \Reg_F[15][3] , \Reg_F[15][2] , \Reg_F[15][1] ,
         \Reg_F[15][0] , \Reg_F[14][7] , \Reg_F[14][6] , \Reg_F[14][5] ,
         \Reg_F[14][4] , \Reg_F[14][3] , \Reg_F[14][2] , \Reg_F[14][1] ,
         \Reg_F[14][0] , \Reg_F[13][7] , \Reg_F[13][6] , \Reg_F[13][5] ,
         \Reg_F[13][4] , \Reg_F[13][3] , \Reg_F[13][2] , \Reg_F[13][1] ,
         \Reg_F[13][0] , \Reg_F[12][7] , \Reg_F[12][6] , \Reg_F[12][5] ,
         \Reg_F[12][4] , \Reg_F[12][3] , \Reg_F[12][2] , \Reg_F[12][1] ,
         \Reg_F[12][0] , \Reg_F[11][7] , \Reg_F[11][6] , \Reg_F[11][5] ,
         \Reg_F[11][4] , \Reg_F[11][3] , \Reg_F[11][2] , \Reg_F[11][1] ,
         \Reg_F[11][0] , \Reg_F[10][7] , \Reg_F[10][6] , \Reg_F[10][5] ,
         \Reg_F[10][4] , \Reg_F[10][3] , \Reg_F[10][2] , \Reg_F[10][1] ,
         \Reg_F[10][0] , \Reg_F[9][7] , \Reg_F[9][6] , \Reg_F[9][5] ,
         \Reg_F[9][4] , \Reg_F[9][3] , \Reg_F[9][2] , \Reg_F[9][1] ,
         \Reg_F[9][0] , \Reg_F[8][7] , \Reg_F[8][6] , \Reg_F[8][5] ,
         \Reg_F[8][4] , \Reg_F[8][3] , \Reg_F[8][2] , \Reg_F[8][1] ,
         \Reg_F[8][0] , \Reg_F[7][7] , \Reg_F[7][6] , \Reg_F[7][5] ,
         \Reg_F[7][4] , \Reg_F[7][3] , \Reg_F[7][2] , \Reg_F[7][1] ,
         \Reg_F[7][0] , \Reg_F[6][7] , \Reg_F[6][6] , \Reg_F[6][5] ,
         \Reg_F[6][4] , \Reg_F[6][3] , \Reg_F[6][2] , \Reg_F[6][1] ,
         \Reg_F[6][0] , \Reg_F[5][7] , \Reg_F[5][6] , \Reg_F[5][5] ,
         \Reg_F[5][4] , \Reg_F[5][3] , \Reg_F[5][2] , \Reg_F[5][1] ,
         \Reg_F[5][0] , \Reg_F[4][7] , \Reg_F[4][6] , \Reg_F[4][5] ,
         \Reg_F[4][4] , \Reg_F[4][3] , \Reg_F[4][2] , \Reg_F[4][1] ,
         \Reg_F[4][0] , N48, N49, N50, N51, N52, N53, N54, N55, N56, n2, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n26,
         n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n1, n3, n4, n5, n6,
         n7, n8, n9, n10, n25, n32, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305;
  assign N9 = i_Address_reg[0];
  assign N10 = i_Address_reg[1];
  assign N11 = i_Address_reg[2];
  assign N12 = i_Address_reg[3];

  DFFSQX2M \Reg_F_reg[3][5]  ( .D(n74), .CK(i_clk_reg), .SN(n274), .Q(
        o_REG3_reg[5]) );
  DFFRQX2M \Reg_F_reg[15][7]  ( .D(n172), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][7] ) );
  DFFRQX2M \Reg_F_reg[15][6]  ( .D(n171), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][6] ) );
  DFFRQX2M \Reg_F_reg[15][5]  ( .D(n170), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][5] ) );
  DFFRQX2M \Reg_F_reg[15][4]  ( .D(n169), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][4] ) );
  DFFRQX2M \Reg_F_reg[15][3]  ( .D(n168), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][3] ) );
  DFFRQX2M \Reg_F_reg[15][2]  ( .D(n167), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][2] ) );
  DFFRQX2M \Reg_F_reg[15][1]  ( .D(n166), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][1] ) );
  DFFRQX2M \Reg_F_reg[15][0]  ( .D(n165), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[15][0] ) );
  DFFRQX2M \Reg_F_reg[13][7]  ( .D(n156), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][7] ) );
  DFFRQX2M \Reg_F_reg[13][6]  ( .D(n155), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][6] ) );
  DFFRQX2M \Reg_F_reg[13][5]  ( .D(n154), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][5] ) );
  DFFRQX2M \Reg_F_reg[13][4]  ( .D(n153), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][4] ) );
  DFFRQX2M \Reg_F_reg[13][3]  ( .D(n152), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][3] ) );
  DFFRQX2M \Reg_F_reg[13][2]  ( .D(n151), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][2] ) );
  DFFRQX2M \Reg_F_reg[13][1]  ( .D(n150), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][1] ) );
  DFFRQX2M \Reg_F_reg[13][0]  ( .D(n149), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[13][0] ) );
  DFFRQX2M \Reg_F_reg[11][7]  ( .D(n140), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][7] ) );
  DFFRQX2M \Reg_F_reg[11][6]  ( .D(n139), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][6] ) );
  DFFRQX2M \Reg_F_reg[11][5]  ( .D(n138), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][5] ) );
  DFFRQX2M \Reg_F_reg[11][4]  ( .D(n137), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][4] ) );
  DFFRQX2M \Reg_F_reg[11][3]  ( .D(n136), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][3] ) );
  DFFRQX2M \Reg_F_reg[11][2]  ( .D(n135), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][2] ) );
  DFFRQX2M \Reg_F_reg[11][1]  ( .D(n134), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[11][1] ) );
  DFFRQX2M \Reg_F_reg[11][0]  ( .D(n133), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[11][0] ) );
  DFFRQX2M \Reg_F_reg[9][7]  ( .D(n124), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[9][7] ) );
  DFFRQX2M \Reg_F_reg[9][6]  ( .D(n123), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[9][6] ) );
  DFFRQX2M \Reg_F_reg[9][5]  ( .D(n122), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[9][5] ) );
  DFFRQX2M \Reg_F_reg[9][4]  ( .D(n121), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[9][4] ) );
  DFFRQX2M \Reg_F_reg[9][3]  ( .D(n120), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[9][3] ) );
  DFFRQX2M \Reg_F_reg[9][2]  ( .D(n119), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[9][2] ) );
  DFFRQX2M \Reg_F_reg[9][1]  ( .D(n118), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[9][1] ) );
  DFFRQX2M \Reg_F_reg[9][0]  ( .D(n117), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[9][0] ) );
  DFFRQX2M \Reg_F_reg[7][7]  ( .D(n108), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[7][7] ) );
  DFFRQX2M \Reg_F_reg[7][6]  ( .D(n107), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[7][6] ) );
  DFFRQX2M \Reg_F_reg[7][5]  ( .D(n106), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[7][5] ) );
  DFFRQX2M \Reg_F_reg[7][4]  ( .D(n105), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[7][4] ) );
  DFFRQX2M \Reg_F_reg[7][3]  ( .D(n104), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[7][3] ) );
  DFFRQX2M \Reg_F_reg[7][2]  ( .D(n103), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[7][2] ) );
  DFFRQX2M \Reg_F_reg[7][1]  ( .D(n102), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[7][1] ) );
  DFFRQX2M \Reg_F_reg[7][0]  ( .D(n101), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[7][0] ) );
  DFFRQX2M \Reg_F_reg[5][7]  ( .D(n92), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[5][7] ) );
  DFFRQX2M \Reg_F_reg[5][6]  ( .D(n91), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[5][6] ) );
  DFFRQX2M \Reg_F_reg[5][5]  ( .D(n90), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[5][5] ) );
  DFFRQX2M \Reg_F_reg[5][4]  ( .D(n89), .CK(i_clk_reg), .RN(n281), .Q(
        \Reg_F[5][4] ) );
  DFFRQX2M \Reg_F_reg[5][3]  ( .D(n88), .CK(i_clk_reg), .RN(n281), .Q(
        \Reg_F[5][3] ) );
  DFFRQX2M \Reg_F_reg[5][2]  ( .D(n87), .CK(i_clk_reg), .RN(n281), .Q(
        \Reg_F[5][2] ) );
  DFFRQX2M \Reg_F_reg[5][1]  ( .D(n86), .CK(i_clk_reg), .RN(n281), .Q(
        \Reg_F[5][1] ) );
  DFFRQX2M \Reg_F_reg[5][0]  ( .D(n85), .CK(i_clk_reg), .RN(n281), .Q(
        \Reg_F[5][0] ) );
  DFFRQX2M \Reg_F_reg[14][7]  ( .D(n164), .CK(i_clk_reg), .RN(n274), .Q(
        \Reg_F[14][7] ) );
  DFFRQX2M \Reg_F_reg[14][6]  ( .D(n163), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[14][6] ) );
  DFFRQX2M \Reg_F_reg[14][5]  ( .D(n162), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[14][5] ) );
  DFFRQX2M \Reg_F_reg[14][4]  ( .D(n161), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[14][4] ) );
  DFFRQX2M \Reg_F_reg[14][3]  ( .D(n160), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[14][3] ) );
  DFFRQX2M \Reg_F_reg[14][2]  ( .D(n159), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[14][2] ) );
  DFFRQX2M \Reg_F_reg[14][1]  ( .D(n158), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[14][1] ) );
  DFFRQX2M \Reg_F_reg[14][0]  ( .D(n157), .CK(i_clk_reg), .RN(n275), .Q(
        \Reg_F[14][0] ) );
  DFFRQX2M \Reg_F_reg[12][7]  ( .D(n148), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[12][7] ) );
  DFFRQX2M \Reg_F_reg[12][6]  ( .D(n147), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[12][6] ) );
  DFFRQX2M \Reg_F_reg[12][5]  ( .D(n146), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[12][5] ) );
  DFFRQX2M \Reg_F_reg[12][4]  ( .D(n145), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[12][4] ) );
  DFFRQX2M \Reg_F_reg[12][3]  ( .D(n144), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[12][3] ) );
  DFFRQX2M \Reg_F_reg[12][2]  ( .D(n143), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[12][2] ) );
  DFFRQX2M \Reg_F_reg[12][1]  ( .D(n142), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[12][1] ) );
  DFFRQX2M \Reg_F_reg[12][0]  ( .D(n141), .CK(i_clk_reg), .RN(n276), .Q(
        \Reg_F[12][0] ) );
  DFFRQX2M \Reg_F_reg[10][7]  ( .D(n132), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[10][7] ) );
  DFFRQX2M \Reg_F_reg[10][6]  ( .D(n131), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[10][6] ) );
  DFFRQX2M \Reg_F_reg[10][5]  ( .D(n130), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[10][5] ) );
  DFFRQX2M \Reg_F_reg[10][4]  ( .D(n129), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[10][4] ) );
  DFFRQX2M \Reg_F_reg[10][3]  ( .D(n128), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[10][3] ) );
  DFFRQX2M \Reg_F_reg[10][2]  ( .D(n127), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[10][2] ) );
  DFFRQX2M \Reg_F_reg[10][1]  ( .D(n126), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[10][1] ) );
  DFFRQX2M \Reg_F_reg[10][0]  ( .D(n125), .CK(i_clk_reg), .RN(n277), .Q(
        \Reg_F[10][0] ) );
  DFFRQX2M \Reg_F_reg[8][7]  ( .D(n116), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[8][7] ) );
  DFFRQX2M \Reg_F_reg[8][6]  ( .D(n115), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[8][6] ) );
  DFFRQX2M \Reg_F_reg[8][5]  ( .D(n114), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[8][5] ) );
  DFFRQX2M \Reg_F_reg[8][4]  ( .D(n113), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[8][4] ) );
  DFFRQX2M \Reg_F_reg[8][3]  ( .D(n112), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[8][3] ) );
  DFFRQX2M \Reg_F_reg[8][2]  ( .D(n111), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[8][2] ) );
  DFFRQX2M \Reg_F_reg[8][1]  ( .D(n110), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[8][1] ) );
  DFFRQX2M \Reg_F_reg[8][0]  ( .D(n109), .CK(i_clk_reg), .RN(n278), .Q(
        \Reg_F[8][0] ) );
  DFFRQX2M \Reg_F_reg[6][7]  ( .D(n100), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[6][7] ) );
  DFFRQX2M \Reg_F_reg[6][6]  ( .D(n99), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[6][6] ) );
  DFFRQX2M \Reg_F_reg[6][5]  ( .D(n98), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[6][5] ) );
  DFFRQX2M \Reg_F_reg[6][4]  ( .D(n97), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[6][4] ) );
  DFFRQX2M \Reg_F_reg[6][3]  ( .D(n96), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[6][3] ) );
  DFFRQX2M \Reg_F_reg[6][2]  ( .D(n95), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[6][2] ) );
  DFFRQX2M \Reg_F_reg[6][1]  ( .D(n94), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[6][1] ) );
  DFFRQX2M \Reg_F_reg[6][0]  ( .D(n93), .CK(i_clk_reg), .RN(n279), .Q(
        \Reg_F[6][0] ) );
  DFFRQX2M \Reg_F_reg[4][7]  ( .D(n84), .CK(i_clk_reg), .RN(n281), .Q(
        \Reg_F[4][7] ) );
  DFFRQX2M \Reg_F_reg[4][6]  ( .D(n83), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][6] ) );
  DFFRQX2M \Reg_F_reg[4][5]  ( .D(n82), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][5] ) );
  DFFRQX2M \Reg_F_reg[4][4]  ( .D(n81), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][4] ) );
  DFFRQX2M \Reg_F_reg[4][3]  ( .D(n80), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][3] ) );
  DFFRQX2M \Reg_F_reg[4][2]  ( .D(n79), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][2] ) );
  DFFRQX2M \Reg_F_reg[4][1]  ( .D(n78), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][1] ) );
  DFFRQX2M \Reg_F_reg[4][0]  ( .D(n77), .CK(i_clk_reg), .RN(n280), .Q(
        \Reg_F[4][0] ) );
  DFFRQX2M \o_RdData_reg_reg[7]  ( .D(n44), .CK(i_clk_reg), .RN(n282), .Q(
        o_RdData_reg[7]) );
  DFFRQX2M \o_RdData_reg_reg[6]  ( .D(n43), .CK(i_clk_reg), .RN(n274), .Q(
        o_RdData_reg[6]) );
  DFFRQX2M \o_RdData_reg_reg[5]  ( .D(n42), .CK(i_clk_reg), .RN(n278), .Q(
        o_RdData_reg[5]) );
  DFFRQX2M \o_RdData_reg_reg[4]  ( .D(n41), .CK(i_clk_reg), .RN(n275), .Q(
        o_RdData_reg[4]) );
  DFFRQX2M \o_RdData_reg_reg[3]  ( .D(n40), .CK(i_clk_reg), .RN(n275), .Q(
        o_RdData_reg[3]) );
  DFFRQX2M \o_RdData_reg_reg[2]  ( .D(n39), .CK(i_clk_reg), .RN(n275), .Q(
        o_RdData_reg[2]) );
  DFFRQX2M \o_RdData_reg_reg[1]  ( .D(n38), .CK(i_clk_reg), .RN(n275), .Q(
        o_RdData_reg[1]) );
  DFFRQX2M \o_RdData_reg_reg[0]  ( .D(n37), .CK(i_clk_reg), .RN(n275), .Q(
        o_RdData_reg[0]) );
  DFFRQX2M \Reg_F_reg[3][0]  ( .D(n69), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG3_reg[0]) );
  DFFRQX2M \Reg_F_reg[3][2]  ( .D(n71), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG3_reg[2]) );
  DFFRQX2M \Reg_F_reg[3][4]  ( .D(n73), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG3_reg[4]) );
  DFFRQX2M \Reg_F_reg[3][3]  ( .D(n72), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG3_reg[3]) );
  DFFRQX2M \Reg_F_reg[3][7]  ( .D(n76), .CK(i_clk_reg), .RN(n280), .Q(
        o_REG3_reg[7]) );
  DFFRQX2M \Reg_F_reg[3][6]  ( .D(n75), .CK(i_clk_reg), .RN(n280), .Q(
        o_REG3_reg[6]) );
  DFFRQX2M \Reg_F_reg[2][1]  ( .D(n62), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG2_reg[1]) );
  DFFRQX2M \Reg_F_reg[3][1]  ( .D(n70), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG3_reg[1]) );
  DFFSQX2M \Reg_F_reg[2][0]  ( .D(n61), .CK(i_clk_reg), .SN(n274), .Q(
        o_REG2_reg[0]) );
  DFFRQX2M \Reg_F_reg[2][5]  ( .D(n66), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG2_reg[5]) );
  DFFRQX2M \Reg_F_reg[2][6]  ( .D(n67), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG2_reg[6]) );
  DFFSQX2M \Reg_F_reg[2][7]  ( .D(n68), .CK(i_clk_reg), .SN(n274), .Q(
        o_REG2_reg[7]) );
  DFFRQX2M o_Valid_reg_reg ( .D(N48), .CK(i_clk_reg), .RN(n274), .Q(
        o_Valid_reg) );
  DFFRQX2M \Reg_F_reg[0][1]  ( .D(n46), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG0_reg[1]) );
  DFFRQX2M \Reg_F_reg[0][0]  ( .D(n45), .CK(i_clk_reg), .RN(n278), .Q(
        o_REG0_reg[0]) );
  DFFRQX2M \Reg_F_reg[0][2]  ( .D(n47), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG0_reg[2]) );
  DFFRQX2M \Reg_F_reg[0][3]  ( .D(n48), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG0_reg[3]) );
  DFFRQX2M \Reg_F_reg[0][4]  ( .D(n49), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG0_reg[4]) );
  DFFRQX2M \Reg_F_reg[0][5]  ( .D(n50), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG0_reg[5]) );
  DFFRQX2M \Reg_F_reg[0][7]  ( .D(n52), .CK(i_clk_reg), .RN(n283), .Q(
        o_REG0_reg[7]) );
  DFFRQX2M \Reg_F_reg[0][6]  ( .D(n51), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG0_reg[6]) );
  DFFRQX2M \Reg_F_reg[1][7]  ( .D(n60), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG1_reg[7]) );
  DFFRQX2M \Reg_F_reg[1][6]  ( .D(n59), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG1_reg[6]) );
  DFFRQX2M \Reg_F_reg[1][1]  ( .D(n54), .CK(i_clk_reg), .RN(n274), .Q(
        o_REG1_reg[1]) );
  DFFRQX2M \Reg_F_reg[1][4]  ( .D(n57), .CK(i_clk_reg), .RN(n283), .Q(
        o_REG1_reg[4]) );
  DFFRQX2M \Reg_F_reg[1][5]  ( .D(n58), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG1_reg[5]) );
  DFFRQX2M \Reg_F_reg[2][3]  ( .D(n64), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG2_reg[3]) );
  DFFRQX2M \Reg_F_reg[2][4]  ( .D(n65), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG2_reg[4]) );
  DFFRQX2M \Reg_F_reg[2][2]  ( .D(n63), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG2_reg[2]) );
  DFFRQX2M \Reg_F_reg[1][2]  ( .D(n55), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG1_reg[2]) );
  DFFRQX2M \Reg_F_reg[1][3]  ( .D(n56), .CK(i_clk_reg), .RN(n281), .Q(
        o_REG1_reg[3]) );
  DFFRQX2M \Reg_F_reg[1][0]  ( .D(n53), .CK(i_clk_reg), .RN(n282), .Q(
        o_REG1_reg[0]) );
  NOR3BX2M U3 ( .AN(n23), .B(N12), .C(N9), .Y(n11) );
  NOR3BX2M U4 ( .AN(n23), .B(N12), .C(n269), .Y(n14) );
  NOR2X2M U5 ( .A(n266), .B(N11), .Y(n16) );
  NOR2X2M U6 ( .A(N11), .B(N10), .Y(n12) );
  INVX2M U7 ( .A(i_WrData_reg[5]), .Y(n300) );
  INVX2M U8 ( .A(n1), .Y(n270) );
  INVX2M U9 ( .A(N48), .Y(n305) );
  BUFX2M U10 ( .A(n13), .Y(n295) );
  NAND2X2M U11 ( .A(n14), .B(n12), .Y(n13) );
  OR2X2M U12 ( .A(n266), .B(n269), .Y(n1) );
  NOR2BX2M U13 ( .AN(i_WrEn_reg), .B(i_RdEn_reg), .Y(n23) );
  BUFX2M U14 ( .A(n15), .Y(n294) );
  NAND2X2M U15 ( .A(n16), .B(n11), .Y(n15) );
  BUFX2M U16 ( .A(n18), .Y(n292) );
  NAND2X2M U17 ( .A(n19), .B(n11), .Y(n18) );
  BUFX2M U18 ( .A(n21), .Y(n290) );
  NAND2X2M U19 ( .A(n22), .B(n11), .Y(n21) );
  BUFX2M U20 ( .A(n17), .Y(n293) );
  NAND2X2M U21 ( .A(n16), .B(n14), .Y(n17) );
  BUFX2M U22 ( .A(n20), .Y(n291) );
  NAND2X2M U23 ( .A(n19), .B(n14), .Y(n20) );
  BUFX2M U24 ( .A(n24), .Y(n289) );
  NAND2X2M U25 ( .A(n22), .B(n14), .Y(n24) );
  BUFX2M U26 ( .A(n2), .Y(n296) );
  NAND2X2M U27 ( .A(n11), .B(n12), .Y(n2) );
  INVX2M U28 ( .A(n4), .Y(n273) );
  INVX2M U29 ( .A(n5), .Y(n271) );
  INVX2M U30 ( .A(n3), .Y(n272) );
  NOR2BX2M U31 ( .AN(i_RdEn_reg), .B(i_WrEn_reg), .Y(N48) );
  NAND2X2M U32 ( .A(n27), .B(n19), .Y(n33) );
  NAND2X2M U33 ( .A(n29), .B(n19), .Y(n34) );
  NAND2X2M U34 ( .A(n27), .B(n22), .Y(n35) );
  NAND2X2M U35 ( .A(n29), .B(n22), .Y(n36) );
  NAND2X2M U36 ( .A(n27), .B(n12), .Y(n26) );
  NAND2X2M U37 ( .A(n29), .B(n12), .Y(n28) );
  NAND2X2M U38 ( .A(n27), .B(n16), .Y(n30) );
  NAND2X2M U39 ( .A(n29), .B(n16), .Y(n31) );
  BUFX2M U40 ( .A(n288), .Y(n274) );
  BUFX2M U41 ( .A(n285), .Y(n281) );
  BUFX2M U42 ( .A(n285), .Y(n280) );
  BUFX2M U43 ( .A(n286), .Y(n279) );
  BUFX2M U44 ( .A(n287), .Y(n277) );
  BUFX2M U45 ( .A(n287), .Y(n276) );
  BUFX2M U46 ( .A(n288), .Y(n275) );
  BUFX2M U47 ( .A(n286), .Y(n278) );
  BUFX2M U48 ( .A(n284), .Y(n282) );
  BUFX2M U49 ( .A(n284), .Y(n283) );
  OR2X2M U50 ( .A(n269), .B(N10), .Y(n3) );
  OR2X2M U51 ( .A(N9), .B(N10), .Y(n4) );
  OR2X2M U52 ( .A(n266), .B(N9), .Y(n5) );
  INVX2M U53 ( .A(N9), .Y(n269) );
  INVX2M U54 ( .A(N10), .Y(n266) );
  AND3X2M U55 ( .A(N9), .B(n23), .C(N12), .Y(n29) );
  AND3X2M U56 ( .A(n23), .B(n269), .C(N12), .Y(n27) );
  INVX2M U57 ( .A(i_WrData_reg[0]), .Y(n297) );
  INVX2M U58 ( .A(i_WrData_reg[1]), .Y(n304) );
  INVX2M U59 ( .A(i_WrData_reg[2]), .Y(n303) );
  INVX2M U60 ( .A(i_WrData_reg[3]), .Y(n302) );
  INVX2M U61 ( .A(i_WrData_reg[4]), .Y(n301) );
  INVX2M U62 ( .A(i_WrData_reg[6]), .Y(n299) );
  INVX2M U63 ( .A(i_WrData_reg[7]), .Y(n298) );
  AND2X2M U64 ( .A(N11), .B(n266), .Y(n19) );
  AND2X2M U65 ( .A(N11), .B(N10), .Y(n22) );
  INVX2M U66 ( .A(N11), .Y(n267) );
  INVX2M U67 ( .A(N12), .Y(n268) );
  BUFX2M U68 ( .A(i_rst_n_reg), .Y(n285) );
  BUFX2M U69 ( .A(i_rst_n_reg), .Y(n287) );
  BUFX2M U70 ( .A(i_rst_n_reg), .Y(n286) );
  BUFX2M U71 ( .A(i_rst_n_reg), .Y(n288) );
  BUFX2M U72 ( .A(i_rst_n_reg), .Y(n284) );
  OAI2BB2X1M U73 ( .B0(n297), .B1(n295), .A0N(o_REG1_reg[0]), .A1N(n295), .Y(
        n53) );
  OAI2BB2X1M U74 ( .B0(n304), .B1(n295), .A0N(o_REG1_reg[1]), .A1N(n295), .Y(
        n54) );
  OAI2BB2X1M U75 ( .B0(n303), .B1(n295), .A0N(o_REG1_reg[2]), .A1N(n295), .Y(
        n55) );
  OAI2BB2X1M U76 ( .B0(n302), .B1(n295), .A0N(o_REG1_reg[3]), .A1N(n295), .Y(
        n56) );
  OAI2BB2X1M U77 ( .B0(n301), .B1(n295), .A0N(o_REG1_reg[4]), .A1N(n295), .Y(
        n57) );
  OAI2BB2X1M U78 ( .B0(n300), .B1(n295), .A0N(o_REG1_reg[5]), .A1N(n295), .Y(
        n58) );
  OAI2BB2X1M U79 ( .B0(n299), .B1(n295), .A0N(o_REG1_reg[6]), .A1N(n295), .Y(
        n59) );
  OAI2BB2X1M U80 ( .B0(n298), .B1(n295), .A0N(o_REG1_reg[7]), .A1N(n295), .Y(
        n60) );
  OAI2BB2X1M U81 ( .B0(n304), .B1(n294), .A0N(o_REG2_reg[1]), .A1N(n294), .Y(
        n62) );
  OAI2BB2X1M U82 ( .B0(n303), .B1(n294), .A0N(o_REG2_reg[2]), .A1N(n294), .Y(
        n63) );
  OAI2BB2X1M U83 ( .B0(n302), .B1(n294), .A0N(o_REG2_reg[3]), .A1N(n294), .Y(
        n64) );
  OAI2BB2X1M U84 ( .B0(n301), .B1(n294), .A0N(o_REG2_reg[4]), .A1N(n294), .Y(
        n65) );
  OAI2BB2X1M U85 ( .B0(n300), .B1(n294), .A0N(o_REG2_reg[5]), .A1N(n294), .Y(
        n66) );
  OAI2BB2X1M U86 ( .B0(n299), .B1(n294), .A0N(o_REG2_reg[6]), .A1N(n294), .Y(
        n67) );
  OAI2BB2X1M U87 ( .B0(n297), .B1(n293), .A0N(o_REG3_reg[0]), .A1N(n293), .Y(
        n69) );
  OAI2BB2X1M U88 ( .B0(n304), .B1(n293), .A0N(o_REG3_reg[1]), .A1N(n293), .Y(
        n70) );
  OAI2BB2X1M U89 ( .B0(n303), .B1(n293), .A0N(o_REG3_reg[2]), .A1N(n293), .Y(
        n71) );
  OAI2BB2X1M U90 ( .B0(n302), .B1(n293), .A0N(o_REG3_reg[3]), .A1N(n293), .Y(
        n72) );
  OAI2BB2X1M U91 ( .B0(n301), .B1(n293), .A0N(o_REG3_reg[4]), .A1N(n293), .Y(
        n73) );
  OAI2BB2X1M U92 ( .B0(n299), .B1(n293), .A0N(o_REG3_reg[6]), .A1N(n293), .Y(
        n75) );
  OAI2BB2X1M U93 ( .B0(n298), .B1(n293), .A0N(o_REG3_reg[7]), .A1N(n293), .Y(
        n76) );
  OAI2BB2X1M U94 ( .B0(n297), .B1(n292), .A0N(\Reg_F[4][0] ), .A1N(n292), .Y(
        n77) );
  OAI2BB2X1M U95 ( .B0(n304), .B1(n292), .A0N(\Reg_F[4][1] ), .A1N(n292), .Y(
        n78) );
  OAI2BB2X1M U96 ( .B0(n303), .B1(n292), .A0N(\Reg_F[4][2] ), .A1N(n292), .Y(
        n79) );
  OAI2BB2X1M U97 ( .B0(n302), .B1(n292), .A0N(\Reg_F[4][3] ), .A1N(n292), .Y(
        n80) );
  OAI2BB2X1M U98 ( .B0(n301), .B1(n292), .A0N(\Reg_F[4][4] ), .A1N(n292), .Y(
        n81) );
  OAI2BB2X1M U99 ( .B0(n300), .B1(n292), .A0N(\Reg_F[4][5] ), .A1N(n292), .Y(
        n82) );
  OAI2BB2X1M U100 ( .B0(n299), .B1(n292), .A0N(\Reg_F[4][6] ), .A1N(n292), .Y(
        n83) );
  OAI2BB2X1M U101 ( .B0(n298), .B1(n292), .A0N(\Reg_F[4][7] ), .A1N(n292), .Y(
        n84) );
  OAI2BB2X1M U102 ( .B0(n297), .B1(n291), .A0N(\Reg_F[5][0] ), .A1N(n291), .Y(
        n85) );
  OAI2BB2X1M U103 ( .B0(n304), .B1(n291), .A0N(\Reg_F[5][1] ), .A1N(n291), .Y(
        n86) );
  OAI2BB2X1M U104 ( .B0(n303), .B1(n291), .A0N(\Reg_F[5][2] ), .A1N(n291), .Y(
        n87) );
  OAI2BB2X1M U105 ( .B0(n302), .B1(n291), .A0N(\Reg_F[5][3] ), .A1N(n291), .Y(
        n88) );
  OAI2BB2X1M U106 ( .B0(n301), .B1(n291), .A0N(\Reg_F[5][4] ), .A1N(n291), .Y(
        n89) );
  OAI2BB2X1M U107 ( .B0(n300), .B1(n291), .A0N(\Reg_F[5][5] ), .A1N(n291), .Y(
        n90) );
  OAI2BB2X1M U108 ( .B0(n299), .B1(n291), .A0N(\Reg_F[5][6] ), .A1N(n291), .Y(
        n91) );
  OAI2BB2X1M U109 ( .B0(n298), .B1(n291), .A0N(\Reg_F[5][7] ), .A1N(n291), .Y(
        n92) );
  OAI2BB2X1M U110 ( .B0(n297), .B1(n290), .A0N(\Reg_F[6][0] ), .A1N(n290), .Y(
        n93) );
  OAI2BB2X1M U111 ( .B0(n304), .B1(n290), .A0N(\Reg_F[6][1] ), .A1N(n290), .Y(
        n94) );
  OAI2BB2X1M U112 ( .B0(n303), .B1(n290), .A0N(\Reg_F[6][2] ), .A1N(n290), .Y(
        n95) );
  OAI2BB2X1M U113 ( .B0(n302), .B1(n290), .A0N(\Reg_F[6][3] ), .A1N(n290), .Y(
        n96) );
  OAI2BB2X1M U114 ( .B0(n301), .B1(n290), .A0N(\Reg_F[6][4] ), .A1N(n290), .Y(
        n97) );
  OAI2BB2X1M U115 ( .B0(n300), .B1(n290), .A0N(\Reg_F[6][5] ), .A1N(n290), .Y(
        n98) );
  OAI2BB2X1M U116 ( .B0(n299), .B1(n290), .A0N(\Reg_F[6][6] ), .A1N(n290), .Y(
        n99) );
  OAI2BB2X1M U117 ( .B0(n298), .B1(n290), .A0N(\Reg_F[6][7] ), .A1N(n290), .Y(
        n100) );
  OAI2BB2X1M U118 ( .B0(n297), .B1(n289), .A0N(\Reg_F[7][0] ), .A1N(n289), .Y(
        n101) );
  OAI2BB2X1M U119 ( .B0(n304), .B1(n289), .A0N(\Reg_F[7][1] ), .A1N(n289), .Y(
        n102) );
  OAI2BB2X1M U120 ( .B0(n303), .B1(n289), .A0N(\Reg_F[7][2] ), .A1N(n289), .Y(
        n103) );
  OAI2BB2X1M U121 ( .B0(n302), .B1(n289), .A0N(\Reg_F[7][3] ), .A1N(n289), .Y(
        n104) );
  OAI2BB2X1M U122 ( .B0(n301), .B1(n289), .A0N(\Reg_F[7][4] ), .A1N(n289), .Y(
        n105) );
  OAI2BB2X1M U123 ( .B0(n300), .B1(n289), .A0N(\Reg_F[7][5] ), .A1N(n289), .Y(
        n106) );
  OAI2BB2X1M U124 ( .B0(n299), .B1(n289), .A0N(\Reg_F[7][6] ), .A1N(n289), .Y(
        n107) );
  OAI2BB2X1M U125 ( .B0(n298), .B1(n289), .A0N(\Reg_F[7][7] ), .A1N(n289), .Y(
        n108) );
  OAI2BB2X1M U126 ( .B0(n296), .B1(n297), .A0N(o_REG0_reg[0]), .A1N(n296), .Y(
        n45) );
  OAI2BB2X1M U127 ( .B0(n296), .B1(n304), .A0N(o_REG0_reg[1]), .A1N(n296), .Y(
        n46) );
  OAI2BB2X1M U128 ( .B0(n296), .B1(n303), .A0N(o_REG0_reg[2]), .A1N(n296), .Y(
        n47) );
  OAI2BB2X1M U129 ( .B0(n296), .B1(n302), .A0N(o_REG0_reg[3]), .A1N(n296), .Y(
        n48) );
  OAI2BB2X1M U130 ( .B0(n296), .B1(n301), .A0N(o_REG0_reg[4]), .A1N(n296), .Y(
        n49) );
  OAI2BB2X1M U131 ( .B0(n296), .B1(n300), .A0N(o_REG0_reg[5]), .A1N(n296), .Y(
        n50) );
  OAI2BB2X1M U132 ( .B0(n296), .B1(n299), .A0N(o_REG0_reg[6]), .A1N(n296), .Y(
        n51) );
  OAI2BB2X1M U133 ( .B0(n296), .B1(n298), .A0N(o_REG0_reg[7]), .A1N(n296), .Y(
        n52) );
  OAI2BB2X1M U134 ( .B0(n297), .B1(n294), .A0N(o_REG2_reg[0]), .A1N(n294), .Y(
        n61) );
  OAI2BB2X1M U135 ( .B0(n298), .B1(n294), .A0N(o_REG2_reg[7]), .A1N(n294), .Y(
        n68) );
  OAI2BB2X1M U136 ( .B0(n300), .B1(n293), .A0N(o_REG3_reg[5]), .A1N(n293), .Y(
        n74) );
  AO22X1M U137 ( .A0(N56), .A1(N48), .B0(o_RdData_reg[0]), .B1(n305), .Y(n37)
         );
  AO22X1M U138 ( .A0(N55), .A1(N48), .B0(o_RdData_reg[1]), .B1(n305), .Y(n38)
         );
  AO22X1M U139 ( .A0(N54), .A1(N48), .B0(o_RdData_reg[2]), .B1(n305), .Y(n39)
         );
  AO22X1M U140 ( .A0(N53), .A1(N48), .B0(o_RdData_reg[3]), .B1(n305), .Y(n40)
         );
  AO22X1M U141 ( .A0(N52), .A1(N48), .B0(o_RdData_reg[4]), .B1(n305), .Y(n41)
         );
  AO22X1M U142 ( .A0(N51), .A1(N48), .B0(o_RdData_reg[5]), .B1(n305), .Y(n42)
         );
  AO22X1M U143 ( .A0(N50), .A1(N48), .B0(o_RdData_reg[6]), .B1(n305), .Y(n43)
         );
  AO22X1M U144 ( .A0(N49), .A1(N48), .B0(o_RdData_reg[7]), .B1(n305), .Y(n44)
         );
  OAI2BB2X1M U145 ( .B0(n297), .B1(n26), .A0N(\Reg_F[8][0] ), .A1N(n26), .Y(
        n109) );
  OAI2BB2X1M U146 ( .B0(n304), .B1(n26), .A0N(\Reg_F[8][1] ), .A1N(n26), .Y(
        n110) );
  OAI2BB2X1M U147 ( .B0(n303), .B1(n26), .A0N(\Reg_F[8][2] ), .A1N(n26), .Y(
        n111) );
  OAI2BB2X1M U148 ( .B0(n302), .B1(n26), .A0N(\Reg_F[8][3] ), .A1N(n26), .Y(
        n112) );
  OAI2BB2X1M U149 ( .B0(n301), .B1(n26), .A0N(\Reg_F[8][4] ), .A1N(n26), .Y(
        n113) );
  OAI2BB2X1M U150 ( .B0(n300), .B1(n26), .A0N(\Reg_F[8][5] ), .A1N(n26), .Y(
        n114) );
  OAI2BB2X1M U151 ( .B0(n299), .B1(n26), .A0N(\Reg_F[8][6] ), .A1N(n26), .Y(
        n115) );
  OAI2BB2X1M U152 ( .B0(n298), .B1(n26), .A0N(\Reg_F[8][7] ), .A1N(n26), .Y(
        n116) );
  OAI2BB2X1M U153 ( .B0(n297), .B1(n28), .A0N(\Reg_F[9][0] ), .A1N(n28), .Y(
        n117) );
  OAI2BB2X1M U154 ( .B0(n304), .B1(n28), .A0N(\Reg_F[9][1] ), .A1N(n28), .Y(
        n118) );
  OAI2BB2X1M U155 ( .B0(n303), .B1(n28), .A0N(\Reg_F[9][2] ), .A1N(n28), .Y(
        n119) );
  OAI2BB2X1M U156 ( .B0(n302), .B1(n28), .A0N(\Reg_F[9][3] ), .A1N(n28), .Y(
        n120) );
  OAI2BB2X1M U157 ( .B0(n301), .B1(n28), .A0N(\Reg_F[9][4] ), .A1N(n28), .Y(
        n121) );
  OAI2BB2X1M U158 ( .B0(n300), .B1(n28), .A0N(\Reg_F[9][5] ), .A1N(n28), .Y(
        n122) );
  OAI2BB2X1M U159 ( .B0(n299), .B1(n28), .A0N(\Reg_F[9][6] ), .A1N(n28), .Y(
        n123) );
  OAI2BB2X1M U160 ( .B0(n298), .B1(n28), .A0N(\Reg_F[9][7] ), .A1N(n28), .Y(
        n124) );
  OAI2BB2X1M U161 ( .B0(n297), .B1(n30), .A0N(\Reg_F[10][0] ), .A1N(n30), .Y(
        n125) );
  OAI2BB2X1M U162 ( .B0(n304), .B1(n30), .A0N(\Reg_F[10][1] ), .A1N(n30), .Y(
        n126) );
  OAI2BB2X1M U163 ( .B0(n303), .B1(n30), .A0N(\Reg_F[10][2] ), .A1N(n30), .Y(
        n127) );
  OAI2BB2X1M U164 ( .B0(n302), .B1(n30), .A0N(\Reg_F[10][3] ), .A1N(n30), .Y(
        n128) );
  OAI2BB2X1M U165 ( .B0(n301), .B1(n30), .A0N(\Reg_F[10][4] ), .A1N(n30), .Y(
        n129) );
  OAI2BB2X1M U166 ( .B0(n300), .B1(n30), .A0N(\Reg_F[10][5] ), .A1N(n30), .Y(
        n130) );
  OAI2BB2X1M U167 ( .B0(n299), .B1(n30), .A0N(\Reg_F[10][6] ), .A1N(n30), .Y(
        n131) );
  OAI2BB2X1M U168 ( .B0(n298), .B1(n30), .A0N(\Reg_F[10][7] ), .A1N(n30), .Y(
        n132) );
  OAI2BB2X1M U169 ( .B0(n297), .B1(n31), .A0N(\Reg_F[11][0] ), .A1N(n31), .Y(
        n133) );
  OAI2BB2X1M U170 ( .B0(n304), .B1(n31), .A0N(\Reg_F[11][1] ), .A1N(n31), .Y(
        n134) );
  OAI2BB2X1M U171 ( .B0(n303), .B1(n31), .A0N(\Reg_F[11][2] ), .A1N(n31), .Y(
        n135) );
  OAI2BB2X1M U172 ( .B0(n302), .B1(n31), .A0N(\Reg_F[11][3] ), .A1N(n31), .Y(
        n136) );
  OAI2BB2X1M U173 ( .B0(n301), .B1(n31), .A0N(\Reg_F[11][4] ), .A1N(n31), .Y(
        n137) );
  OAI2BB2X1M U174 ( .B0(n300), .B1(n31), .A0N(\Reg_F[11][5] ), .A1N(n31), .Y(
        n138) );
  OAI2BB2X1M U175 ( .B0(n299), .B1(n31), .A0N(\Reg_F[11][6] ), .A1N(n31), .Y(
        n139) );
  OAI2BB2X1M U176 ( .B0(n298), .B1(n31), .A0N(\Reg_F[11][7] ), .A1N(n31), .Y(
        n140) );
  OAI2BB2X1M U177 ( .B0(n297), .B1(n34), .A0N(\Reg_F[13][0] ), .A1N(n34), .Y(
        n149) );
  OAI2BB2X1M U178 ( .B0(n304), .B1(n34), .A0N(\Reg_F[13][1] ), .A1N(n34), .Y(
        n150) );
  OAI2BB2X1M U179 ( .B0(n303), .B1(n34), .A0N(\Reg_F[13][2] ), .A1N(n34), .Y(
        n151) );
  OAI2BB2X1M U180 ( .B0(n302), .B1(n34), .A0N(\Reg_F[13][3] ), .A1N(n34), .Y(
        n152) );
  OAI2BB2X1M U181 ( .B0(n301), .B1(n34), .A0N(\Reg_F[13][4] ), .A1N(n34), .Y(
        n153) );
  OAI2BB2X1M U182 ( .B0(n300), .B1(n34), .A0N(\Reg_F[13][5] ), .A1N(n34), .Y(
        n154) );
  OAI2BB2X1M U183 ( .B0(n299), .B1(n34), .A0N(\Reg_F[13][6] ), .A1N(n34), .Y(
        n155) );
  OAI2BB2X1M U184 ( .B0(n298), .B1(n34), .A0N(\Reg_F[13][7] ), .A1N(n34), .Y(
        n156) );
  OAI2BB2X1M U185 ( .B0(n297), .B1(n36), .A0N(\Reg_F[15][0] ), .A1N(n36), .Y(
        n165) );
  OAI2BB2X1M U186 ( .B0(n304), .B1(n36), .A0N(\Reg_F[15][1] ), .A1N(n36), .Y(
        n166) );
  OAI2BB2X1M U187 ( .B0(n303), .B1(n36), .A0N(\Reg_F[15][2] ), .A1N(n36), .Y(
        n167) );
  OAI2BB2X1M U188 ( .B0(n302), .B1(n36), .A0N(\Reg_F[15][3] ), .A1N(n36), .Y(
        n168) );
  OAI2BB2X1M U189 ( .B0(n301), .B1(n36), .A0N(\Reg_F[15][4] ), .A1N(n36), .Y(
        n169) );
  OAI2BB2X1M U190 ( .B0(n300), .B1(n36), .A0N(\Reg_F[15][5] ), .A1N(n36), .Y(
        n170) );
  OAI2BB2X1M U191 ( .B0(n299), .B1(n36), .A0N(\Reg_F[15][6] ), .A1N(n36), .Y(
        n171) );
  OAI2BB2X1M U192 ( .B0(n298), .B1(n36), .A0N(\Reg_F[15][7] ), .A1N(n36), .Y(
        n172) );
  OAI2BB2X1M U193 ( .B0(n297), .B1(n33), .A0N(\Reg_F[12][0] ), .A1N(n33), .Y(
        n141) );
  OAI2BB2X1M U194 ( .B0(n304), .B1(n33), .A0N(\Reg_F[12][1] ), .A1N(n33), .Y(
        n142) );
  OAI2BB2X1M U195 ( .B0(n303), .B1(n33), .A0N(\Reg_F[12][2] ), .A1N(n33), .Y(
        n143) );
  OAI2BB2X1M U196 ( .B0(n302), .B1(n33), .A0N(\Reg_F[12][3] ), .A1N(n33), .Y(
        n144) );
  OAI2BB2X1M U197 ( .B0(n301), .B1(n33), .A0N(\Reg_F[12][4] ), .A1N(n33), .Y(
        n145) );
  OAI2BB2X1M U198 ( .B0(n300), .B1(n33), .A0N(\Reg_F[12][5] ), .A1N(n33), .Y(
        n146) );
  OAI2BB2X1M U199 ( .B0(n299), .B1(n33), .A0N(\Reg_F[12][6] ), .A1N(n33), .Y(
        n147) );
  OAI2BB2X1M U200 ( .B0(n298), .B1(n33), .A0N(\Reg_F[12][7] ), .A1N(n33), .Y(
        n148) );
  OAI2BB2X1M U201 ( .B0(n297), .B1(n35), .A0N(\Reg_F[14][0] ), .A1N(n35), .Y(
        n157) );
  OAI2BB2X1M U202 ( .B0(n304), .B1(n35), .A0N(\Reg_F[14][1] ), .A1N(n35), .Y(
        n158) );
  OAI2BB2X1M U203 ( .B0(n303), .B1(n35), .A0N(\Reg_F[14][2] ), .A1N(n35), .Y(
        n159) );
  OAI2BB2X1M U204 ( .B0(n302), .B1(n35), .A0N(\Reg_F[14][3] ), .A1N(n35), .Y(
        n160) );
  OAI2BB2X1M U205 ( .B0(n301), .B1(n35), .A0N(\Reg_F[14][4] ), .A1N(n35), .Y(
        n161) );
  OAI2BB2X1M U206 ( .B0(n300), .B1(n35), .A0N(\Reg_F[14][5] ), .A1N(n35), .Y(
        n162) );
  OAI2BB2X1M U207 ( .B0(n299), .B1(n35), .A0N(\Reg_F[14][6] ), .A1N(n35), .Y(
        n163) );
  OAI2BB2X1M U208 ( .B0(n298), .B1(n35), .A0N(\Reg_F[14][7] ), .A1N(n35), .Y(
        n164) );
  AOI22X1M U209 ( .A0(\Reg_F[10][0] ), .A1(n271), .B0(\Reg_F[11][0] ), .B1(
        n270), .Y(n7) );
  AOI22X1M U210 ( .A0(\Reg_F[8][0] ), .A1(n273), .B0(\Reg_F[9][0] ), .B1(n272), 
        .Y(n6) );
  CLKNAND2X2M U211 ( .A(N12), .B(n267), .Y(n250) );
  AOI21X1M U212 ( .A0(n7), .A1(n6), .B0(n250), .Y(n177) );
  AOI22X1M U213 ( .A0(\Reg_F[14][0] ), .A1(n271), .B0(\Reg_F[15][0] ), .B1(
        n270), .Y(n9) );
  AOI22X1M U214 ( .A0(\Reg_F[12][0] ), .A1(n273), .B0(\Reg_F[13][0] ), .B1(
        n272), .Y(n8) );
  CLKNAND2X2M U215 ( .A(N12), .B(N11), .Y(n253) );
  AOI21X1M U216 ( .A0(n9), .A1(n8), .B0(n253), .Y(n176) );
  AOI22X1M U217 ( .A0(o_REG2_reg[0]), .A1(n271), .B0(o_REG3_reg[0]), .B1(n270), 
        .Y(n25) );
  AOI22X1M U218 ( .A0(o_REG0_reg[0]), .A1(n273), .B0(o_REG1_reg[0]), .B1(n272), 
        .Y(n10) );
  CLKNAND2X2M U219 ( .A(n267), .B(n268), .Y(n256) );
  AOI21X1M U220 ( .A0(n25), .A1(n10), .B0(n256), .Y(n175) );
  AOI22X1M U221 ( .A0(\Reg_F[6][0] ), .A1(n271), .B0(\Reg_F[7][0] ), .B1(n270), 
        .Y(n173) );
  AOI22X1M U222 ( .A0(\Reg_F[4][0] ), .A1(n273), .B0(\Reg_F[5][0] ), .B1(n272), 
        .Y(n32) );
  CLKNAND2X2M U223 ( .A(N11), .B(n268), .Y(n259) );
  AOI21X1M U224 ( .A0(n173), .A1(n32), .B0(n259), .Y(n174) );
  OR4X1M U225 ( .A(n177), .B(n176), .C(n175), .D(n174), .Y(N56) );
  AOI22X1M U226 ( .A0(\Reg_F[10][1] ), .A1(n271), .B0(\Reg_F[11][1] ), .B1(
        n270), .Y(n179) );
  AOI22X1M U227 ( .A0(\Reg_F[8][1] ), .A1(n273), .B0(\Reg_F[9][1] ), .B1(n272), 
        .Y(n178) );
  AOI21X1M U228 ( .A0(n179), .A1(n178), .B0(n250), .Y(n189) );
  AOI22X1M U229 ( .A0(\Reg_F[14][1] ), .A1(n271), .B0(\Reg_F[15][1] ), .B1(
        n270), .Y(n181) );
  AOI22X1M U230 ( .A0(\Reg_F[12][1] ), .A1(n273), .B0(\Reg_F[13][1] ), .B1(
        n272), .Y(n180) );
  AOI21X1M U231 ( .A0(n181), .A1(n180), .B0(n253), .Y(n188) );
  AOI22X1M U232 ( .A0(o_REG2_reg[1]), .A1(n271), .B0(o_REG3_reg[1]), .B1(n270), 
        .Y(n183) );
  AOI22X1M U233 ( .A0(o_REG0_reg[1]), .A1(n273), .B0(o_REG1_reg[1]), .B1(n272), 
        .Y(n182) );
  AOI21X1M U234 ( .A0(n183), .A1(n182), .B0(n256), .Y(n187) );
  AOI22X1M U235 ( .A0(\Reg_F[6][1] ), .A1(n271), .B0(\Reg_F[7][1] ), .B1(n270), 
        .Y(n185) );
  AOI22X1M U236 ( .A0(\Reg_F[4][1] ), .A1(n273), .B0(\Reg_F[5][1] ), .B1(n272), 
        .Y(n184) );
  AOI21X1M U237 ( .A0(n185), .A1(n184), .B0(n259), .Y(n186) );
  OR4X1M U238 ( .A(n189), .B(n188), .C(n187), .D(n186), .Y(N55) );
  AOI22X1M U239 ( .A0(\Reg_F[10][2] ), .A1(n271), .B0(\Reg_F[11][2] ), .B1(
        n270), .Y(n191) );
  AOI22X1M U240 ( .A0(\Reg_F[8][2] ), .A1(n273), .B0(\Reg_F[9][2] ), .B1(n272), 
        .Y(n190) );
  AOI21X1M U241 ( .A0(n191), .A1(n190), .B0(n250), .Y(n201) );
  AOI22X1M U242 ( .A0(\Reg_F[14][2] ), .A1(n271), .B0(\Reg_F[15][2] ), .B1(
        n270), .Y(n193) );
  AOI22X1M U243 ( .A0(\Reg_F[12][2] ), .A1(n273), .B0(\Reg_F[13][2] ), .B1(
        n272), .Y(n192) );
  AOI21X1M U244 ( .A0(n193), .A1(n192), .B0(n253), .Y(n200) );
  AOI22X1M U245 ( .A0(o_REG2_reg[2]), .A1(n271), .B0(o_REG3_reg[2]), .B1(n270), 
        .Y(n195) );
  AOI22X1M U246 ( .A0(o_REG0_reg[2]), .A1(n273), .B0(o_REG1_reg[2]), .B1(n272), 
        .Y(n194) );
  AOI21X1M U247 ( .A0(n195), .A1(n194), .B0(n256), .Y(n199) );
  AOI22X1M U248 ( .A0(\Reg_F[6][2] ), .A1(n271), .B0(\Reg_F[7][2] ), .B1(n270), 
        .Y(n197) );
  AOI22X1M U249 ( .A0(\Reg_F[4][2] ), .A1(n273), .B0(\Reg_F[5][2] ), .B1(n272), 
        .Y(n196) );
  AOI21X1M U250 ( .A0(n197), .A1(n196), .B0(n259), .Y(n198) );
  OR4X1M U251 ( .A(n201), .B(n200), .C(n199), .D(n198), .Y(N54) );
  AOI22X1M U252 ( .A0(\Reg_F[10][3] ), .A1(n271), .B0(\Reg_F[11][3] ), .B1(
        n270), .Y(n203) );
  AOI22X1M U253 ( .A0(\Reg_F[8][3] ), .A1(n273), .B0(\Reg_F[9][3] ), .B1(n272), 
        .Y(n202) );
  AOI21X1M U254 ( .A0(n203), .A1(n202), .B0(n250), .Y(n213) );
  AOI22X1M U255 ( .A0(\Reg_F[14][3] ), .A1(n271), .B0(\Reg_F[15][3] ), .B1(
        n270), .Y(n205) );
  AOI22X1M U256 ( .A0(\Reg_F[12][3] ), .A1(n273), .B0(\Reg_F[13][3] ), .B1(
        n272), .Y(n204) );
  AOI21X1M U257 ( .A0(n205), .A1(n204), .B0(n253), .Y(n212) );
  AOI22X1M U258 ( .A0(o_REG2_reg[3]), .A1(n271), .B0(o_REG3_reg[3]), .B1(n270), 
        .Y(n207) );
  AOI22X1M U259 ( .A0(o_REG0_reg[3]), .A1(n273), .B0(o_REG1_reg[3]), .B1(n272), 
        .Y(n206) );
  AOI21X1M U260 ( .A0(n207), .A1(n206), .B0(n256), .Y(n211) );
  AOI22X1M U261 ( .A0(\Reg_F[6][3] ), .A1(n271), .B0(\Reg_F[7][3] ), .B1(n270), 
        .Y(n209) );
  AOI22X1M U262 ( .A0(\Reg_F[4][3] ), .A1(n273), .B0(\Reg_F[5][3] ), .B1(n272), 
        .Y(n208) );
  AOI21X1M U263 ( .A0(n209), .A1(n208), .B0(n259), .Y(n210) );
  OR4X1M U264 ( .A(n213), .B(n212), .C(n211), .D(n210), .Y(N53) );
  AOI22X1M U265 ( .A0(\Reg_F[10][4] ), .A1(n271), .B0(\Reg_F[11][4] ), .B1(
        n270), .Y(n215) );
  AOI22X1M U266 ( .A0(\Reg_F[8][4] ), .A1(n273), .B0(\Reg_F[9][4] ), .B1(n272), 
        .Y(n214) );
  AOI21X1M U267 ( .A0(n215), .A1(n214), .B0(n250), .Y(n225) );
  AOI22X1M U268 ( .A0(\Reg_F[14][4] ), .A1(n271), .B0(\Reg_F[15][4] ), .B1(
        n270), .Y(n217) );
  AOI22X1M U269 ( .A0(\Reg_F[12][4] ), .A1(n273), .B0(\Reg_F[13][4] ), .B1(
        n272), .Y(n216) );
  AOI21X1M U270 ( .A0(n217), .A1(n216), .B0(n253), .Y(n224) );
  AOI22X1M U271 ( .A0(o_REG2_reg[4]), .A1(n271), .B0(o_REG3_reg[4]), .B1(n270), 
        .Y(n219) );
  AOI22X1M U272 ( .A0(o_REG0_reg[4]), .A1(n273), .B0(o_REG1_reg[4]), .B1(n272), 
        .Y(n218) );
  AOI21X1M U273 ( .A0(n219), .A1(n218), .B0(n256), .Y(n223) );
  AOI22X1M U274 ( .A0(\Reg_F[6][4] ), .A1(n271), .B0(\Reg_F[7][4] ), .B1(n270), 
        .Y(n221) );
  AOI22X1M U275 ( .A0(\Reg_F[4][4] ), .A1(n273), .B0(\Reg_F[5][4] ), .B1(n272), 
        .Y(n220) );
  AOI21X1M U276 ( .A0(n221), .A1(n220), .B0(n259), .Y(n222) );
  OR4X1M U277 ( .A(n225), .B(n224), .C(n223), .D(n222), .Y(N52) );
  AOI22X1M U278 ( .A0(\Reg_F[10][5] ), .A1(n271), .B0(\Reg_F[11][5] ), .B1(
        n270), .Y(n227) );
  AOI22X1M U279 ( .A0(\Reg_F[8][5] ), .A1(n273), .B0(\Reg_F[9][5] ), .B1(n272), 
        .Y(n226) );
  AOI21X1M U280 ( .A0(n227), .A1(n226), .B0(n250), .Y(n237) );
  AOI22X1M U281 ( .A0(\Reg_F[14][5] ), .A1(n271), .B0(\Reg_F[15][5] ), .B1(
        n270), .Y(n229) );
  AOI22X1M U282 ( .A0(\Reg_F[12][5] ), .A1(n273), .B0(\Reg_F[13][5] ), .B1(
        n272), .Y(n228) );
  AOI21X1M U283 ( .A0(n229), .A1(n228), .B0(n253), .Y(n236) );
  AOI22X1M U284 ( .A0(o_REG2_reg[5]), .A1(n271), .B0(o_REG3_reg[5]), .B1(n270), 
        .Y(n231) );
  AOI22X1M U285 ( .A0(o_REG0_reg[5]), .A1(n273), .B0(o_REG1_reg[5]), .B1(n272), 
        .Y(n230) );
  AOI21X1M U286 ( .A0(n231), .A1(n230), .B0(n256), .Y(n235) );
  AOI22X1M U287 ( .A0(\Reg_F[6][5] ), .A1(n271), .B0(\Reg_F[7][5] ), .B1(n270), 
        .Y(n233) );
  AOI22X1M U288 ( .A0(\Reg_F[4][5] ), .A1(n273), .B0(\Reg_F[5][5] ), .B1(n272), 
        .Y(n232) );
  AOI21X1M U289 ( .A0(n233), .A1(n232), .B0(n259), .Y(n234) );
  OR4X1M U290 ( .A(n237), .B(n236), .C(n235), .D(n234), .Y(N51) );
  AOI22X1M U291 ( .A0(\Reg_F[10][6] ), .A1(n271), .B0(\Reg_F[11][6] ), .B1(
        n270), .Y(n239) );
  AOI22X1M U292 ( .A0(\Reg_F[8][6] ), .A1(n273), .B0(\Reg_F[9][6] ), .B1(n272), 
        .Y(n238) );
  AOI21X1M U293 ( .A0(n239), .A1(n238), .B0(n250), .Y(n249) );
  AOI22X1M U294 ( .A0(\Reg_F[14][6] ), .A1(n271), .B0(\Reg_F[15][6] ), .B1(
        n270), .Y(n241) );
  AOI22X1M U295 ( .A0(\Reg_F[12][6] ), .A1(n273), .B0(\Reg_F[13][6] ), .B1(
        n272), .Y(n240) );
  AOI21X1M U296 ( .A0(n241), .A1(n240), .B0(n253), .Y(n248) );
  AOI22X1M U297 ( .A0(o_REG2_reg[6]), .A1(n271), .B0(o_REG3_reg[6]), .B1(n270), 
        .Y(n243) );
  AOI22X1M U298 ( .A0(o_REG0_reg[6]), .A1(n273), .B0(o_REG1_reg[6]), .B1(n272), 
        .Y(n242) );
  AOI21X1M U299 ( .A0(n243), .A1(n242), .B0(n256), .Y(n247) );
  AOI22X1M U300 ( .A0(\Reg_F[6][6] ), .A1(n271), .B0(\Reg_F[7][6] ), .B1(n270), 
        .Y(n245) );
  AOI22X1M U301 ( .A0(\Reg_F[4][6] ), .A1(n273), .B0(\Reg_F[5][6] ), .B1(n272), 
        .Y(n244) );
  AOI21X1M U302 ( .A0(n245), .A1(n244), .B0(n259), .Y(n246) );
  OR4X1M U303 ( .A(n249), .B(n248), .C(n247), .D(n246), .Y(N50) );
  AOI22X1M U304 ( .A0(\Reg_F[10][7] ), .A1(n271), .B0(\Reg_F[11][7] ), .B1(
        n270), .Y(n252) );
  AOI22X1M U305 ( .A0(\Reg_F[8][7] ), .A1(n273), .B0(\Reg_F[9][7] ), .B1(n272), 
        .Y(n251) );
  AOI21X1M U306 ( .A0(n252), .A1(n251), .B0(n250), .Y(n265) );
  AOI22X1M U307 ( .A0(\Reg_F[14][7] ), .A1(n271), .B0(\Reg_F[15][7] ), .B1(
        n270), .Y(n255) );
  AOI22X1M U308 ( .A0(\Reg_F[12][7] ), .A1(n273), .B0(\Reg_F[13][7] ), .B1(
        n272), .Y(n254) );
  AOI21X1M U309 ( .A0(n255), .A1(n254), .B0(n253), .Y(n264) );
  AOI22X1M U310 ( .A0(o_REG2_reg[7]), .A1(n271), .B0(o_REG3_reg[7]), .B1(n270), 
        .Y(n258) );
  AOI22X1M U311 ( .A0(o_REG0_reg[7]), .A1(n273), .B0(o_REG1_reg[7]), .B1(n272), 
        .Y(n257) );
  AOI21X1M U312 ( .A0(n258), .A1(n257), .B0(n256), .Y(n263) );
  AOI22X1M U313 ( .A0(\Reg_F[6][7] ), .A1(n271), .B0(\Reg_F[7][7] ), .B1(n270), 
        .Y(n261) );
  AOI22X1M U314 ( .A0(\Reg_F[4][7] ), .A1(n273), .B0(\Reg_F[5][7] ), .B1(n272), 
        .Y(n260) );
  AOI21X1M U315 ( .A0(n261), .A1(n260), .B0(n259), .Y(n262) );
  OR4X1M U316 ( .A(n265), .B(n264), .C(n263), .D(n262), .Y(N49) );
endmodule


module Alu_unit_op_width8_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  INVX2M U10 ( .A(b[1]), .Y(n17) );
  NAND2X2M U11 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U12 ( .A(a[5]), .Y(n4) );
  INVX2M U13 ( .A(n18), .Y(n3) );
  NAND2X2M U14 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U15 ( .A(a[4]), .Y(n6) );
  INVX2M U16 ( .A(n18), .Y(n5) );
  NAND2X2M U17 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U18 ( .A(a[3]), .Y(n7) );
  NAND2X2M U19 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n18), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(a[0]), .Y(n10) );
  INVX2M U29 ( .A(b[7]), .Y(n11) );
  INVX2M U30 ( .A(b[2]), .Y(n16) );
  INVX2M U31 ( .A(b[3]), .Y(n15) );
  INVX2M U32 ( .A(b[4]), .Y(n14) );
  INVX2M U33 ( .A(b[5]), .Y(n13) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module Alu_unit_op_width8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  INVX2M U2 ( .A(B[1]), .Y(n8) );
  NAND2X2M U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U4 ( .A(A[0]), .Y(n1) );
  INVX2M U5 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U6 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U7 ( .A(B[0]), .Y(n9) );
  INVX2M U8 ( .A(B[2]), .Y(n7) );
  INVX2M U9 ( .A(B[3]), .Y(n6) );
  INVX2M U10 ( .A(B[4]), .Y(n5) );
  INVX2M U11 ( .A(B[5]), .Y(n4) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module Alu_unit_op_width8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module Alu_unit_op_width8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module Alu_unit_op_width8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  Alu_unit_op_width8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n9), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n8), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U11 ( .A(\ab[0][7] ), .Y(n23) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U17 ( .A(\ab[0][5] ), .Y(n21) );
  XNOR2X2M U18 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  AND2X2M U19 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U20 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U24 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U26 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  XNOR2X2M U28 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U29 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U30 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  INVX2M U39 ( .A(B[7]), .Y(n24) );
  XNOR2X2M U40 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[3]), .Y(n36) );
  INVX2M U43 ( .A(A[4]), .Y(n35) );
  INVX2M U44 ( .A(B[1]), .Y(n30) );
  INVX2M U45 ( .A(A[6]), .Y(n33) );
  INVX2M U46 ( .A(A[7]), .Y(n32) );
  INVX2M U47 ( .A(A[5]), .Y(n34) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[0]), .Y(n31) );
  INVX2M U52 ( .A(B[2]), .Y(n29) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module Alu_unit_op_width8 ( i_clk_alu, i_rst_n_alu, i_OP_A_alu, i_OP_B_alu, 
        i_Enable_alu, i_ALU_FUN_alu, o_ALU_OUT, o_VALID_alu );
  input [7:0] i_OP_A_alu;
  input [7:0] i_OP_B_alu;
  input [3:0] i_ALU_FUN_alu;
  output [15:0] o_ALU_OUT;
  input i_clk_alu, i_rst_n_alu, i_Enable_alu;
  output o_VALID_alu;
  wire   N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82,
         N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N102, N104, N105, N106, N107, N108, N109,
         N110, N111, N168, N169, N170, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152;
  wire   [15:0] ALU_Result_reg;

  Alu_unit_op_width8_DW_div_uns_0 div_81 ( .a({n15, n14, n13, n12, n11, n10, 
        n9, n8}), .b({n7, n6, i_OP_B_alu[5:2], n5, i_OP_B_alu[0]}), .quotient(
        {N111, N110, N109, N108, N107, N106, N105, N104}) );
  Alu_unit_op_width8_DW01_sub_0 sub_63 ( .A({1'b0, n15, n14, n13, n12, n11, 
        n10, n9, n8}), .B({1'b0, n7, n6, i_OP_B_alu[5:2], n5, i_OP_B_alu[0]}), 
        .CI(1'b0), .DIFF({N86, N85, N84, N83, N82, N81, N80, N79, N78}) );
  Alu_unit_op_width8_DW01_add_0 add_57 ( .A({1'b0, n15, n14, n13, n12, n11, 
        n10, n9, n8}), .B({1'b0, n7, n6, i_OP_B_alu[5:2], n5, i_OP_B_alu[0]}), 
        .CI(1'b0), .SUM({N77, N76, N75, N74, N73, N72, N71, N70, N69}) );
  Alu_unit_op_width8_DW02_mult_0 mult_69 ( .A({n15, n14, n13, n12, n11, n10, 
        n9, n8}), .B({n7, n6, i_OP_B_alu[5:2], n5, i_OP_B_alu[0]}), .TC(1'b0), 
        .PRODUCT({N102, N101, N100, N99, N98, N97, N96, N95, N94, N93, N92, 
        N91, N90, N89, N88, N87}) );
  DFFRQX2M \o_ALU_OUT_reg[15]  ( .D(ALU_Result_reg[15]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[15]) );
  DFFRQX2M \o_ALU_OUT_reg[14]  ( .D(ALU_Result_reg[14]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[14]) );
  DFFRQX2M \o_ALU_OUT_reg[13]  ( .D(ALU_Result_reg[13]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[13]) );
  DFFRQX2M \o_ALU_OUT_reg[12]  ( .D(ALU_Result_reg[12]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[12]) );
  DFFRQX2M \o_ALU_OUT_reg[11]  ( .D(ALU_Result_reg[11]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[11]) );
  DFFRQX2M \o_ALU_OUT_reg[10]  ( .D(ALU_Result_reg[10]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[10]) );
  DFFRQX2M \o_ALU_OUT_reg[9]  ( .D(ALU_Result_reg[9]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[9]) );
  DFFRQX2M \o_ALU_OUT_reg[8]  ( .D(ALU_Result_reg[8]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[8]) );
  DFFRQX2M \o_ALU_OUT_reg[7]  ( .D(ALU_Result_reg[7]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[7]) );
  DFFRQX2M \o_ALU_OUT_reg[6]  ( .D(ALU_Result_reg[6]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[6]) );
  DFFRQX2M \o_ALU_OUT_reg[5]  ( .D(ALU_Result_reg[5]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[5]) );
  DFFRQX2M \o_ALU_OUT_reg[4]  ( .D(ALU_Result_reg[4]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[4]) );
  DFFRQX2M \o_ALU_OUT_reg[3]  ( .D(ALU_Result_reg[3]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[3]) );
  DFFRQX2M \o_ALU_OUT_reg[2]  ( .D(ALU_Result_reg[2]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[2]) );
  DFFRQX2M \o_ALU_OUT_reg[1]  ( .D(ALU_Result_reg[1]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[1]) );
  DFFRQX2M \o_ALU_OUT_reg[0]  ( .D(ALU_Result_reg[0]), .CK(i_clk_alu), .RN(
        i_rst_n_alu), .Q(o_ALU_OUT[0]) );
  DFFRQX2M o_VALID_alu_reg ( .D(i_Enable_alu), .CK(i_clk_alu), .RN(i_rst_n_alu), .Q(o_VALID_alu) );
  NOR3BX2M U3 ( .AN(n4), .B(n139), .C(n112), .Y(n57) );
  NOR3BX2M U4 ( .AN(n4), .B(n101), .C(i_ALU_FUN_alu[0]), .Y(n39) );
  NOR3X2M U5 ( .A(n3), .B(i_ALU_FUN_alu[2]), .C(n142), .Y(n40) );
  BUFX2M U8 ( .A(i_OP_A_alu[7]), .Y(n15) );
  BUFX2M U9 ( .A(i_OP_A_alu[6]), .Y(n14) );
  BUFX2M U10 ( .A(i_OP_A_alu[1]), .Y(n9) );
  OAI2BB1X2M U11 ( .A0N(N101), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[14]) );
  OAI2BB1X2M U12 ( .A0N(N102), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[15]) );
  OAI2BB1X2M U13 ( .A0N(N98), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[11]) );
  OAI2BB1X2M U14 ( .A0N(N99), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[12]) );
  OAI2BB1X2M U15 ( .A0N(N100), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[13]) );
  OAI2BB1X2M U16 ( .A0N(N96), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[9]) );
  OAI2BB1X2M U17 ( .A0N(N97), .A1N(n35), .B0(n36), .Y(ALU_Result_reg[10]) );
  NAND2X2M U18 ( .A(i_Enable_alu), .B(n42), .Y(n36) );
  INVX2M U19 ( .A(n97), .Y(n138) );
  INVX2M U20 ( .A(n53), .Y(n140) );
  INVX2M U21 ( .A(n47), .Y(n137) );
  INVX2M U22 ( .A(n102), .Y(n136) );
  INVX2M U23 ( .A(i_Enable_alu), .Y(n133) );
  OAI2BB2X1M U24 ( .B0(n146), .B1(n47), .A0N(N94), .A1N(n40), .Y(n46) );
  OAI2B11X2M U25 ( .A1N(N86), .A0(n102), .B0(n140), .C0(n138), .Y(n42) );
  OAI21X2M U26 ( .A0(n3), .A1(n112), .B0(n111), .Y(n52) );
  OAI2B1X2M U27 ( .A1N(n110), .A0(n101), .B0(n111), .Y(n97) );
  INVX2M U28 ( .A(n50), .Y(n135) );
  NOR2X2M U29 ( .A(n101), .B(n3), .Y(n53) );
  NOR2BX2M U30 ( .AN(n113), .B(n3), .Y(n41) );
  NAND2X2M U31 ( .A(n141), .B(n110), .Y(n47) );
  NOR2BX2M U32 ( .AN(n40), .B(n133), .Y(n35) );
  NAND2X2M U33 ( .A(n113), .B(n110), .Y(n102) );
  INVX2M U34 ( .A(n112), .Y(n141) );
  AOI31X2M U35 ( .A0(n103), .A1(n104), .A2(n105), .B0(n133), .Y(
        ALU_Result_reg[0]) );
  AOI22X1M U36 ( .A0(N78), .A1(n136), .B0(N69), .B1(n41), .Y(n103) );
  AOI222X1M U37 ( .A0(N87), .A1(n40), .B0(n53), .B1(n152), .C0(n8), .C1(n137), 
        .Y(n104) );
  AOI211X2M U38 ( .A0(n9), .A1(n57), .B0(n106), .C0(n107), .Y(n105) );
  OAI2BB1X2M U39 ( .A0N(N104), .A1N(n48), .B0(n114), .Y(n106) );
  AOI31X2M U40 ( .A0(N168), .A1(n4), .A2(n115), .B0(n100), .Y(n114) );
  NOR3X2M U41 ( .A(n142), .B(i_ALU_FUN_alu[2]), .C(i_ALU_FUN_alu[0]), .Y(n115)
         );
  AOI31X2M U42 ( .A0(n90), .A1(n91), .A2(n92), .B0(n133), .Y(ALU_Result_reg[1]) );
  AOI222X1M U43 ( .A0(N70), .A1(n41), .B0(N88), .B1(n40), .C0(N79), .C1(n136), 
        .Y(n90) );
  AOI222X1M U44 ( .A0(n9), .A1(n137), .B0(n10), .B1(n57), .C0(n53), .C1(n126), 
        .Y(n91) );
  AOI211X2M U45 ( .A0(n8), .A1(n39), .B0(n93), .C0(n94), .Y(n92) );
  OAI2BB1X2M U46 ( .A0N(N105), .A1N(n48), .B0(n98), .Y(n93) );
  AOI31X2M U47 ( .A0(N169), .A1(n4), .A2(n99), .B0(n100), .Y(n98) );
  NOR3X2M U48 ( .A(n139), .B(i_ALU_FUN_alu[2]), .C(n142), .Y(n99) );
  AOI31X2M U49 ( .A0(n83), .A1(n84), .A2(n85), .B0(n133), .Y(ALU_Result_reg[2]) );
  AOI22X1M U50 ( .A0(N80), .A1(n136), .B0(N71), .B1(n41), .Y(n83) );
  AOI222X1M U51 ( .A0(N89), .A1(n40), .B0(n53), .B1(n151), .C0(n10), .C1(n137), 
        .Y(n84) );
  AOI221XLM U52 ( .A0(n9), .A1(n39), .B0(n11), .B1(n57), .C0(n86), .Y(n85) );
  AOI31X2M U53 ( .A0(n76), .A1(n77), .A2(n78), .B0(n133), .Y(ALU_Result_reg[3]) );
  AOI22X1M U54 ( .A0(N81), .A1(n136), .B0(N72), .B1(n41), .Y(n76) );
  AOI222X1M U55 ( .A0(N90), .A1(n40), .B0(n53), .B1(n150), .C0(n11), .C1(n137), 
        .Y(n77) );
  AOI221XLM U56 ( .A0(n10), .A1(n39), .B0(n12), .B1(n57), .C0(n79), .Y(n78) );
  AOI31X2M U57 ( .A0(n69), .A1(n70), .A2(n71), .B0(n133), .Y(ALU_Result_reg[4]) );
  AOI22X1M U58 ( .A0(N82), .A1(n136), .B0(N73), .B1(n41), .Y(n69) );
  AOI222X1M U59 ( .A0(N91), .A1(n40), .B0(n53), .B1(n149), .C0(n12), .C1(n137), 
        .Y(n70) );
  AOI221XLM U60 ( .A0(n11), .A1(n39), .B0(n57), .B1(n13), .C0(n72), .Y(n71) );
  AOI31X2M U61 ( .A0(n62), .A1(n63), .A2(n64), .B0(n133), .Y(ALU_Result_reg[5]) );
  AOI22X1M U62 ( .A0(N83), .A1(n136), .B0(N74), .B1(n41), .Y(n62) );
  AOI222X1M U63 ( .A0(N92), .A1(n40), .B0(n53), .B1(n148), .C0(n13), .C1(n137), 
        .Y(n63) );
  AOI221XLM U64 ( .A0(n12), .A1(n39), .B0(n57), .B1(n14), .C0(n65), .Y(n64) );
  AOI21X2M U65 ( .A0(n37), .A1(n38), .B0(n133), .Y(ALU_Result_reg[8]) );
  AOI21X2M U66 ( .A0(N77), .A1(n41), .B0(n42), .Y(n37) );
  AOI22X1M U67 ( .A0(n15), .A1(n39), .B0(N95), .B1(n40), .Y(n38) );
  AOI31X2M U68 ( .A0(n54), .A1(n55), .A2(n56), .B0(n133), .Y(ALU_Result_reg[6]) );
  AOI22X1M U69 ( .A0(N84), .A1(n136), .B0(N75), .B1(n41), .Y(n54) );
  AOI221XLM U70 ( .A0(n13), .A1(n39), .B0(n57), .B1(n15), .C0(n58), .Y(n56) );
  AOI222X1M U71 ( .A0(N93), .A1(n40), .B0(n53), .B1(n147), .C0(n137), .C1(n14), 
        .Y(n55) );
  AOI31X2M U72 ( .A0(n43), .A1(n44), .A2(n45), .B0(n133), .Y(ALU_Result_reg[7]) );
  AOI22X1M U73 ( .A0(n14), .A1(n39), .B0(n53), .B1(n146), .Y(n43) );
  AOI222X1M U74 ( .A0(n7), .A1(n134), .B0(N111), .B1(n48), .C0(n49), .C1(n143), 
        .Y(n44) );
  AOI221XLM U75 ( .A0(N85), .A1(n136), .B0(N76), .B1(n41), .C0(n46), .Y(n45)
         );
  INVX2M U76 ( .A(n6), .Y(n132) );
  OAI221X1M U77 ( .A0(n10), .A1(n138), .B0(n50), .B1(n151), .C0(n140), .Y(n89)
         );
  OAI221X1M U78 ( .A0(n11), .A1(n138), .B0(n50), .B1(n150), .C0(n140), .Y(n82)
         );
  OAI221X1M U79 ( .A0(n12), .A1(n138), .B0(n50), .B1(n149), .C0(n140), .Y(n75)
         );
  OAI221X1M U80 ( .A0(n13), .A1(n138), .B0(n50), .B1(n148), .C0(n140), .Y(n68)
         );
  OAI221X1M U81 ( .A0(n14), .A1(n138), .B0(n50), .B1(n147), .C0(n140), .Y(n61)
         );
  NOR2X2M U82 ( .A(i_ALU_FUN_alu[2]), .B(i_ALU_FUN_alu[1]), .Y(n113) );
  INVX2M U83 ( .A(n16), .Y(n128) );
  OAI2B2X1M U84 ( .A1N(n5), .A0(n95), .B0(n5), .B1(n96), .Y(n94) );
  AOI221XLM U85 ( .A0(n135), .A1(n126), .B0(n9), .B1(n52), .C0(n137), .Y(n95)
         );
  AOI221XLM U86 ( .A0(n9), .A1(n135), .B0(n97), .B1(n126), .C0(n53), .Y(n96)
         );
  NOR2X2M U87 ( .A(n139), .B(n4), .Y(n110) );
  NAND3X2M U88 ( .A(n113), .B(n139), .C(n4), .Y(n50) );
  NAND2X2M U89 ( .A(i_ALU_FUN_alu[2]), .B(i_ALU_FUN_alu[1]), .Y(n101) );
  INVX2M U90 ( .A(n27), .Y(n130) );
  INVX2M U91 ( .A(i_ALU_FUN_alu[0]), .Y(n139) );
  OAI21X2M U92 ( .A0(n59), .A1(n132), .B0(n60), .Y(n58) );
  AOI221XLM U93 ( .A0(n135), .A1(n147), .B0(n14), .B1(n52), .C0(n137), .Y(n59)
         );
  AOI22X1M U94 ( .A0(N110), .A1(n48), .B0(n61), .B1(n132), .Y(n60) );
  NAND3X2M U95 ( .A(n113), .B(i_ALU_FUN_alu[0]), .C(n4), .Y(n111) );
  INVX2M U96 ( .A(n51), .Y(n134) );
  AOI221XLM U97 ( .A0(n52), .A1(n15), .B0(n146), .B1(n135), .C0(n137), .Y(n51)
         );
  AND4X2M U98 ( .A(N170), .B(n141), .C(n4), .D(n139), .Y(n100) );
  INVX2M U99 ( .A(n9), .Y(n126) );
  OAI221X1M U100 ( .A0(n15), .A1(n138), .B0(n146), .B1(n50), .C0(n140), .Y(n49) );
  NAND2X2M U101 ( .A(i_ALU_FUN_alu[2]), .B(n142), .Y(n112) );
  INVX2M U102 ( .A(i_ALU_FUN_alu[1]), .Y(n142) );
  OR2X2M U103 ( .A(n4), .B(i_ALU_FUN_alu[0]), .Y(n3) );
  INVX2M U104 ( .A(n15), .Y(n146) );
  INVX2M U105 ( .A(n14), .Y(n147) );
  INVX2M U106 ( .A(n8), .Y(n152) );
  INVX2M U107 ( .A(n10), .Y(n151) );
  INVX2M U108 ( .A(n11), .Y(n150) );
  INVX2M U109 ( .A(n13), .Y(n148) );
  INVX2M U110 ( .A(n12), .Y(n149) );
  INVX2M U111 ( .A(n7), .Y(n143) );
  BUFX2M U112 ( .A(i_OP_B_alu[6]), .Y(n6) );
  BUFX2M U113 ( .A(i_OP_B_alu[7]), .Y(n7) );
  BUFX2M U114 ( .A(i_OP_B_alu[1]), .Y(n5) );
  BUFX2M U115 ( .A(i_OP_A_alu[5]), .Y(n13) );
  OAI21X2M U116 ( .A0(n87), .A1(n129), .B0(n88), .Y(n86) );
  AOI221XLM U117 ( .A0(n135), .A1(n151), .B0(n10), .B1(n52), .C0(n137), .Y(n87) );
  AOI22X1M U118 ( .A0(N106), .A1(n48), .B0(n89), .B1(n129), .Y(n88) );
  BUFX2M U119 ( .A(i_OP_A_alu[4]), .Y(n12) );
  BUFX2M U120 ( .A(i_OP_A_alu[3]), .Y(n11) );
  OAI21X2M U121 ( .A0(n80), .A1(n131), .B0(n81), .Y(n79) );
  AOI221XLM U122 ( .A0(n135), .A1(n150), .B0(n11), .B1(n52), .C0(n137), .Y(n80) );
  AOI22X1M U123 ( .A0(N107), .A1(n48), .B0(n82), .B1(n131), .Y(n81) );
  BUFX2M U124 ( .A(i_OP_A_alu[2]), .Y(n10) );
  OAI21X2M U125 ( .A0(n73), .A1(n145), .B0(n74), .Y(n72) );
  AOI221XLM U126 ( .A0(n135), .A1(n149), .B0(n12), .B1(n52), .C0(n137), .Y(n73) );
  AOI22X1M U127 ( .A0(N108), .A1(n48), .B0(n75), .B1(n145), .Y(n74) );
  INVX2M U128 ( .A(i_OP_B_alu[4]), .Y(n145) );
  BUFX2M U129 ( .A(i_OP_A_alu[0]), .Y(n8) );
  OAI21X2M U130 ( .A0(n66), .A1(n144), .B0(n67), .Y(n65) );
  AOI221XLM U131 ( .A0(n135), .A1(n148), .B0(n13), .B1(n52), .C0(n137), .Y(n66) );
  AOI22X1M U132 ( .A0(N109), .A1(n48), .B0(n68), .B1(n144), .Y(n67) );
  INVX2M U133 ( .A(i_OP_B_alu[5]), .Y(n144) );
  OAI2B2X1M U134 ( .A1N(i_OP_B_alu[0]), .A0(n108), .B0(i_OP_B_alu[0]), .B1(
        n109), .Y(n107) );
  AOI221XLM U135 ( .A0(n135), .A1(n152), .B0(n8), .B1(n52), .C0(n137), .Y(n108) );
  AOI221XLM U136 ( .A0(n8), .A1(n135), .B0(n97), .B1(n152), .C0(n53), .Y(n109)
         );
  INVX2M U137 ( .A(i_OP_B_alu[0]), .Y(n127) );
  INVX2M U138 ( .A(i_OP_B_alu[3]), .Y(n131) );
  INVX2M U139 ( .A(i_OP_B_alu[2]), .Y(n129) );
  AND3X2M U140 ( .A(n110), .B(i_ALU_FUN_alu[1]), .C(n116), .Y(n48) );
  AOI21X2M U141 ( .A0(n117), .A1(n118), .B0(i_ALU_FUN_alu[2]), .Y(n116) );
  NOR4X1M U142 ( .A(n7), .B(n6), .C(i_OP_B_alu[5]), .D(i_OP_B_alu[4]), .Y(n118) );
  NOR4X1M U143 ( .A(i_OP_B_alu[3]), .B(i_OP_B_alu[2]), .C(n5), .D(
        i_OP_B_alu[0]), .Y(n117) );
  BUFX2M U144 ( .A(i_ALU_FUN_alu[3]), .Y(n4) );
  NOR2X1M U145 ( .A(n146), .B(n7), .Y(n122) );
  NAND2BX1M U146 ( .AN(i_OP_B_alu[4]), .B(n12), .Y(n31) );
  NAND2BX1M U147 ( .AN(n12), .B(i_OP_B_alu[4]), .Y(n20) );
  CLKNAND2X2M U148 ( .A(n31), .B(n20), .Y(n33) );
  NOR2X1M U149 ( .A(n131), .B(n11), .Y(n28) );
  NOR2X1M U150 ( .A(n129), .B(n10), .Y(n19) );
  NOR2X1M U151 ( .A(n127), .B(n8), .Y(n16) );
  CLKNAND2X2M U152 ( .A(n10), .B(n129), .Y(n30) );
  NAND2BX1M U153 ( .AN(n19), .B(n30), .Y(n25) );
  AOI21X1M U154 ( .A0(n16), .A1(n126), .B0(n5), .Y(n17) );
  AOI211X1M U155 ( .A0(n9), .A1(n128), .B0(n25), .C0(n17), .Y(n18) );
  CLKNAND2X2M U156 ( .A(n11), .B(n131), .Y(n29) );
  OAI31X1M U157 ( .A0(n28), .A1(n19), .A2(n18), .B0(n29), .Y(n21) );
  NAND2BX1M U158 ( .AN(n13), .B(i_OP_B_alu[5]), .Y(n120) );
  OAI211X1M U159 ( .A0(n33), .A1(n21), .B0(n20), .C0(n120), .Y(n22) );
  NAND2BX1M U160 ( .AN(i_OP_B_alu[5]), .B(n13), .Y(n32) );
  XNOR2X1M U161 ( .A(n14), .B(n6), .Y(n119) );
  AOI32X1M U162 ( .A0(n22), .A1(n32), .A2(n119), .B0(n6), .B1(n147), .Y(n23)
         );
  CLKNAND2X2M U163 ( .A(n7), .B(n146), .Y(n123) );
  OAI21X1M U164 ( .A0(n122), .A1(n23), .B0(n123), .Y(N170) );
  CLKNAND2X2M U165 ( .A(n8), .B(n127), .Y(n26) );
  OA21X1M U166 ( .A0(n26), .A1(n126), .B0(n5), .Y(n24) );
  AOI211X1M U167 ( .A0(n26), .A1(n126), .B0(n25), .C0(n24), .Y(n27) );
  AOI31X1M U168 ( .A0(n130), .A1(n30), .A2(n29), .B0(n28), .Y(n34) );
  OAI2B11X1M U169 ( .A1N(n34), .A0(n33), .B0(n32), .C0(n31), .Y(n121) );
  AOI32X1M U170 ( .A0(n121), .A1(n120), .A2(n119), .B0(n14), .B1(n132), .Y(
        n124) );
  AOI2B1X1M U171 ( .A1N(n124), .A0(n123), .B0(n122), .Y(n125) );
  CLKINVX1M U172 ( .A(n125), .Y(N169) );
  NOR2X1M U173 ( .A(N170), .B(N169), .Y(N168) );
endmodule


module Sys_Ctrl_Unit_data_width8_Addr_Bits4 ( i_ref_clk, i_rst_n, i_ALU_OUT, 
        i_VALID_alu, i_Synced_Rx_D, i_Synced_RX_VLD, i_RdData, i_Valid, 
        i_fifo_f, o_Gated_clk_en, o_Alu_EN, o_ALU_FUN, o_TX_P_DATA, o_TX_D_VLD, 
        o_Addr, o_Wr_D, o_WrEn, o_RdEn, o_clk_div_en );
  input [15:0] i_ALU_OUT;
  input [7:0] i_Synced_Rx_D;
  input [7:0] i_RdData;
  output [3:0] o_ALU_FUN;
  output [7:0] o_TX_P_DATA;
  output [3:0] o_Addr;
  output [7:0] o_Wr_D;
  input i_ref_clk, i_rst_n, i_VALID_alu, i_Synced_RX_VLD, i_Valid, i_fifo_f;
  output o_Gated_clk_en, o_Alu_EN, o_TX_D_VLD, o_WrEn, o_RdEn, o_clk_div_en;
  wire   byte_counter, n14, n15, n16, n17, n18, n19, n20, n21, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n22, n23, n24, n25, n26, n27,
         n28, n29, n73, n102, n103, n104;
  wire   [3:0] current_s;
  wire   [3:0] next_s;
  wire   [15:0] Alu_out_store;

  DFFRQX2M \Alu_out_store_reg[15]  ( .D(n100), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(Alu_out_store[15]) );
  DFFRQX2M \Alu_out_store_reg[14]  ( .D(n99), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(Alu_out_store[14]) );
  DFFRQX2M \Alu_out_store_reg[13]  ( .D(n98), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(Alu_out_store[13]) );
  DFFRQX2M \Alu_out_store_reg[12]  ( .D(n97), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(Alu_out_store[12]) );
  DFFRQX2M \Alu_out_store_reg[11]  ( .D(n96), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(Alu_out_store[11]) );
  DFFRQX2M \Alu_out_store_reg[10]  ( .D(n95), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(Alu_out_store[10]) );
  DFFRQX2M \Alu_out_store_reg[9]  ( .D(n94), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[9]) );
  DFFRQX2M \Alu_out_store_reg[8]  ( .D(n93), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[8]) );
  DFFRQX2M \Alu_out_store_reg[7]  ( .D(n92), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[7]) );
  DFFRQX2M \Alu_out_store_reg[6]  ( .D(n91), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[6]) );
  DFFRQX2M \Alu_out_store_reg[5]  ( .D(n90), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[5]) );
  DFFRQX2M \Alu_out_store_reg[4]  ( .D(n89), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[4]) );
  DFFRQX2M \Alu_out_store_reg[3]  ( .D(n88), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[3]) );
  DFFRQX2M \Alu_out_store_reg[2]  ( .D(n87), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[2]) );
  DFFRQX2M \Alu_out_store_reg[1]  ( .D(n86), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[1]) );
  DFFRQX2M \Alu_out_store_reg[0]  ( .D(n85), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        Alu_out_store[0]) );
  DFFRQX2M byte_counter_reg ( .D(n101), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        byte_counter) );
  DFFRX1M \Wr_addr_store_reg[3]  ( .D(n80), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n18) );
  DFFRX1M \Wr_addr_store_reg[2]  ( .D(n79), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n19) );
  DFFRX1M \Alu_fun_store_reg[3]  ( .D(n84), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n14) );
  DFFRX1M \Alu_fun_store_reg[2]  ( .D(n83), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n15) );
  DFFRX1M \Alu_fun_store_reg[1]  ( .D(n82), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n16) );
  DFFRX1M \Alu_fun_store_reg[0]  ( .D(n81), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n17) );
  DFFRX1M \Wr_addr_store_reg[0]  ( .D(n77), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n21) );
  DFFRX1M \Wr_addr_store_reg[1]  ( .D(n78), .CK(i_ref_clk), .RN(i_rst_n), .QN(
        n20) );
  DFFRQX2M \current_s_reg[0]  ( .D(next_s[0]), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(current_s[0]) );
  DFFRQX2M \current_s_reg[3]  ( .D(next_s[3]), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(current_s[3]) );
  DFFRQX2M \current_s_reg[2]  ( .D(next_s[2]), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(current_s[2]) );
  DFFRQX2M \current_s_reg[1]  ( .D(next_s[1]), .CK(i_ref_clk), .RN(i_rst_n), 
        .Q(current_s[1]) );
  INVX2M U3 ( .A(1'b0), .Y(o_clk_div_en) );
  OAI222X1M U5 ( .A0(n26), .A1(n48), .B0(n47), .B1(n21), .C0(n8), .C1(n46), 
        .Y(o_Addr[0]) );
  AOI2B1X1M U6 ( .A1N(n30), .A0(n31), .B0(n26), .Y(o_WrEn) );
  OAI22X1M U7 ( .A0(n22), .A1(n46), .B0(n47), .B1(n18), .Y(o_Addr[3]) );
  OAI22X1M U8 ( .A0(n24), .A1(n46), .B0(n47), .B1(n20), .Y(o_Addr[1]) );
  NOR2X2M U9 ( .A(n50), .B(n15), .Y(o_ALU_FUN[2]) );
  NOR2X2M U10 ( .A(n50), .B(n17), .Y(o_ALU_FUN[0]) );
  OAI22X1M U11 ( .A0(n23), .A1(n46), .B0(n47), .B1(n19), .Y(o_Addr[2]) );
  NAND2X2M U12 ( .A(n56), .B(n50), .Y(o_Gated_clk_en) );
  INVX2M U13 ( .A(o_WrEn), .Y(n25) );
  INVX2M U14 ( .A(n50), .Y(o_Alu_EN) );
  INVX2M U15 ( .A(n56), .Y(n102) );
  NAND2X2M U16 ( .A(n75), .B(n63), .Y(n50) );
  NAND2X2M U17 ( .A(n75), .B(n69), .Y(n56) );
  NAND2X2M U18 ( .A(n49), .B(n48), .Y(n30) );
  NOR2X2M U19 ( .A(n55), .B(n6), .Y(n36) );
  NOR2X2M U20 ( .A(n25), .B(n8), .Y(o_Wr_D[0]) );
  NOR2X2M U21 ( .A(n25), .B(n24), .Y(o_Wr_D[1]) );
  NOR2X2M U22 ( .A(n25), .B(n23), .Y(o_Wr_D[2]) );
  NOR2X2M U23 ( .A(n25), .B(n22), .Y(o_Wr_D[3]) );
  NOR2X2M U24 ( .A(n25), .B(n13), .Y(o_Wr_D[4]) );
  NOR2X2M U25 ( .A(n25), .B(n12), .Y(o_Wr_D[6]) );
  NOR2X2M U26 ( .A(n25), .B(n11), .Y(o_Wr_D[7]) );
  NOR2X2M U27 ( .A(n45), .B(n6), .Y(n35) );
  AOI2BB1X2M U28 ( .A0N(n53), .A1N(n4), .B0(o_RdEn), .Y(n51) );
  AOI21X2M U29 ( .A0(n45), .A1(n55), .B0(n36), .Y(n53) );
  INVX2M U30 ( .A(n44), .Y(o_TX_D_VLD) );
  OAI31X1M U31 ( .A0(n36), .A1(n6), .A2(n35), .B0(n29), .Y(n44) );
  INVX2M U32 ( .A(n5), .Y(n29) );
  OR2X2M U33 ( .A(i_fifo_f), .B(n28), .Y(n45) );
  INVX2M U34 ( .A(n71), .Y(n7) );
  OAI31X1M U35 ( .A0(n62), .A1(n13), .A2(n8), .B0(n48), .Y(n71) );
  NAND4BX1M U36 ( .AN(o_Gated_clk_en), .B(n9), .C(n7), .D(n51), .Y(next_s[2])
         );
  BUFX2M U37 ( .A(n33), .Y(n5) );
  NAND2X2M U38 ( .A(n51), .B(n52), .Y(next_s[3]) );
  INVX2M U39 ( .A(n46), .Y(o_RdEn) );
  INVX2M U40 ( .A(n60), .Y(n10) );
  INVX2M U41 ( .A(n52), .Y(n73) );
  INVX2M U42 ( .A(n74), .Y(n27) );
  BUFX2M U43 ( .A(n33), .Y(n4) );
  NOR2X2M U44 ( .A(n104), .B(current_s[3]), .Y(n69) );
  NOR2X2M U45 ( .A(n103), .B(current_s[1]), .Y(n75) );
  NOR2X2M U46 ( .A(current_s[3]), .B(current_s[0]), .Y(n63) );
  INVX2M U47 ( .A(current_s[2]), .Y(n103) );
  INVX2M U48 ( .A(current_s[0]), .Y(n104) );
  NAND2X2M U49 ( .A(n54), .B(i_Synced_RX_VLD), .Y(n46) );
  AND3X2M U50 ( .A(n63), .B(n103), .C(current_s[1]), .Y(n54) );
  NAND3X2M U51 ( .A(current_s[1]), .B(n103), .C(n69), .Y(n49) );
  NAND2BX2M U52 ( .AN(n49), .B(i_Synced_RX_VLD), .Y(n47) );
  NAND3X2M U53 ( .A(current_s[2]), .B(current_s[1]), .C(n69), .Y(n48) );
  INVX2M U54 ( .A(i_Synced_RX_VLD), .Y(n26) );
  INVX2M U55 ( .A(i_Synced_Rx_D[1]), .Y(n24) );
  INVX2M U56 ( .A(i_Synced_Rx_D[0]), .Y(n8) );
  NOR4BX1M U57 ( .AN(n63), .B(n3), .C(current_s[1]), .D(current_s[2]), .Y(n70)
         );
  OR3X2M U58 ( .A(n22), .B(n26), .C(n11), .Y(n3) );
  NOR2X2M U59 ( .A(n50), .B(n16), .Y(o_ALU_FUN[1]) );
  NOR2X2M U60 ( .A(n43), .B(n4), .Y(o_TX_P_DATA[0]) );
  AOI222X1M U61 ( .A0(i_RdData[0]), .A1(n6), .B0(Alu_out_store[8]), .B1(n35), 
        .C0(Alu_out_store[0]), .C1(n36), .Y(n43) );
  NOR2X2M U62 ( .A(n42), .B(n5), .Y(o_TX_P_DATA[1]) );
  AOI222X1M U63 ( .A0(i_RdData[1]), .A1(n6), .B0(Alu_out_store[9]), .B1(n35), 
        .C0(Alu_out_store[1]), .C1(n36), .Y(n42) );
  NOR2X2M U64 ( .A(n41), .B(n4), .Y(o_TX_P_DATA[2]) );
  AOI222X1M U65 ( .A0(i_RdData[2]), .A1(n6), .B0(Alu_out_store[10]), .B1(n35), 
        .C0(Alu_out_store[2]), .C1(n36), .Y(n41) );
  NOR2X2M U66 ( .A(n40), .B(n5), .Y(o_TX_P_DATA[3]) );
  AOI222X1M U67 ( .A0(i_RdData[3]), .A1(n6), .B0(Alu_out_store[11]), .B1(n35), 
        .C0(Alu_out_store[3]), .C1(n36), .Y(n40) );
  NOR2X2M U68 ( .A(n39), .B(n4), .Y(o_TX_P_DATA[4]) );
  AOI222X1M U69 ( .A0(i_RdData[4]), .A1(n6), .B0(Alu_out_store[12]), .B1(n35), 
        .C0(Alu_out_store[4]), .C1(n36), .Y(n39) );
  NOR2X2M U70 ( .A(n38), .B(n5), .Y(o_TX_P_DATA[5]) );
  AOI222X1M U71 ( .A0(i_RdData[5]), .A1(n6), .B0(Alu_out_store[13]), .B1(n35), 
        .C0(Alu_out_store[5]), .C1(n36), .Y(n38) );
  NOR2X2M U72 ( .A(n37), .B(n4), .Y(o_TX_P_DATA[6]) );
  AOI222X1M U73 ( .A0(i_RdData[6]), .A1(n6), .B0(Alu_out_store[14]), .B1(n35), 
        .C0(Alu_out_store[6]), .C1(n36), .Y(n37) );
  NOR2X2M U74 ( .A(n32), .B(n5), .Y(o_TX_P_DATA[7]) );
  AOI222X1M U75 ( .A0(i_RdData[7]), .A1(n6), .B0(Alu_out_store[15]), .B1(n35), 
        .C0(Alu_out_store[7]), .C1(n36), .Y(n32) );
  OAI211X2M U76 ( .A0(n26), .A1(n31), .B0(n7), .C0(n64), .Y(next_s[0]) );
  AOI211X2M U77 ( .A0(n65), .A1(n66), .B0(n67), .C0(n68), .Y(n64) );
  NOR3X2M U78 ( .A(i_Synced_Rx_D[2]), .B(i_Synced_Rx_D[6]), .C(
        i_Synced_Rx_D[4]), .Y(n66) );
  AOI21X2M U79 ( .A0(n49), .A1(n56), .B0(i_Synced_RX_VLD), .Y(n67) );
  OAI211X2M U80 ( .A0(i_Synced_RX_VLD), .A1(n57), .B0(n9), .C0(n58), .Y(
        next_s[1]) );
  NOR2X2M U81 ( .A(n54), .B(n30), .Y(n57) );
  AOI31X2M U82 ( .A0(n10), .A1(i_Synced_Rx_D[0]), .A2(n59), .B0(n27), .Y(n58)
         );
  NOR3X2M U83 ( .A(n13), .B(i_Synced_Rx_D[6]), .C(i_Synced_Rx_D[2]), .Y(n59)
         );
  NAND3X2M U84 ( .A(i_Synced_Rx_D[1]), .B(i_Synced_Rx_D[5]), .C(n70), .Y(n60)
         );
  NAND3X2M U85 ( .A(n70), .B(i_Synced_Rx_D[2]), .C(n72), .Y(n62) );
  NOR3X2M U86 ( .A(n12), .B(i_Synced_Rx_D[5]), .C(i_Synced_Rx_D[1]), .Y(n72)
         );
  NAND3X2M U87 ( .A(current_s[1]), .B(n63), .C(current_s[2]), .Y(n31) );
  NAND3X2M U88 ( .A(n75), .B(n104), .C(current_s[3]), .Y(n33) );
  AND2X2M U89 ( .A(i_Synced_Rx_D[5]), .B(o_WrEn), .Y(o_Wr_D[5]) );
  INVX2M U90 ( .A(i_Synced_Rx_D[2]), .Y(n23) );
  INVX2M U91 ( .A(n61), .Y(n9) );
  OAI31X1M U92 ( .A0(n62), .A1(i_Synced_Rx_D[4]), .A2(i_Synced_Rx_D[0]), .B0(
        n31), .Y(n61) );
  INVX2M U93 ( .A(i_Synced_Rx_D[3]), .Y(n22) );
  OR2X2M U94 ( .A(i_fifo_f), .B(byte_counter), .Y(n55) );
  NOR2X2M U95 ( .A(i_Synced_Rx_D[0]), .B(n60), .Y(n65) );
  NOR2X2M U96 ( .A(n50), .B(n14), .Y(o_ALU_FUN[3]) );
  BUFX2M U97 ( .A(n34), .Y(n6) );
  NOR2BX2M U98 ( .AN(i_Valid), .B(i_fifo_f), .Y(n34) );
  INVX2M U99 ( .A(i_Synced_Rx_D[7]), .Y(n11) );
  INVX2M U100 ( .A(byte_counter), .Y(n28) );
  NOR3BX2M U101 ( .AN(n69), .B(current_s[1]), .C(current_s[2]), .Y(n68) );
  OAI32X1M U102 ( .A0(n5), .A1(i_Valid), .A2(n55), .B0(n76), .B1(n28), .Y(n101) );
  NOR3X2M U103 ( .A(n4), .B(i_Valid), .C(n45), .Y(n76) );
  NAND2X2M U104 ( .A(i_VALID_alu), .B(o_Alu_EN), .Y(n52) );
  NAND2X2M U105 ( .A(n68), .B(i_Synced_RX_VLD), .Y(n74) );
  OAI22X1M U106 ( .A0(n102), .A1(n17), .B0(n8), .B1(n56), .Y(n81) );
  OAI22X1M U107 ( .A0(n102), .A1(n16), .B0(n24), .B1(n56), .Y(n82) );
  OAI22X1M U108 ( .A0(n102), .A1(n15), .B0(n23), .B1(n56), .Y(n83) );
  OAI22X1M U109 ( .A0(n102), .A1(n14), .B0(n22), .B1(n56), .Y(n84) );
  OAI22X1M U110 ( .A0(n8), .A1(n74), .B0(n27), .B1(n21), .Y(n77) );
  OAI22X1M U111 ( .A0(n24), .A1(n74), .B0(n27), .B1(n20), .Y(n78) );
  OAI22X1M U112 ( .A0(n23), .A1(n74), .B0(n27), .B1(n19), .Y(n79) );
  OAI22X1M U113 ( .A0(n22), .A1(n74), .B0(n27), .B1(n18), .Y(n80) );
  INVX2M U114 ( .A(i_Synced_Rx_D[6]), .Y(n12) );
  INVX2M U115 ( .A(i_Synced_Rx_D[4]), .Y(n13) );
  AO22X1M U116 ( .A0(n52), .A1(Alu_out_store[0]), .B0(i_ALU_OUT[0]), .B1(n73), 
        .Y(n85) );
  AO22X1M U117 ( .A0(n52), .A1(Alu_out_store[1]), .B0(i_ALU_OUT[1]), .B1(n73), 
        .Y(n86) );
  AO22X1M U118 ( .A0(n52), .A1(Alu_out_store[2]), .B0(i_ALU_OUT[2]), .B1(n73), 
        .Y(n87) );
  AO22X1M U119 ( .A0(n52), .A1(Alu_out_store[3]), .B0(i_ALU_OUT[3]), .B1(n73), 
        .Y(n88) );
  AO22X1M U120 ( .A0(n52), .A1(Alu_out_store[4]), .B0(i_ALU_OUT[4]), .B1(n73), 
        .Y(n89) );
  AO22X1M U121 ( .A0(n52), .A1(Alu_out_store[5]), .B0(i_ALU_OUT[5]), .B1(n73), 
        .Y(n90) );
  AO22X1M U122 ( .A0(n52), .A1(Alu_out_store[6]), .B0(i_ALU_OUT[6]), .B1(n73), 
        .Y(n91) );
  AO22X1M U123 ( .A0(n52), .A1(Alu_out_store[7]), .B0(i_ALU_OUT[7]), .B1(n73), 
        .Y(n92) );
  AO22X1M U124 ( .A0(n52), .A1(Alu_out_store[8]), .B0(i_ALU_OUT[8]), .B1(n73), 
        .Y(n93) );
  AO22X1M U125 ( .A0(n52), .A1(Alu_out_store[9]), .B0(i_ALU_OUT[9]), .B1(n73), 
        .Y(n94) );
  AO22X1M U126 ( .A0(n52), .A1(Alu_out_store[10]), .B0(i_ALU_OUT[10]), .B1(n73), .Y(n95) );
  AO22X1M U127 ( .A0(n52), .A1(Alu_out_store[11]), .B0(i_ALU_OUT[11]), .B1(n73), .Y(n96) );
  AO22X1M U128 ( .A0(n52), .A1(Alu_out_store[12]), .B0(i_ALU_OUT[12]), .B1(n73), .Y(n97) );
  AO22X1M U129 ( .A0(n52), .A1(Alu_out_store[13]), .B0(i_ALU_OUT[13]), .B1(n73), .Y(n98) );
  AO22X1M U130 ( .A0(n52), .A1(Alu_out_store[14]), .B0(i_ALU_OUT[14]), .B1(n73), .Y(n99) );
  AO22X1M U131 ( .A0(n52), .A1(Alu_out_store[15]), .B0(i_ALU_OUT[15]), .B1(n73), .Y(n100) );
endmodule


module rst_sync_unit_Num_stg2_1 ( i_clk, i_rst_n_Async, o_rst_n_Sync );
  input i_clk, i_rst_n_Async;
  output o_rst_n_Sync;
  wire   \Sync_reg[0] ;

  DFFRQX2M \Sync_reg_reg[1]  ( .D(\Sync_reg[0] ), .CK(i_clk), .RN(
        i_rst_n_Async), .Q(o_rst_n_Sync) );
  DFFRQX2M \Sync_reg_reg[0]  ( .D(1'b1), .CK(i_clk), .RN(i_rst_n_Async), .Q(
        \Sync_reg[0] ) );
endmodule


module CLK_Div_mux_prescale_bits6 ( i_config_prescale, o_config_prescale );
  input [5:0] i_config_prescale;
  output [7:0] o_config_prescale;
  wire   n4, n5, n6, n7, n8, n10, n11, n12;

  INVX2M U3 ( .A(1'b1), .Y(o_config_prescale[7]) );
  INVX2M U5 ( .A(1'b1), .Y(o_config_prescale[6]) );
  NOR3BX2M U7 ( .AN(n8), .B(i_config_prescale[4]), .C(n10), .Y(
        o_config_prescale[2]) );
  NOR4X1M U8 ( .A(n11), .B(n7), .C(i_config_prescale[0]), .D(
        i_config_prescale[1]), .Y(o_config_prescale[3]) );
  NOR4X1M U9 ( .A(n12), .B(n7), .C(i_config_prescale[0]), .D(
        i_config_prescale[2]), .Y(o_config_prescale[4]) );
  NOR4X1M U10 ( .A(i_config_prescale[0]), .B(i_config_prescale[1]), .C(
        i_config_prescale[2]), .D(i_config_prescale[5]), .Y(n8) );
  NOR4X1M U11 ( .A(n4), .B(i_config_prescale[3]), .C(i_config_prescale[5]), 
        .D(i_config_prescale[4]), .Y(o_config_prescale[5]) );
  NAND3X2M U12 ( .A(n12), .B(n11), .C(i_config_prescale[0]), .Y(n4) );
  NOR3X2M U13 ( .A(n5), .B(o_config_prescale[1]), .C(n6), .Y(
        o_config_prescale[0]) );
  OR3X2M U14 ( .A(o_config_prescale[3]), .B(o_config_prescale[4]), .C(
        o_config_prescale[2]), .Y(n5) );
  NOR4BX1M U15 ( .AN(i_config_prescale[0]), .B(i_config_prescale[2]), .C(
        i_config_prescale[1]), .D(n7), .Y(n6) );
  AND3X2M U16 ( .A(n8), .B(n10), .C(i_config_prescale[4]), .Y(
        o_config_prescale[1]) );
  OR3X2M U17 ( .A(i_config_prescale[4]), .B(i_config_prescale[5]), .C(
        i_config_prescale[3]), .Y(n7) );
  INVX2M U18 ( .A(i_config_prescale[2]), .Y(n11) );
  INVX2M U19 ( .A(i_config_prescale[1]), .Y(n12) );
  INVX2M U20 ( .A(i_config_prescale[3]), .Y(n10) );
endmodule


module CLK_Div_Unit_max_div_ratio256_div_bits8_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_Div_Unit_max_div_ratio256_div_bits8_0 ( i_ref_clk, i_rst_n, 
        i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk, toggle_flag, N12, N13, N14, N15, N16, N17, N18, N19, N51,
         N52, N53, N54, N55, N56, N57, N58, N67, N68, N69, N70, N71, N72, N73,
         N74, n29, n30, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;
  wire   [7:0] clk_counter;

  CLK_Div_Unit_max_div_ratio256_div_bits8_0_DW01_inc_0 add_84 ( .A(clk_counter), .SUM({N58, N57, N56, N55, N54, N53, N52, N51}) );
  DFFRQX2M div_clk_reg ( .D(n30), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFRQX2M \clk_counter_reg[7]  ( .D(N74), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[7]) );
  DFFRQX2M toggle_flag_reg ( .D(n29), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        toggle_flag) );
  DFFRQX2M \clk_counter_reg[0]  ( .D(N67), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[0]) );
  DFFRQX2M \clk_counter_reg[2]  ( .D(N69), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[2]) );
  DFFRQX2M \clk_counter_reg[6]  ( .D(N73), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[6]) );
  DFFRQX2M \clk_counter_reg[5]  ( .D(N72), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[5]) );
  DFFRQX2M \clk_counter_reg[4]  ( .D(N71), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[4]) );
  DFFRQX2M \clk_counter_reg[3]  ( .D(N70), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[3]) );
  DFFRQX2M \clk_counter_reg[1]  ( .D(N68), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[1]) );
  MX2X2M U3 ( .A(div_clk), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  NAND3X2M U4 ( .A(n15), .B(n14), .C(n8), .Y(n7) );
  OR2X2M U5 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  CLKINVX1M U6 ( .A(i_div_ratio[1]), .Y(N12) );
  OAI2BB1X1M U7 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(N13)
         );
  OR2X1M U8 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U9 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(N14) );
  OR2X1M U10 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U11 ( .A0N(n2), .A1N(i_div_ratio[4]), .B0(n3), .Y(N15) );
  OR2X1M U12 ( .A(n3), .B(i_div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U13 ( .A0N(n3), .A1N(i_div_ratio[5]), .B0(n4), .Y(N16) );
  XNOR2X1M U14 ( .A(i_div_ratio[6]), .B(n4), .Y(N17) );
  NOR3X1M U15 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n4), .Y(N19) );
  OAI21X1M U16 ( .A0(i_div_ratio[6]), .A1(n4), .B0(i_div_ratio[7]), .Y(n5) );
  NAND2BX1M U17 ( .AN(N19), .B(n5), .Y(N18) );
  MXI2X1M U18 ( .A(n6), .B(n7), .S0(div_clk), .Y(n30) );
  CLKNAND2X2M U19 ( .A(n8), .B(n7), .Y(n6) );
  MXI2X1M U20 ( .A(n9), .B(n10), .S0(toggle_flag), .Y(n29) );
  CLKNAND2X2M U21 ( .A(n8), .B(n10), .Y(n9) );
  CLKNAND2X2M U22 ( .A(n11), .B(n8), .Y(n10) );
  AOI31X1M U23 ( .A0(n12), .A1(i_div_ratio[0]), .A2(toggle_flag), .B0(n13), 
        .Y(n11) );
  CLKINVX1M U24 ( .A(n14), .Y(n13) );
  NOR2BX1M U25 ( .AN(N58), .B(n7), .Y(N74) );
  NOR2BX1M U26 ( .AN(N57), .B(n7), .Y(N73) );
  NOR2BX1M U27 ( .AN(N56), .B(n7), .Y(N72) );
  NOR2BX1M U28 ( .AN(N55), .B(n7), .Y(N71) );
  NOR2BX1M U29 ( .AN(N54), .B(n7), .Y(N70) );
  NOR2BX1M U30 ( .AN(N53), .B(n7), .Y(N69) );
  NOR2BX1M U31 ( .AN(N52), .B(n7), .Y(N68) );
  NOR2BX1M U32 ( .AN(N51), .B(n7), .Y(N67) );
  NOR2X1M U33 ( .A(n16), .B(n17), .Y(n8) );
  NAND4X1M U34 ( .A(n18), .B(n19), .C(n20), .D(n21), .Y(n14) );
  NOR3X1M U35 ( .A(n22), .B(n23), .C(n24), .Y(n21) );
  CLKXOR2X2M U36 ( .A(i_div_ratio[2]), .B(clk_counter[1]), .Y(n24) );
  CLKXOR2X2M U37 ( .A(i_div_ratio[1]), .B(clk_counter[0]), .Y(n23) );
  NAND3BX1M U38 ( .AN(clk_counter[7]), .B(n25), .C(i_div_ratio[0]), .Y(n22) );
  NOR3X1M U39 ( .A(n26), .B(n27), .C(n28), .Y(n20) );
  CLKXOR2X2M U40 ( .A(i_div_ratio[3]), .B(clk_counter[2]), .Y(n28) );
  CLKXOR2X2M U41 ( .A(i_div_ratio[5]), .B(clk_counter[4]), .Y(n27) );
  CLKXOR2X2M U42 ( .A(i_div_ratio[4]), .B(clk_counter[3]), .Y(n26) );
  XNOR2X1M U43 ( .A(clk_counter[5]), .B(i_div_ratio[6]), .Y(n19) );
  XNOR2X1M U44 ( .A(clk_counter[6]), .B(i_div_ratio[7]), .Y(n18) );
  OAI2BB1X1M U45 ( .A0N(n25), .A1N(i_div_ratio[0]), .B0(n12), .Y(n15) );
  AND4X1M U46 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n12) );
  NOR4X1M U47 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n34) );
  CLKXOR2X2M U48 ( .A(clk_counter[6]), .B(N18), .Y(n38) );
  CLKXOR2X2M U49 ( .A(clk_counter[5]), .B(N17), .Y(n37) );
  CLKXOR2X2M U50 ( .A(clk_counter[4]), .B(N16), .Y(n36) );
  CLKXOR2X2M U51 ( .A(clk_counter[1]), .B(N13), .Y(n35) );
  NOR3X1M U52 ( .A(n39), .B(clk_counter[7]), .C(N19), .Y(n33) );
  CLKXOR2X2M U53 ( .A(clk_counter[3]), .B(N15), .Y(n39) );
  XNOR2X1M U54 ( .A(clk_counter[2]), .B(N14), .Y(n32) );
  XNOR2X1M U55 ( .A(clk_counter[0]), .B(N12), .Y(n31) );
  CLKINVX1M U56 ( .A(toggle_flag), .Y(n25) );
  AOI21BX1M U57 ( .A0(i_div_ratio[0]), .A1(n16), .B0N(n17), .Y(N0) );
  NOR4BX1M U58 ( .AN(n40), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n17) );
  NOR4X1M U59 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n40) );
  CLKINVX1M U60 ( .A(i_clk_en), .Y(n16) );
endmodule


module CLK_Div_Unit_max_div_ratio256_div_bits8_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_Div_Unit_max_div_ratio256_div_bits8_1 ( i_ref_clk, i_rst_n, 
        i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk, toggle_flag, N12, N13, N14, N15, N16, N17, N18, N19, N51,
         N52, N53, N54, N55, N56, N57, N58, N67, N68, N69, N70, N71, N72, N73,
         N74, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [7:0] clk_counter;

  CLK_Div_Unit_max_div_ratio256_div_bits8_1_DW01_inc_0 add_84 ( .A(clk_counter), .SUM({N58, N57, N56, N55, N54, N53, N52, N51}) );
  DFFRQX2M div_clk_reg ( .D(n41), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFRQX2M \clk_counter_reg[7]  ( .D(N74), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[7]) );
  DFFRQX2M toggle_flag_reg ( .D(n42), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        toggle_flag) );
  DFFRQX2M \clk_counter_reg[0]  ( .D(N67), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[0]) );
  DFFRQX2M \clk_counter_reg[2]  ( .D(N69), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[2]) );
  DFFRQX2M \clk_counter_reg[6]  ( .D(N73), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[6]) );
  DFFRQX2M \clk_counter_reg[5]  ( .D(N72), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[5]) );
  DFFRQX2M \clk_counter_reg[4]  ( .D(N71), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[4]) );
  DFFRQX2M \clk_counter_reg[3]  ( .D(N70), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[3]) );
  DFFRQX2M \clk_counter_reg[1]  ( .D(N68), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        clk_counter[1]) );
  MX2X2M U3 ( .A(div_clk), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  NAND3X2M U4 ( .A(n15), .B(n14), .C(n8), .Y(n7) );
  OR2X2M U5 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  CLKINVX1M U6 ( .A(i_div_ratio[1]), .Y(N12) );
  OAI2BB1X1M U7 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(N13)
         );
  OR2X1M U8 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U9 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(N14) );
  OR2X1M U10 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U11 ( .A0N(n2), .A1N(i_div_ratio[4]), .B0(n3), .Y(N15) );
  OR2X1M U12 ( .A(n3), .B(i_div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U13 ( .A0N(n3), .A1N(i_div_ratio[5]), .B0(n4), .Y(N16) );
  XNOR2X1M U14 ( .A(i_div_ratio[6]), .B(n4), .Y(N17) );
  NOR3X1M U15 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n4), .Y(N19) );
  OAI21X1M U16 ( .A0(i_div_ratio[6]), .A1(n4), .B0(i_div_ratio[7]), .Y(n5) );
  NAND2BX1M U17 ( .AN(N19), .B(n5), .Y(N18) );
  MXI2X1M U18 ( .A(n6), .B(n7), .S0(div_clk), .Y(n41) );
  CLKNAND2X2M U19 ( .A(n8), .B(n7), .Y(n6) );
  MXI2X1M U20 ( .A(n9), .B(n10), .S0(toggle_flag), .Y(n42) );
  CLKNAND2X2M U21 ( .A(n8), .B(n10), .Y(n9) );
  CLKNAND2X2M U22 ( .A(n11), .B(n8), .Y(n10) );
  AOI31X1M U23 ( .A0(n12), .A1(i_div_ratio[0]), .A2(toggle_flag), .B0(n13), 
        .Y(n11) );
  CLKINVX1M U24 ( .A(n14), .Y(n13) );
  NOR2BX1M U25 ( .AN(N58), .B(n7), .Y(N74) );
  NOR2BX1M U26 ( .AN(N57), .B(n7), .Y(N73) );
  NOR2BX1M U27 ( .AN(N56), .B(n7), .Y(N72) );
  NOR2BX1M U28 ( .AN(N55), .B(n7), .Y(N71) );
  NOR2BX1M U29 ( .AN(N54), .B(n7), .Y(N70) );
  NOR2BX1M U30 ( .AN(N53), .B(n7), .Y(N69) );
  NOR2BX1M U31 ( .AN(N52), .B(n7), .Y(N68) );
  NOR2BX1M U32 ( .AN(N51), .B(n7), .Y(N67) );
  NOR2X1M U33 ( .A(n16), .B(n17), .Y(n8) );
  NAND4X1M U34 ( .A(n18), .B(n19), .C(n20), .D(n21), .Y(n14) );
  NOR3X1M U35 ( .A(n22), .B(n23), .C(n24), .Y(n21) );
  CLKXOR2X2M U36 ( .A(i_div_ratio[2]), .B(clk_counter[1]), .Y(n24) );
  CLKXOR2X2M U37 ( .A(i_div_ratio[1]), .B(clk_counter[0]), .Y(n23) );
  NAND3BX1M U38 ( .AN(clk_counter[7]), .B(n25), .C(i_div_ratio[0]), .Y(n22) );
  NOR3X1M U39 ( .A(n26), .B(n27), .C(n28), .Y(n20) );
  CLKXOR2X2M U40 ( .A(i_div_ratio[3]), .B(clk_counter[2]), .Y(n28) );
  CLKXOR2X2M U41 ( .A(i_div_ratio[5]), .B(clk_counter[4]), .Y(n27) );
  CLKXOR2X2M U42 ( .A(i_div_ratio[4]), .B(clk_counter[3]), .Y(n26) );
  XNOR2X1M U43 ( .A(clk_counter[5]), .B(i_div_ratio[6]), .Y(n19) );
  XNOR2X1M U44 ( .A(clk_counter[6]), .B(i_div_ratio[7]), .Y(n18) );
  OAI2BB1X1M U45 ( .A0N(n25), .A1N(i_div_ratio[0]), .B0(n12), .Y(n15) );
  AND4X1M U46 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n12) );
  NOR4X1M U47 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n34) );
  CLKXOR2X2M U48 ( .A(clk_counter[6]), .B(N18), .Y(n38) );
  CLKXOR2X2M U49 ( .A(clk_counter[5]), .B(N17), .Y(n37) );
  CLKXOR2X2M U50 ( .A(clk_counter[4]), .B(N16), .Y(n36) );
  CLKXOR2X2M U51 ( .A(clk_counter[1]), .B(N13), .Y(n35) );
  NOR3X1M U52 ( .A(n39), .B(clk_counter[7]), .C(N19), .Y(n33) );
  CLKXOR2X2M U53 ( .A(clk_counter[3]), .B(N15), .Y(n39) );
  XNOR2X1M U54 ( .A(clk_counter[2]), .B(N14), .Y(n32) );
  XNOR2X1M U55 ( .A(clk_counter[0]), .B(N12), .Y(n31) );
  CLKINVX1M U56 ( .A(toggle_flag), .Y(n25) );
  AOI21BX1M U57 ( .A0(i_div_ratio[0]), .A1(n16), .B0N(n17), .Y(N0) );
  NOR4BX1M U58 ( .AN(n40), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n17) );
  NOR4X1M U59 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n40) );
  CLKINVX1M U60 ( .A(i_clk_en), .Y(n16) );
endmodule


module pulse_gen_unit ( i_clk_PG, i_rst_n_PG, i_lvl_sig_PG, o_pulse_sig_PG );
  input i_clk_PG, i_rst_n_PG, i_lvl_sig_PG;
  output o_pulse_sig_PG;
  wire   pulse_gen_ff;

  DFFRQX2M pulse_gen_ff_reg ( .D(i_lvl_sig_PG), .CK(i_clk_PG), .RN(i_rst_n_PG), 
        .Q(pulse_gen_ff) );
  NOR2BX2M U3 ( .AN(i_lvl_sig_PG), .B(pulse_gen_ff), .Y(o_pulse_sig_PG) );
endmodule


module MUX ( i_mux_sel_M, i_start_bit_M, i_stop_bit_M, i_ser_data_M, 
        i_par_bit_M, o_TX_OUT_M );
  input [1:0] i_mux_sel_M;
  input i_start_bit_M, i_stop_bit_M, i_ser_data_M, i_par_bit_M;
  output o_TX_OUT_M;
  wire   n2, n3, n1;

  OAI2B2X4M U1 ( .A1N(i_mux_sel_M[1]), .A0(n2), .B0(i_mux_sel_M[1]), .B1(n3), 
        .Y(o_TX_OUT_M) );
  AOI22X1M U2 ( .A0(i_start_bit_M), .A1(n1), .B0(i_stop_bit_M), .B1(
        i_mux_sel_M[0]), .Y(n3) );
  AOI22X1M U3 ( .A0(i_ser_data_M), .A1(n1), .B0(i_par_bit_M), .B1(
        i_mux_sel_M[0]), .Y(n2) );
  INVX2M U4 ( .A(i_mux_sel_M[0]), .Y(n1) );
endmodule


module Control_unit_FSM ( i_clk_fsm, i_rst_n_fsm, i_Data_Valid_fsm, 
        i_ser_done_fsm, i_PAR_EN_fsm, o_ser_en_fsm, o_busy_fsm, o_mux_sel_fsm
 );
  output [1:0] o_mux_sel_fsm;
  input i_clk_fsm, i_rst_n_fsm, i_Data_Valid_fsm, i_ser_done_fsm, i_PAR_EN_fsm;
  output o_ser_en_fsm, o_busy_fsm;
  wire   n6, n7, n8, n9, n1, n2, n3, n4, n5;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(current_state[0]) );
  NAND2X2M U3 ( .A(n6), .B(n8), .Y(o_mux_sel_fsm[1]) );
  OAI211X2M U4 ( .A0(i_ser_done_fsm), .A1(n6), .B0(n9), .C0(n7), .Y(
        next_state[0]) );
  NAND3X2M U5 ( .A(n5), .B(n4), .C(i_Data_Valid_fsm), .Y(n9) );
  INVX2M U6 ( .A(n6), .Y(o_ser_en_fsm) );
  NAND3X2M U7 ( .A(current_state[0]), .B(n4), .C(current_state[1]), .Y(n6) );
  INVX2M U8 ( .A(current_state[2]), .Y(n4) );
  NAND2X2M U9 ( .A(current_state[0]), .B(n4), .Y(o_mux_sel_fsm[0]) );
  NAND3X2M U10 ( .A(n3), .B(n4), .C(current_state[1]), .Y(n8) );
  INVX2M U11 ( .A(current_state[0]), .Y(n3) );
  OAI211X2M U12 ( .A0(current_state[0]), .A1(n5), .B0(n7), .C0(n2), .Y(
        o_busy_fsm) );
  INVX2M U13 ( .A(o_mux_sel_fsm[1]), .Y(n2) );
  NAND3X2M U14 ( .A(n5), .B(n4), .C(current_state[0]), .Y(n7) );
  INVX2M U15 ( .A(current_state[1]), .Y(n5) );
  OAI31X1M U16 ( .A0(n1), .A1(i_PAR_EN_fsm), .A2(n6), .B0(n8), .Y(
        next_state[2]) );
  INVX2M U17 ( .A(i_ser_done_fsm), .Y(n1) );
  AOI21X2M U18 ( .A0(n3), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
endmodule


module Parity_Calc_data_width8 ( i_clk_par, i_rst_n_par, i_P_Data_par, 
        i_PAR_TYP_par, i_Data_Valid_par, i_busy_par, o_PAR_Bit_par );
  input [7:0] i_P_Data_par;
  input i_clk_par, i_rst_n_par, i_PAR_TYP_par, i_Data_Valid_par, i_busy_par;
  output o_PAR_Bit_par;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M o_PAR_Bit_par_reg ( .D(n7), .CK(i_clk_par), .RN(i_rst_n_par), .Q(
        o_PAR_Bit_par) );
  XOR3XLM U2 ( .A(i_P_Data_par[5]), .B(i_P_Data_par[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U3 ( .A(i_P_Data_par[7]), .B(i_P_Data_par[6]), .Y(n6) );
  XNOR2X2M U4 ( .A(i_P_Data_par[3]), .B(i_P_Data_par[2]), .Y(n5) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(o_PAR_Bit_par), .A1N(n2), .Y(n7) );
  NAND2BX2M U6 ( .AN(i_busy_par), .B(i_Data_Valid_par), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(i_PAR_TYP_par), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(i_P_Data_par[1]), .B(i_P_Data_par[0]), .C(n5), .Y(n4) );
endmodule


module serializer_unit_data_width8 ( i_clk_ser, i_rst_n_ser, i_P_Data_ser, 
        i_SER_EN_ser, i_Data_Valid_ser, i_busy_ser, o_ser_done_ser, 
        o_ser_data_ser );
  input [7:0] i_P_Data_ser;
  input i_clk_ser, i_rst_n_ser, i_SER_EN_ser, i_Data_Valid_ser, i_busy_ser;
  output o_ser_done_ser, o_ser_data_ser;
  wire   \counter[1] , n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n2;
  wire   [7:1] SERIALIZER_Reg_F;

  DFFRQX2M \SERIALIZER_Reg_F_reg[6]  ( .D(n19), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[6]) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[5]  ( .D(n20), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[5]) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[4]  ( .D(n21), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[4]) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[3]  ( .D(n22), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[3]) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[2]  ( .D(n23), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[2]) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[1]  ( .D(n24), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[1]) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[7]  ( .D(n18), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(SERIALIZER_Reg_F[7]) );
  DFFRQX2M \counter_reg[1]  ( .D(n26), .CK(i_clk_ser), .RN(i_rst_n_ser), .Q(
        \counter[1] ) );
  DFFRX1M \counter_reg[2]  ( .D(n27), .CK(i_clk_ser), .RN(i_rst_n_ser), .QN(n1) );
  DFFRX1M \counter_reg[0]  ( .D(n28), .CK(i_clk_ser), .RN(i_rst_n_ser), .QN(n3) );
  DFFRQX2M \SERIALIZER_Reg_F_reg[0]  ( .D(n25), .CK(i_clk_ser), .RN(
        i_rst_n_ser), .Q(o_ser_data_ser) );
  NOR3X2M U3 ( .A(n2), .B(n3), .C(n1), .Y(o_ser_done_ser) );
  NOR2X2M U4 ( .A(n14), .B(n5), .Y(n7) );
  NOR2X2M U5 ( .A(n5), .B(n7), .Y(n4) );
  NOR2BX2M U6 ( .AN(i_Data_Valid_ser), .B(i_busy_ser), .Y(n5) );
  NOR2X2M U7 ( .A(i_SER_EN_ser), .B(o_ser_done_ser), .Y(n15) );
  NAND2BX2M U8 ( .AN(o_ser_done_ser), .B(i_SER_EN_ser), .Y(n14) );
  OAI2BB1X2M U9 ( .A0N(n4), .A1N(SERIALIZER_Reg_F[6]), .B0(n6), .Y(n19) );
  AOI22X1M U10 ( .A0(n7), .A1(SERIALIZER_Reg_F[7]), .B0(i_P_Data_ser[6]), .B1(
        n5), .Y(n6) );
  OAI2BB1X2M U11 ( .A0N(o_ser_data_ser), .A1N(n4), .B0(n13), .Y(n25) );
  AOI22X1M U12 ( .A0(SERIALIZER_Reg_F[1]), .A1(n7), .B0(i_P_Data_ser[0]), .B1(
        n5), .Y(n13) );
  OAI2BB1X2M U13 ( .A0N(n4), .A1N(SERIALIZER_Reg_F[1]), .B0(n12), .Y(n24) );
  AOI22X1M U14 ( .A0(SERIALIZER_Reg_F[2]), .A1(n7), .B0(i_P_Data_ser[1]), .B1(
        n5), .Y(n12) );
  OAI2BB1X2M U15 ( .A0N(n4), .A1N(SERIALIZER_Reg_F[2]), .B0(n11), .Y(n23) );
  AOI22X1M U16 ( .A0(SERIALIZER_Reg_F[3]), .A1(n7), .B0(i_P_Data_ser[2]), .B1(
        n5), .Y(n11) );
  OAI2BB1X2M U17 ( .A0N(n4), .A1N(SERIALIZER_Reg_F[3]), .B0(n10), .Y(n22) );
  AOI22X1M U18 ( .A0(SERIALIZER_Reg_F[4]), .A1(n7), .B0(i_P_Data_ser[3]), .B1(
        n5), .Y(n10) );
  OAI2BB1X2M U19 ( .A0N(n4), .A1N(SERIALIZER_Reg_F[4]), .B0(n9), .Y(n21) );
  AOI22X1M U20 ( .A0(SERIALIZER_Reg_F[5]), .A1(n7), .B0(i_P_Data_ser[4]), .B1(
        n5), .Y(n9) );
  OAI2BB1X2M U21 ( .A0N(n4), .A1N(SERIALIZER_Reg_F[5]), .B0(n8), .Y(n20) );
  AOI22X1M U22 ( .A0(SERIALIZER_Reg_F[6]), .A1(n7), .B0(i_P_Data_ser[5]), .B1(
        n5), .Y(n8) );
  AO22X1M U23 ( .A0(n4), .A1(SERIALIZER_Reg_F[7]), .B0(i_P_Data_ser[7]), .B1(
        n5), .Y(n18) );
  OAI32X1M U24 ( .A0(n3), .A1(\counter[1] ), .A2(n15), .B0(n16), .B1(n2), .Y(
        n26) );
  OAI32X1M U25 ( .A0(n14), .A1(n3), .A2(n2), .B0(n17), .B1(n1), .Y(n27) );
  AND2X2M U26 ( .A(n14), .B(n16), .Y(n17) );
  NOR2X2M U27 ( .A(n3), .B(n15), .Y(n16) );
  INVX2M U28 ( .A(\counter[1] ), .Y(n2) );
  CLKXOR2X2M U29 ( .A(n15), .B(n3), .Y(n28) );
endmodule


module UART_TX_TOP_data_width_Top8 ( i_clk_Top, i_rst_n_Top, i_DATA_VALID_Top, 
        i_P_DATA_Top, i_PAR_EN_Top, i_PAR_TYP_Top, o_TX_OUT_Top, o_Busy_Top );
  input [7:0] i_P_DATA_Top;
  input i_clk_Top, i_rst_n_Top, i_DATA_VALID_Top, i_PAR_EN_Top, i_PAR_TYP_Top;
  output o_TX_OUT_Top, o_Busy_Top;
  wire   ser_data, par_bit, ser_done, ser_en;
  wire   [1:0] mux_sel;

  MUX M_Top ( .i_mux_sel_M(mux_sel), .i_start_bit_M(1'b0), .i_stop_bit_M(1'b1), 
        .i_ser_data_M(ser_data), .i_par_bit_M(par_bit), .o_TX_OUT_M(
        o_TX_OUT_Top) );
  Control_unit_FSM FSM_Top ( .i_clk_fsm(i_clk_Top), .i_rst_n_fsm(i_rst_n_Top), 
        .i_Data_Valid_fsm(i_DATA_VALID_Top), .i_ser_done_fsm(ser_done), 
        .i_PAR_EN_fsm(i_PAR_EN_Top), .o_ser_en_fsm(ser_en), .o_busy_fsm(
        o_Busy_Top), .o_mux_sel_fsm(mux_sel) );
  Parity_Calc_data_width8 PAR_Top ( .i_clk_par(i_clk_Top), .i_rst_n_par(
        i_rst_n_Top), .i_P_Data_par(i_P_DATA_Top), .i_PAR_TYP_par(
        i_PAR_TYP_Top), .i_Data_Valid_par(i_DATA_VALID_Top), .i_busy_par(
        o_Busy_Top), .o_PAR_Bit_par(par_bit) );
  serializer_unit_data_width8 SER_Top ( .i_clk_ser(i_clk_Top), .i_rst_n_ser(
        i_rst_n_Top), .i_P_Data_ser(i_P_DATA_Top), .i_SER_EN_ser(ser_en), 
        .i_Data_Valid_ser(i_DATA_VALID_Top), .i_busy_ser(o_Busy_Top), 
        .o_ser_done_ser(ser_done), .o_ser_data_ser(ser_data) );
endmodule


module RX_FSM_control_unit_data_width_fsm8_prescale_bits_fsm6 ( i_clk_fsm, 
        i_rst_n_fsm, i_rx_in_fsm, i_par_en_fsm, i_bit_cnt_fsm, i_edg_cnt_fsm, 
        i_prescale_fsm, i_par_err_fsm, i_stp_err_fsm, i_strt_glitch_fsm, 
        o_errors_rst_fsm, o_deser_en_fsm, o_enable_ebc_fsm, o_par_chk_en_fsm, 
        o_stp_chk_en_fsm, o_strt_chk_en_fsm, o_dat_samp_en_fsm, 
        o_data_valid_fsm );
  input [3:0] i_bit_cnt_fsm;
  input [5:0] i_edg_cnt_fsm;
  input [5:0] i_prescale_fsm;
  input i_clk_fsm, i_rst_n_fsm, i_rx_in_fsm, i_par_en_fsm, i_par_err_fsm,
         i_stp_err_fsm, i_strt_glitch_fsm;
  output o_errors_rst_fsm, o_deser_en_fsm, o_enable_ebc_fsm, o_par_chk_en_fsm,
         o_stp_chk_en_fsm, o_strt_chk_en_fsm, o_dat_samp_en_fsm,
         o_data_valid_fsm;
  wire   N36, N37, N38, N39, N40, N41, N42, N43, N115, N116, N117, N118, N119,
         N120, data_valid_comb, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, \r99/carry[4] , \r99/carry[3] , n1, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n49;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign N115 = i_prescale_fsm[1];

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(current_state[0]) );
  DFFRQX2M o_data_valid_fsm_reg ( .D(data_valid_comb), .CK(i_clk_fsm), .RN(
        i_rst_n_fsm), .Q(o_data_valid_fsm) );
  NOR3X2M U3 ( .A(n35), .B(current_state[0]), .C(n36), .Y(n43) );
  INVX2M U4 ( .A(o_errors_rst_fsm), .Y(n30) );
  INVX2M U5 ( .A(n39), .Y(n34) );
  NOR2X2M U6 ( .A(n30), .B(n1), .Y(o_strt_chk_en_fsm) );
  NOR2X2M U7 ( .A(n34), .B(n32), .Y(o_deser_en_fsm) );
  INVX2M U8 ( .A(n43), .Y(n33) );
  INVX2M U9 ( .A(N117), .Y(n27) );
  OAI221X1M U10 ( .A0(i_rx_in_fsm), .A1(n44), .B0(n41), .B1(n31), .C0(n45), 
        .Y(next_state[0]) );
  INVX2M U11 ( .A(o_deser_en_fsm), .Y(n31) );
  AO21XLM U12 ( .A0(N43), .A1(i_strt_glitch_fsm), .B0(n30), .Y(n45) );
  AOI32X1M U13 ( .A0(n35), .A1(n36), .A2(n32), .B0(n37), .B1(n43), .Y(n44) );
  NAND3BX2M U14 ( .AN(i_bit_cnt_fsm[2]), .B(i_bit_cnt_fsm[3]), .C(N43), .Y(n46) );
  NOR3BX2M U15 ( .AN(i_bit_cnt_fsm[0]), .B(n46), .C(i_bit_cnt_fsm[1]), .Y(n40)
         );
  NOR3X2M U16 ( .A(i_bit_cnt_fsm[0]), .B(i_bit_cnt_fsm[1]), .C(n46), .Y(n41)
         );
  OAI211X2M U17 ( .A0(n37), .A1(n33), .B0(n42), .C0(n34), .Y(next_state[1]) );
  NAND4BX1M U18 ( .AN(i_strt_glitch_fsm), .B(N43), .C(current_state[0]), .D(
        n36), .Y(n42) );
  OAI21X2M U19 ( .A0(n37), .A1(n33), .B0(n38), .Y(next_state[2]) );
  AOI33X2M U20 ( .A0(n39), .A1(n32), .A2(n40), .B0(n41), .B1(n49), .B2(
        o_deser_en_fsm), .Y(n38) );
  INVX2M U21 ( .A(i_par_en_fsm), .Y(n49) );
  OA21X2M U22 ( .A0(i_par_en_fsm), .A1(n40), .B0(n47), .Y(n37) );
  OAI31X1M U23 ( .A0(n29), .A1(i_bit_cnt_fsm[0]), .A2(n46), .B0(i_par_en_fsm), 
        .Y(n47) );
  INVX2M U24 ( .A(i_bit_cnt_fsm[1]), .Y(n29) );
  NOR3X2M U25 ( .A(current_state[1]), .B(current_state[2]), .C(n32), .Y(
        o_errors_rst_fsm) );
  INVX2M U26 ( .A(i_edg_cnt_fsm[3]), .Y(n24) );
  INVX2M U27 ( .A(N118), .Y(n28) );
  NOR3X2M U28 ( .A(n34), .B(current_state[0]), .C(n1), .Y(o_par_chk_en_fsm) );
  AOI211X2M U29 ( .A0(i_par_err_fsm), .A1(i_par_en_fsm), .B0(n48), .C0(
        i_stp_err_fsm), .Y(data_valid_comb) );
  NAND2X2M U30 ( .A(N43), .B(n43), .Y(n48) );
  OA21X2M U31 ( .A0(N120), .A1(n26), .B0(n21), .Y(n1) );
  NOR2X2M U32 ( .A(n35), .B(current_state[2]), .Y(n39) );
  INVX2M U33 ( .A(i_edg_cnt_fsm[2]), .Y(n23) );
  INVX2M U34 ( .A(i_prescale_fsm[2]), .Y(N116) );
  INVX2M U35 ( .A(current_state[0]), .Y(n32) );
  INVX2M U36 ( .A(current_state[1]), .Y(n35) );
  INVX2M U37 ( .A(i_edg_cnt_fsm[1]), .Y(n22) );
  INVX2M U38 ( .A(i_edg_cnt_fsm[4]), .Y(n25) );
  NOR2X2M U39 ( .A(n1), .B(n33), .Y(o_stp_chk_en_fsm) );
  INVX2M U40 ( .A(current_state[2]), .Y(n36) );
  INVX2M U41 ( .A(i_edg_cnt_fsm[5]), .Y(n26) );
  OR2X2M U42 ( .A(N115), .B(i_prescale_fsm[0]), .Y(n3) );
  BUFX2M U43 ( .A(o_enable_ebc_fsm), .Y(o_dat_samp_en_fsm) );
  OAI211X2M U44 ( .A0(current_state[0]), .A1(n35), .B0(n30), .C0(n34), .Y(
        o_enable_ebc_fsm) );
  AND2X1M U45 ( .A(\r99/carry[4] ), .B(i_prescale_fsm[5]), .Y(N120) );
  CLKXOR2X2M U46 ( .A(i_prescale_fsm[5]), .B(\r99/carry[4] ), .Y(N119) );
  AND2X1M U47 ( .A(\r99/carry[3] ), .B(i_prescale_fsm[4]), .Y(\r99/carry[4] )
         );
  CLKXOR2X2M U48 ( .A(i_prescale_fsm[4]), .B(\r99/carry[3] ), .Y(N118) );
  AND2X1M U49 ( .A(i_prescale_fsm[2]), .B(i_prescale_fsm[3]), .Y(
        \r99/carry[3] ) );
  CLKXOR2X2M U50 ( .A(i_prescale_fsm[3]), .B(i_prescale_fsm[2]), .Y(N117) );
  CLKINVX1M U51 ( .A(i_prescale_fsm[0]), .Y(N36) );
  OAI2BB1X1M U52 ( .A0N(i_prescale_fsm[0]), .A1N(N115), .B0(n3), .Y(N37) );
  OR2X1M U53 ( .A(n3), .B(i_prescale_fsm[2]), .Y(n4) );
  OAI2BB1X1M U54 ( .A0N(n3), .A1N(i_prescale_fsm[2]), .B0(n4), .Y(N38) );
  OR2X1M U55 ( .A(n4), .B(i_prescale_fsm[3]), .Y(n5) );
  OAI2BB1X1M U56 ( .A0N(n4), .A1N(i_prescale_fsm[3]), .B0(n5), .Y(N39) );
  OR2X1M U57 ( .A(n5), .B(i_prescale_fsm[4]), .Y(n6) );
  OAI2BB1X1M U58 ( .A0N(n5), .A1N(i_prescale_fsm[4]), .B0(n6), .Y(N40) );
  NOR2X1M U59 ( .A(n6), .B(i_prescale_fsm[5]), .Y(N42) );
  AO21XLM U60 ( .A0(n6), .A1(i_prescale_fsm[5]), .B0(N42), .Y(N41) );
  NOR2BX1M U61 ( .AN(N36), .B(i_edg_cnt_fsm[0]), .Y(n7) );
  OAI2B2X1M U62 ( .A1N(i_edg_cnt_fsm[1]), .A0(n7), .B0(N37), .B1(n7), .Y(n11)
         );
  XNOR2X1M U63 ( .A(N41), .B(i_edg_cnt_fsm[5]), .Y(n10) );
  NOR2BX1M U64 ( .AN(i_edg_cnt_fsm[0]), .B(N36), .Y(n8) );
  OAI2B2X1M U65 ( .A1N(N37), .A0(n8), .B0(i_edg_cnt_fsm[1]), .B1(n8), .Y(n9)
         );
  NAND4BX1M U66 ( .AN(N42), .B(n11), .C(n10), .D(n9), .Y(n15) );
  CLKXOR2X2M U67 ( .A(N40), .B(i_edg_cnt_fsm[4]), .Y(n14) );
  CLKXOR2X2M U68 ( .A(N38), .B(i_edg_cnt_fsm[2]), .Y(n13) );
  CLKXOR2X2M U69 ( .A(N39), .B(i_edg_cnt_fsm[3]), .Y(n12) );
  NOR4X1M U70 ( .A(n15), .B(n14), .C(n13), .D(n12), .Y(N43) );
  NOR2X1M U71 ( .A(N119), .B(n25), .Y(n20) );
  AOI2BB1X1M U72 ( .A0N(N116), .A1N(n22), .B0(i_edg_cnt_fsm[0]), .Y(n16) );
  AOI222X1M U73 ( .A0(N117), .A1(n23), .B0(n16), .B1(N115), .C0(N116), .C1(n22), .Y(n17) );
  AOI221XLM U74 ( .A0(i_edg_cnt_fsm[3]), .A1(n28), .B0(i_edg_cnt_fsm[2]), .B1(
        n27), .C0(n17), .Y(n18) );
  AOI221XLM U75 ( .A0(N119), .A1(n25), .B0(N118), .B1(n24), .C0(n18), .Y(n19)
         );
  OAI2BB2X1M U76 ( .B0(n20), .B1(n19), .A0N(n26), .A1N(N120), .Y(n21) );
endmodule


module edge_bit_cnt_unit_data_width_ebc8_prescale_bits_ebc6 ( i_clk_ebc, 
        i_rst_n_ebc, i_enable_ebc, i_par_en_ebc, i_prescale_ebc, o_bit_cnt_ebc, 
        o_edg_cnt_ebc );
  input [5:0] i_prescale_ebc;
  output [3:0] o_bit_cnt_ebc;
  output [5:0] o_edg_cnt_ebc;
  input i_clk_ebc, i_rst_n_ebc, i_enable_ebc, i_par_en_ebc;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N59, N60, N61, N62, N70, N71,
         N72, N73, N74, N75, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, \add_70/carry[5] , \add_70/carry[4] ,
         \add_70/carry[3] , \add_70/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n29, n30, n31, n32, n33, n34, n35, n36;

  DFFRQX2M \o_bit_cnt_ebc_reg[3]  ( .D(n25), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_bit_cnt_ebc[3]) );
  DFFRQX2M \o_bit_cnt_ebc_reg[2]  ( .D(n26), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_bit_cnt_ebc[2]) );
  DFFRQX2M \o_edg_cnt_ebc_reg[5]  ( .D(N75), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_edg_cnt_ebc[5]) );
  DFFRQX2M \o_edg_cnt_ebc_reg[0]  ( .D(N70), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_edg_cnt_ebc[0]) );
  DFFRQX2M \o_edg_cnt_ebc_reg[3]  ( .D(N73), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_edg_cnt_ebc[3]) );
  DFFRQX2M \o_edg_cnt_ebc_reg[2]  ( .D(N72), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_edg_cnt_ebc[2]) );
  DFFRQX2M \o_edg_cnt_ebc_reg[4]  ( .D(N74), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_edg_cnt_ebc[4]) );
  DFFRQX2M \o_edg_cnt_ebc_reg[1]  ( .D(N71), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_edg_cnt_ebc[1]) );
  DFFRQX2M \o_bit_cnt_ebc_reg[0]  ( .D(n27), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_bit_cnt_ebc[0]) );
  DFFRQX2M \o_bit_cnt_ebc_reg[1]  ( .D(n28), .CK(i_clk_ebc), .RN(i_rst_n_ebc), 
        .Q(o_bit_cnt_ebc[1]) );
  INVX2M U3 ( .A(n16), .Y(n31) );
  NOR2X2M U4 ( .A(n36), .B(n32), .Y(n20) );
  NOR2X2M U5 ( .A(n36), .B(n20), .Y(n16) );
  NAND2X2M U6 ( .A(i_enable_ebc), .B(n32), .Y(n24) );
  INVX2M U7 ( .A(N15), .Y(n32) );
  INVX2M U8 ( .A(i_enable_ebc), .Y(n36) );
  NOR2BX2M U9 ( .AN(N59), .B(n24), .Y(N71) );
  NOR2BX2M U10 ( .AN(N60), .B(n24), .Y(N72) );
  NOR2BX2M U11 ( .AN(N61), .B(n24), .Y(N73) );
  NOR2BX2M U12 ( .AN(N62), .B(n24), .Y(N74) );
  OAI22X1M U13 ( .A0(n33), .A1(n31), .B0(o_bit_cnt_ebc[0]), .B1(n13), .Y(n27)
         );
  OAI22X1M U14 ( .A0(n34), .A1(n31), .B0(n19), .B1(n13), .Y(n28) );
  XNOR2X2M U15 ( .A(o_bit_cnt_ebc[0]), .B(o_bit_cnt_ebc[1]), .Y(n19) );
  NAND2X2M U16 ( .A(n20), .B(n21), .Y(n13) );
  OAI2B2X1M U17 ( .A1N(i_par_en_ebc), .A0(n22), .B0(i_par_en_ebc), .B1(n23), 
        .Y(n21) );
  NOR4X1M U18 ( .A(o_bit_cnt_ebc[2]), .B(o_bit_cnt_ebc[1]), .C(n33), .D(n35), 
        .Y(n23) );
  NOR4X1M U19 ( .A(o_bit_cnt_ebc[2]), .B(o_bit_cnt_ebc[0]), .C(n35), .D(n34), 
        .Y(n22) );
  OAI32X1M U20 ( .A0(n13), .A1(o_bit_cnt_ebc[3]), .A2(n14), .B0(n15), .B1(n35), 
        .Y(n25) );
  AOI2B1X1M U21 ( .A1N(n13), .A0(n14), .B0(n16), .Y(n15) );
  NAND3X2M U22 ( .A(o_bit_cnt_ebc[1]), .B(o_bit_cnt_ebc[0]), .C(
        o_bit_cnt_ebc[2]), .Y(n14) );
  NOR2X2M U23 ( .A(n1), .B(n24), .Y(N75) );
  XNOR2X2M U24 ( .A(\add_70/carry[5] ), .B(o_edg_cnt_ebc[5]), .Y(n1) );
  NOR2X2M U25 ( .A(o_edg_cnt_ebc[0]), .B(n24), .Y(N70) );
  NOR2X2M U26 ( .A(n17), .B(n36), .Y(n26) );
  CLKXOR2X2M U27 ( .A(n18), .B(o_bit_cnt_ebc[2]), .Y(n17) );
  NAND3X2M U28 ( .A(o_bit_cnt_ebc[0]), .B(N15), .C(o_bit_cnt_ebc[1]), .Y(n18)
         );
  INVX2M U29 ( .A(o_bit_cnt_ebc[1]), .Y(n34) );
  INVX2M U30 ( .A(o_bit_cnt_ebc[0]), .Y(n33) );
  INVX2M U31 ( .A(o_bit_cnt_ebc[3]), .Y(n35) );
  ADDHX1M U32 ( .A(o_edg_cnt_ebc[1]), .B(o_edg_cnt_ebc[0]), .CO(
        \add_70/carry[2] ), .S(N59) );
  ADDHX1M U33 ( .A(o_edg_cnt_ebc[2]), .B(\add_70/carry[2] ), .CO(
        \add_70/carry[3] ), .S(N60) );
  ADDHX1M U34 ( .A(o_edg_cnt_ebc[3]), .B(\add_70/carry[3] ), .CO(
        \add_70/carry[4] ), .S(N61) );
  ADDHX1M U35 ( .A(o_edg_cnt_ebc[4]), .B(\add_70/carry[4] ), .CO(
        \add_70/carry[5] ), .S(N62) );
  OR2X2M U36 ( .A(i_prescale_ebc[1]), .B(i_prescale_ebc[0]), .Y(n2) );
  CLKINVX1M U37 ( .A(i_prescale_ebc[0]), .Y(N8) );
  OAI2BB1X1M U38 ( .A0N(i_prescale_ebc[0]), .A1N(i_prescale_ebc[1]), .B0(n2), 
        .Y(N9) );
  OR2X1M U39 ( .A(n2), .B(i_prescale_ebc[2]), .Y(n3) );
  OAI2BB1X1M U40 ( .A0N(n2), .A1N(i_prescale_ebc[2]), .B0(n3), .Y(N10) );
  OR2X1M U41 ( .A(n3), .B(i_prescale_ebc[3]), .Y(n4) );
  OAI2BB1X1M U42 ( .A0N(n3), .A1N(i_prescale_ebc[3]), .B0(n4), .Y(N11) );
  OR2X1M U43 ( .A(n4), .B(i_prescale_ebc[4]), .Y(n5) );
  OAI2BB1X1M U44 ( .A0N(n4), .A1N(i_prescale_ebc[4]), .B0(n5), .Y(N12) );
  NOR2X1M U45 ( .A(n5), .B(i_prescale_ebc[5]), .Y(N14) );
  AO21XLM U46 ( .A0(n5), .A1(i_prescale_ebc[5]), .B0(N14), .Y(N13) );
  NOR2BX1M U47 ( .AN(N8), .B(o_edg_cnt_ebc[0]), .Y(n6) );
  OAI2B2X1M U48 ( .A1N(o_edg_cnt_ebc[1]), .A0(n6), .B0(N9), .B1(n6), .Y(n10)
         );
  XNOR2X1M U49 ( .A(N13), .B(o_edg_cnt_ebc[5]), .Y(n9) );
  NOR2BX1M U50 ( .AN(o_edg_cnt_ebc[0]), .B(N8), .Y(n7) );
  OAI2B2X1M U51 ( .A1N(N9), .A0(n7), .B0(o_edg_cnt_ebc[1]), .B1(n7), .Y(n8) );
  NAND4BX1M U52 ( .AN(N14), .B(n10), .C(n9), .D(n8), .Y(n30) );
  CLKXOR2X2M U53 ( .A(N12), .B(o_edg_cnt_ebc[4]), .Y(n29) );
  CLKXOR2X2M U54 ( .A(N10), .B(o_edg_cnt_ebc[2]), .Y(n12) );
  CLKXOR2X2M U55 ( .A(N11), .B(o_edg_cnt_ebc[3]), .Y(n11) );
  NOR4X1M U56 ( .A(n30), .B(n29), .C(n12), .D(n11), .Y(N15) );
endmodule


module data_sampling_unit_prescale_bits_DS6 ( i_clk_ds, i_rst_n_ds, i_rx_in_ds, 
        i_edg_cnt_ds, i_prescale_ds, i_dat_samp_en_ds, o_sampled_bit_ds );
  input [5:0] i_edg_cnt_ds;
  input [5:0] i_prescale_ds;
  input i_clk_ds, i_rst_n_ds, i_rx_in_ds, i_dat_samp_en_ds;
  output o_sampled_bit_ds;
  wire   sample_0, sample_1, sample_2, N5, N6, N7, N8, N9, N10, N14, N15, N16,
         N17, N18, n22, n23, n24, \add_46/carry[4] , \add_46/carry[3] ,
         \add_46/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38;

  DFFRQX2M sample_2_reg ( .D(n24), .CK(i_clk_ds), .RN(i_rst_n_ds), .Q(sample_2) );
  DFFRQX2M sample_1_reg ( .D(n22), .CK(i_clk_ds), .RN(i_rst_n_ds), .Q(sample_1) );
  DFFRQX2M sample_0_reg ( .D(n23), .CK(i_clk_ds), .RN(i_rst_n_ds), .Q(sample_0) );
  OR4X1M U3 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(n1) );
  OR2X2M U4 ( .A(i_prescale_ds[2]), .B(i_prescale_ds[1]), .Y(n2) );
  ADDHX1M U5 ( .A(i_prescale_ds[2]), .B(i_prescale_ds[1]), .CO(
        \add_46/carry[2] ), .S(N14) );
  ADDHX1M U6 ( .A(i_prescale_ds[4]), .B(\add_46/carry[3] ), .CO(
        \add_46/carry[4] ), .S(N16) );
  ADDHX1M U7 ( .A(i_prescale_ds[3]), .B(\add_46/carry[2] ), .CO(
        \add_46/carry[3] ), .S(N15) );
  ADDHX1M U8 ( .A(i_prescale_ds[5]), .B(\add_46/carry[4] ), .CO(N18), .S(N17)
         );
  CLKINVX1M U9 ( .A(i_prescale_ds[1]), .Y(N5) );
  OAI2BB1X1M U10 ( .A0N(i_prescale_ds[1]), .A1N(i_prescale_ds[2]), .B0(n2), 
        .Y(N6) );
  OR2X1M U11 ( .A(n2), .B(i_prescale_ds[3]), .Y(n3) );
  OAI2BB1X1M U12 ( .A0N(n2), .A1N(i_prescale_ds[3]), .B0(n3), .Y(N7) );
  XNOR2X1M U13 ( .A(i_prescale_ds[4]), .B(n3), .Y(N8) );
  NOR3X1M U14 ( .A(i_prescale_ds[4]), .B(i_prescale_ds[5]), .C(n3), .Y(N10) );
  OAI21X1M U15 ( .A0(i_prescale_ds[4]), .A1(n3), .B0(i_prescale_ds[5]), .Y(n4)
         );
  NAND2BX1M U16 ( .AN(N10), .B(n4), .Y(N9) );
  NOR2BX1M U17 ( .AN(i_edg_cnt_ds[0]), .B(N5), .Y(n5) );
  OAI2B2X1M U18 ( .A1N(N6), .A0(n5), .B0(i_edg_cnt_ds[1]), .B1(n5), .Y(n8) );
  NOR2BX1M U19 ( .AN(N5), .B(i_edg_cnt_ds[0]), .Y(n6) );
  OAI2B2X1M U20 ( .A1N(i_edg_cnt_ds[1]), .A0(n6), .B0(N6), .B1(n6), .Y(n7) );
  NAND4BBX1M U21 ( .AN(N10), .BN(i_edg_cnt_ds[5]), .C(n8), .D(n7), .Y(n12) );
  CLKXOR2X2M U22 ( .A(N9), .B(i_edg_cnt_ds[4]), .Y(n11) );
  CLKXOR2X2M U23 ( .A(N7), .B(i_edg_cnt_ds[2]), .Y(n10) );
  CLKXOR2X2M U24 ( .A(N8), .B(i_edg_cnt_ds[3]), .Y(n9) );
  OAI21X1M U25 ( .A0(n13), .A1(n14), .B0(n15), .Y(o_sampled_bit_ds) );
  OAI21X1M U26 ( .A0(sample_0), .A1(sample_1), .B0(sample_2), .Y(n15) );
  OAI2B2X1M U27 ( .A1N(sample_2), .A0(n16), .B0(n17), .B1(n18), .Y(n24) );
  NOR2X1M U28 ( .A(n17), .B(n19), .Y(n16) );
  NAND4X1M U29 ( .A(n20), .B(n21), .C(n25), .D(n26), .Y(n17) );
  NOR3X1M U30 ( .A(n27), .B(n28), .C(n29), .Y(n26) );
  CLKXOR2X2M U31 ( .A(i_edg_cnt_ds[4]), .B(N17), .Y(n29) );
  CLKXOR2X2M U32 ( .A(i_edg_cnt_ds[1]), .B(N14), .Y(n28) );
  CLKXOR2X2M U33 ( .A(i_edg_cnt_ds[0]), .B(N5), .Y(n27) );
  XNOR2X1M U34 ( .A(i_edg_cnt_ds[2]), .B(N15), .Y(n25) );
  XNOR2X1M U35 ( .A(i_edg_cnt_ds[3]), .B(N16), .Y(n21) );
  XNOR2X1M U36 ( .A(i_edg_cnt_ds[5]), .B(N18), .Y(n20) );
  OAI22X1M U37 ( .A0(n18), .A1(n1), .B0(n30), .B1(n13), .Y(n23) );
  CLKINVX1M U38 ( .A(sample_0), .Y(n13) );
  NOR2X1M U39 ( .A(n19), .B(n1), .Y(n30) );
  OAI22X1M U40 ( .A0(n18), .A1(n31), .B0(n32), .B1(n14), .Y(n22) );
  CLKINVX1M U41 ( .A(sample_1), .Y(n14) );
  NOR2X1M U42 ( .A(n19), .B(n31), .Y(n32) );
  CLKINVX1M U43 ( .A(i_dat_samp_en_ds), .Y(n19) );
  NAND4X1M U44 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n31) );
  NOR3X1M U45 ( .A(n37), .B(i_edg_cnt_ds[5]), .C(n38), .Y(n36) );
  CLKXOR2X2M U46 ( .A(i_prescale_ds[1]), .B(i_edg_cnt_ds[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_prescale_ds[5]), .B(i_edg_cnt_ds[4]), .Y(n37) );
  XNOR2X1M U48 ( .A(i_edg_cnt_ds[2]), .B(i_prescale_ds[3]), .Y(n35) );
  XNOR2X1M U49 ( .A(i_edg_cnt_ds[3]), .B(i_prescale_ds[4]), .Y(n34) );
  XNOR2X1M U50 ( .A(i_edg_cnt_ds[1]), .B(i_prescale_ds[2]), .Y(n33) );
  CLKNAND2X2M U51 ( .A(i_rx_in_ds), .B(i_dat_samp_en_ds), .Y(n18) );
endmodule


module deserializer_unit_data_width_deser8_prescale_bits_deser6 ( i_clk_deser, 
        i_rst_n_deser, i_deser_en_deser, i_sampled_bit_deser, i_bit_cnt_deser, 
        i_edg_cnt_deser, i_prescale_deser, o_P_data_deser );
  input [3:0] i_bit_cnt_deser;
  input [5:0] i_edg_cnt_deser;
  input [5:0] i_prescale_deser;
  output [7:0] o_P_data_deser;
  input i_clk_deser, i_rst_n_deser, i_deser_en_deser, i_sampled_bit_deser;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N11, N12, N13, N14, N15, N16, N18, n1,
         n3, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, \sub_42/carry[5] , \sub_42/carry[4] ,
         \sub_42/carry[3] , n2, n4, n5, n6, n7, n8, n9, n10, n11, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [7:0] stored_data;
  assign N11 = i_prescale_deser[0];

  DFFRQX2M \stored_data_reg[7]  ( .D(n28), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[7]) );
  DFFRQX2M \stored_data_reg[6]  ( .D(n26), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[6]) );
  DFFRQX2M \stored_data_reg[5]  ( .D(n24), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[5]) );
  DFFRQX2M \stored_data_reg[4]  ( .D(n22), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[4]) );
  DFFRQX2M \stored_data_reg[3]  ( .D(n20), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[3]) );
  DFFRQX2M \stored_data_reg[2]  ( .D(n18), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[2]) );
  DFFRQX2M \stored_data_reg[1]  ( .D(n16), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[1]) );
  DFFRQX2M \stored_data_reg[0]  ( .D(n14), .CK(i_clk_deser), .RN(i_rst_n_deser), .Q(stored_data[0]) );
  DFFRQX2M \o_P_data_deser_reg[5]  ( .D(n23), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[5]) );
  DFFRQX2M \o_P_data_deser_reg[1]  ( .D(n15), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[1]) );
  DFFRQX2M \o_P_data_deser_reg[4]  ( .D(n21), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[4]) );
  DFFRQX2M \o_P_data_deser_reg[0]  ( .D(n13), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[0]) );
  DFFRQX2M \o_P_data_deser_reg[7]  ( .D(n27), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[7]) );
  DFFRQX2M \o_P_data_deser_reg[3]  ( .D(n19), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[3]) );
  DFFRQX2M \o_P_data_deser_reg[6]  ( .D(n25), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[6]) );
  DFFRQX2M \o_P_data_deser_reg[2]  ( .D(n17), .CK(i_clk_deser), .RN(
        i_rst_n_deser), .Q(o_P_data_deser[2]) );
  OAI2B11X2M U3 ( .A1N(i_bit_cnt_deser[3]), .A0(n12), .B0(i_deser_en_deser), 
        .C0(N18), .Y(n3) );
  NOR2X2M U4 ( .A(i_prescale_deser[5]), .B(\sub_42/carry[5] ), .Y(n2) );
  BUFX2M U5 ( .A(n1), .Y(n4) );
  INVX2M U6 ( .A(n3), .Y(n44) );
  OAI22X1M U7 ( .A0(n3), .A1(n51), .B0(n44), .B1(n52), .Y(n14) );
  OAI22X1M U8 ( .A0(n3), .A1(n50), .B0(n44), .B1(n51), .Y(n16) );
  OAI22X1M U9 ( .A0(n3), .A1(n49), .B0(n44), .B1(n50), .Y(n18) );
  OAI22X1M U10 ( .A0(n3), .A1(n48), .B0(n44), .B1(n49), .Y(n20) );
  OAI22X1M U11 ( .A0(n3), .A1(n47), .B0(n44), .B1(n48), .Y(n22) );
  OAI22X1M U12 ( .A0(n3), .A1(n46), .B0(n44), .B1(n47), .Y(n24) );
  OAI22X1M U13 ( .A0(n3), .A1(n45), .B0(n44), .B1(n46), .Y(n26) );
  OAI2BB2X1M U14 ( .B0(n44), .B1(n45), .A0N(i_sampled_bit_deser), .A1N(n44), 
        .Y(n28) );
  NOR3X2M U15 ( .A(i_bit_cnt_deser[2]), .B(i_bit_cnt_deser[1]), .C(
        i_bit_cnt_deser[0]), .Y(n12) );
  OAI2BB2X1M U16 ( .B0(n4), .B1(n52), .A0N(o_P_data_deser[0]), .A1N(n4), .Y(
        n13) );
  OAI2BB2X1M U17 ( .B0(n4), .B1(n51), .A0N(o_P_data_deser[1]), .A1N(n4), .Y(
        n15) );
  OAI2BB2X1M U18 ( .B0(n4), .B1(n50), .A0N(o_P_data_deser[2]), .A1N(n4), .Y(
        n17) );
  OAI2BB2X1M U19 ( .B0(n4), .B1(n49), .A0N(o_P_data_deser[3]), .A1N(n4), .Y(
        n19) );
  OAI2BB2X1M U20 ( .B0(n4), .B1(n48), .A0N(o_P_data_deser[4]), .A1N(n4), .Y(
        n21) );
  OAI2BB2X1M U21 ( .B0(n4), .B1(n47), .A0N(o_P_data_deser[5]), .A1N(n4), .Y(
        n23) );
  OAI2BB2X1M U22 ( .B0(n4), .B1(n46), .A0N(o_P_data_deser[6]), .A1N(n4), .Y(
        n25) );
  OAI2BB2X1M U23 ( .B0(n4), .B1(n45), .A0N(o_P_data_deser[7]), .A1N(n4), .Y(
        n27) );
  NAND4X2M U24 ( .A(i_deser_en_deser), .B(i_bit_cnt_deser[3]), .C(N8), .D(n12), 
        .Y(n1) );
  INVX2M U25 ( .A(stored_data[7]), .Y(n45) );
  INVX2M U26 ( .A(stored_data[1]), .Y(n51) );
  INVX2M U27 ( .A(stored_data[2]), .Y(n50) );
  INVX2M U28 ( .A(stored_data[3]), .Y(n49) );
  INVX2M U29 ( .A(stored_data[4]), .Y(n48) );
  INVX2M U30 ( .A(stored_data[5]), .Y(n47) );
  INVX2M U31 ( .A(stored_data[6]), .Y(n46) );
  INVX2M U32 ( .A(stored_data[0]), .Y(n52) );
  OR2X2M U33 ( .A(i_prescale_deser[1]), .B(N11), .Y(n5) );
  INVX2M U34 ( .A(i_prescale_deser[1]), .Y(N12) );
  XNOR2X1M U35 ( .A(\sub_42/carry[5] ), .B(i_prescale_deser[5]), .Y(N16) );
  OR2X1M U36 ( .A(i_prescale_deser[4]), .B(\sub_42/carry[4] ), .Y(
        \sub_42/carry[5] ) );
  XNOR2X1M U37 ( .A(\sub_42/carry[4] ), .B(i_prescale_deser[4]), .Y(N15) );
  OR2X1M U38 ( .A(i_prescale_deser[3]), .B(\sub_42/carry[3] ), .Y(
        \sub_42/carry[4] ) );
  XNOR2X1M U39 ( .A(\sub_42/carry[3] ), .B(i_prescale_deser[3]), .Y(N14) );
  OR2X1M U40 ( .A(i_prescale_deser[2]), .B(i_prescale_deser[1]), .Y(
        \sub_42/carry[3] ) );
  XNOR2X1M U41 ( .A(i_prescale_deser[1]), .B(i_prescale_deser[2]), .Y(N13) );
  CLKINVX1M U42 ( .A(N11), .Y(N1) );
  OAI2BB1X1M U43 ( .A0N(N11), .A1N(i_prescale_deser[1]), .B0(n5), .Y(N2) );
  OR2X1M U44 ( .A(n5), .B(i_prescale_deser[2]), .Y(n6) );
  OAI2BB1X1M U45 ( .A0N(n5), .A1N(i_prescale_deser[2]), .B0(n6), .Y(N3) );
  OR2X1M U46 ( .A(n6), .B(i_prescale_deser[3]), .Y(n7) );
  OAI2BB1X1M U47 ( .A0N(n6), .A1N(i_prescale_deser[3]), .B0(n7), .Y(N4) );
  OR2X1M U48 ( .A(n7), .B(i_prescale_deser[4]), .Y(n8) );
  OAI2BB1X1M U49 ( .A0N(n7), .A1N(i_prescale_deser[4]), .B0(n8), .Y(N5) );
  NOR2X1M U50 ( .A(n8), .B(i_prescale_deser[5]), .Y(N7) );
  AO21XLM U51 ( .A0(n8), .A1(i_prescale_deser[5]), .B0(N7), .Y(N6) );
  NOR2BX1M U52 ( .AN(N1), .B(i_edg_cnt_deser[0]), .Y(n9) );
  OAI2B2X1M U53 ( .A1N(i_edg_cnt_deser[1]), .A0(n9), .B0(N2), .B1(n9), .Y(n30)
         );
  XNOR2X1M U54 ( .A(N6), .B(i_edg_cnt_deser[5]), .Y(n29) );
  NOR2BX1M U55 ( .AN(i_edg_cnt_deser[0]), .B(N1), .Y(n10) );
  OAI2B2X1M U56 ( .A1N(N2), .A0(n10), .B0(i_edg_cnt_deser[1]), .B1(n10), .Y(
        n11) );
  NAND4BX1M U57 ( .AN(N7), .B(n30), .C(n29), .D(n11), .Y(n34) );
  CLKXOR2X2M U58 ( .A(N5), .B(i_edg_cnt_deser[4]), .Y(n33) );
  CLKXOR2X2M U59 ( .A(N3), .B(i_edg_cnt_deser[2]), .Y(n32) );
  CLKXOR2X2M U60 ( .A(N4), .B(i_edg_cnt_deser[3]), .Y(n31) );
  NOR4X1M U61 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(N8) );
  NOR2BX1M U62 ( .AN(N11), .B(i_edg_cnt_deser[0]), .Y(n35) );
  OAI2B2X1M U63 ( .A1N(i_edg_cnt_deser[1]), .A0(n35), .B0(N12), .B1(n35), .Y(
        n39) );
  XNOR2X1M U64 ( .A(N16), .B(i_edg_cnt_deser[5]), .Y(n38) );
  NOR2BX1M U65 ( .AN(i_edg_cnt_deser[0]), .B(N11), .Y(n36) );
  OAI2B2X1M U66 ( .A1N(N12), .A0(n36), .B0(i_edg_cnt_deser[1]), .B1(n36), .Y(
        n37) );
  NAND4BX1M U67 ( .AN(n2), .B(n39), .C(n38), .D(n37), .Y(n43) );
  CLKXOR2X2M U68 ( .A(N15), .B(i_edg_cnt_deser[4]), .Y(n42) );
  CLKXOR2X2M U69 ( .A(N13), .B(i_edg_cnt_deser[2]), .Y(n41) );
  CLKXOR2X2M U70 ( .A(N14), .B(i_edg_cnt_deser[3]), .Y(n40) );
  NOR4X1M U71 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(N18) );
endmodule


module parity_check_unit_data_width_par8 ( i_clk_par, i_rst_n_par, 
        i_errors_rst_par, i_par_chk_en_par, i_par_typ_par, i_sampled_bit_par, 
        i_P_data_par, o_par_err_par );
  input [7:0] i_P_data_par;
  input i_clk_par, i_rst_n_par, i_errors_rst_par, i_par_chk_en_par,
         i_par_typ_par, i_sampled_bit_par;
  output o_par_err_par;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n1;

  DFFRQX2M o_par_err_par_reg ( .D(n9), .CK(i_clk_par), .RN(i_rst_n_par), .Q(
        o_par_err_par) );
  NOR2X2M U3 ( .A(i_errors_rst_par), .B(n2), .Y(n9) );
  AOI22X1M U4 ( .A0(i_par_chk_en_par), .A1(n3), .B0(o_par_err_par), .B1(n1), 
        .Y(n2) );
  XOR3XLM U5 ( .A(n4), .B(n5), .C(n6), .Y(n3) );
  INVX2M U6 ( .A(i_par_chk_en_par), .Y(n1) );
  CLKXOR2X2M U7 ( .A(i_sampled_bit_par), .B(i_par_typ_par), .Y(n4) );
  XOR3XLM U8 ( .A(i_P_data_par[1]), .B(i_P_data_par[0]), .C(n7), .Y(n6) );
  XNOR2X2M U9 ( .A(i_P_data_par[3]), .B(i_P_data_par[2]), .Y(n7) );
  XOR3XLM U10 ( .A(i_P_data_par[5]), .B(i_P_data_par[4]), .C(n8), .Y(n5) );
  XNOR2X2M U11 ( .A(i_P_data_par[7]), .B(i_P_data_par[6]), .Y(n8) );
endmodule


module stop_check_unit ( i_clk_stp, i_rst_n_stp, i_stp_chk_en_stp, 
        i_sampled_bit_stp, i_errors_rst_stp, o_stp_err_stp );
  input i_clk_stp, i_rst_n_stp, i_stp_chk_en_stp, i_sampled_bit_stp,
         i_errors_rst_stp;
  output o_stp_err_stp;
  wire   n2, n3, n1;

  DFFRQX2M o_stp_err_stp_reg ( .D(n3), .CK(i_clk_stp), .RN(i_rst_n_stp), .Q(
        o_stp_err_stp) );
  NOR2X2M U3 ( .A(i_errors_rst_stp), .B(n2), .Y(n3) );
  AOI2BB2XLM U4 ( .B0(o_stp_err_stp), .B1(n1), .A0N(i_sampled_bit_stp), .A1N(
        n1), .Y(n2) );
  INVX2M U5 ( .A(i_stp_chk_en_stp), .Y(n1) );
endmodule


module strt_check_unit ( i_strt_chk_en_strt, i_sampled_bit_strt, o_strt_glitch
 );
  input i_strt_chk_en_strt, i_sampled_bit_strt;
  output o_strt_glitch;


  AND2X2M U2 ( .A(i_strt_chk_en_strt), .B(i_sampled_bit_strt), .Y(
        o_strt_glitch) );
endmodule


module Uart_RX_TOP_data_width_TOP8_prescale_bits_TOP6 ( i_CLK_TOP, i_RST_n_TOP, 
        i_RX_IN_TOP, i_Prescale_TOP, i_PAR_EN_TOP, i_PAR_TYP_TOP, 
        o_data_valid_TOP, o_Stop_Error_TOP, o_Parity_Error_TOP, o_P_DATA_TOP
 );
  input [5:0] i_Prescale_TOP;
  output [7:0] o_P_DATA_TOP;
  input i_CLK_TOP, i_RST_n_TOP, i_RX_IN_TOP, i_PAR_EN_TOP, i_PAR_TYP_TOP;
  output o_data_valid_TOP, o_Stop_Error_TOP, o_Parity_Error_TOP;
  wire   strt_glitch_TOP, errors_rst_TOP, deser_en_TOP, enable_ebc_TOP,
         par_chk_en_TOP, stp_chk_en_TOP, strt_chk_en_TOP, dat_samp_en_TOP,
         sampled_bit_TOP, n1, n2;
  wire   [3:0] bit_cnt_TOP;
  wire   [5:0] edg_cnt_TOP;

  RX_FSM_control_unit_data_width_fsm8_prescale_bits_fsm6 RX_FSM_CU ( 
        .i_clk_fsm(i_CLK_TOP), .i_rst_n_fsm(n1), .i_rx_in_fsm(i_RX_IN_TOP), 
        .i_par_en_fsm(i_PAR_EN_TOP), .i_bit_cnt_fsm(bit_cnt_TOP), 
        .i_edg_cnt_fsm(edg_cnt_TOP), .i_prescale_fsm(i_Prescale_TOP), 
        .i_par_err_fsm(o_Parity_Error_TOP), .i_stp_err_fsm(o_Stop_Error_TOP), 
        .i_strt_glitch_fsm(strt_glitch_TOP), .o_errors_rst_fsm(errors_rst_TOP), 
        .o_deser_en_fsm(deser_en_TOP), .o_enable_ebc_fsm(enable_ebc_TOP), 
        .o_par_chk_en_fsm(par_chk_en_TOP), .o_stp_chk_en_fsm(stp_chk_en_TOP), 
        .o_strt_chk_en_fsm(strt_chk_en_TOP), .o_dat_samp_en_fsm(
        dat_samp_en_TOP), .o_data_valid_fsm(o_data_valid_TOP) );
  edge_bit_cnt_unit_data_width_ebc8_prescale_bits_ebc6 EBC_U ( .i_clk_ebc(
        i_CLK_TOP), .i_rst_n_ebc(n1), .i_enable_ebc(enable_ebc_TOP), 
        .i_par_en_ebc(i_PAR_EN_TOP), .i_prescale_ebc(i_Prescale_TOP), 
        .o_bit_cnt_ebc(bit_cnt_TOP), .o_edg_cnt_ebc(edg_cnt_TOP) );
  data_sampling_unit_prescale_bits_DS6 DS_U ( .i_clk_ds(i_CLK_TOP), 
        .i_rst_n_ds(n1), .i_rx_in_ds(i_RX_IN_TOP), .i_edg_cnt_ds(edg_cnt_TOP), 
        .i_prescale_ds(i_Prescale_TOP), .i_dat_samp_en_ds(dat_samp_en_TOP), 
        .o_sampled_bit_ds(sampled_bit_TOP) );
  deserializer_unit_data_width_deser8_prescale_bits_deser6 DESER_U ( 
        .i_clk_deser(i_CLK_TOP), .i_rst_n_deser(n1), .i_deser_en_deser(
        deser_en_TOP), .i_sampled_bit_deser(sampled_bit_TOP), 
        .i_bit_cnt_deser(bit_cnt_TOP), .i_edg_cnt_deser(edg_cnt_TOP), 
        .i_prescale_deser(i_Prescale_TOP), .o_P_data_deser(o_P_DATA_TOP) );
  parity_check_unit_data_width_par8 PAR_U ( .i_clk_par(i_CLK_TOP), 
        .i_rst_n_par(n1), .i_errors_rst_par(errors_rst_TOP), 
        .i_par_chk_en_par(par_chk_en_TOP), .i_par_typ_par(i_PAR_TYP_TOP), 
        .i_sampled_bit_par(sampled_bit_TOP), .i_P_data_par(o_P_DATA_TOP), 
        .o_par_err_par(o_Parity_Error_TOP) );
  stop_check_unit STP_U ( .i_clk_stp(i_CLK_TOP), .i_rst_n_stp(n1), 
        .i_stp_chk_en_stp(stp_chk_en_TOP), .i_sampled_bit_stp(sampled_bit_TOP), 
        .i_errors_rst_stp(errors_rst_TOP), .o_stp_err_stp(o_Stop_Error_TOP) );
  strt_check_unit STR_U ( .i_strt_chk_en_strt(strt_chk_en_TOP), 
        .i_sampled_bit_strt(sampled_bit_TOP), .o_strt_glitch(strt_glitch_TOP)
         );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_RST_n_TOP), .Y(n2) );
endmodule


module Uart_TOP_data_width8_prescale_bits6 ( i_TX_clk, i_TX_IN_P, 
        i_TX_data_valid, i_RX_clk, i_RX_IN_S, i_RX_prescale, i_rst_n, i_par_en, 
        i_par_typ, o_TX_OUT_S, o_TX_Busy, o_RX_data_valid, o_RX_Stop_Error, 
        o_RX_Parity_Error, o_RX_OUT_P );
  input [7:0] i_TX_IN_P;
  input [5:0] i_RX_prescale;
  output [7:0] o_RX_OUT_P;
  input i_TX_clk, i_TX_data_valid, i_RX_clk, i_RX_IN_S, i_rst_n, i_par_en,
         i_par_typ;
  output o_TX_OUT_S, o_TX_Busy, o_RX_data_valid, o_RX_Stop_Error,
         o_RX_Parity_Error;
  wire   n1, n2;

  UART_TX_TOP_data_width_Top8 U_TX ( .i_clk_Top(i_TX_clk), .i_rst_n_Top(n1), 
        .i_DATA_VALID_Top(i_TX_data_valid), .i_P_DATA_Top(i_TX_IN_P), 
        .i_PAR_EN_Top(i_par_en), .i_PAR_TYP_Top(i_par_typ), .o_TX_OUT_Top(
        o_TX_OUT_S), .o_Busy_Top(o_TX_Busy) );
  Uart_RX_TOP_data_width_TOP8_prescale_bits_TOP6 U_RX ( .i_CLK_TOP(i_RX_clk), 
        .i_RST_n_TOP(n1), .i_RX_IN_TOP(i_RX_IN_S), .i_Prescale_TOP(
        i_RX_prescale), .i_PAR_EN_TOP(i_par_en), .i_PAR_TYP_TOP(i_par_typ), 
        .o_data_valid_TOP(o_RX_data_valid), .o_Stop_Error_TOP(o_RX_Stop_Error), 
        .o_Parity_Error_TOP(o_RX_Parity_Error), .o_P_DATA_TOP(o_RX_OUT_P) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_rst_n), .Y(n2) );
endmodule


module Data_synchronizer_data_width8_Num_Stg2 ( i_des_clk, i_des_rst_n, 
        i_bus_en, i_unsync_bus, o_sync_bus, o_en_pulse );
  input [7:0] i_unsync_bus;
  output [7:0] o_sync_bus;
  input i_des_clk, i_des_rst_n, i_bus_en;
  output o_en_pulse;
  wire   delayed_sync_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_en_reg;

  DFFRQX2M delayed_sync_en_reg ( .D(sync_en_reg[1]), .CK(i_des_clk), .RN(
        i_des_rst_n), .Q(delayed_sync_en) );
  DFFRQX2M \sync_en_reg_reg[1]  ( .D(sync_en_reg[0]), .CK(i_des_clk), .RN(
        i_des_rst_n), .Q(sync_en_reg[1]) );
  DFFRQX2M \o_sync_bus_reg[4]  ( .D(n5), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[4]) );
  DFFRQX2M \o_sync_bus_reg[5]  ( .D(n6), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[5]) );
  DFFRQX2M \o_sync_bus_reg[6]  ( .D(n7), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[6]) );
  DFFRQX2M \o_sync_bus_reg[7]  ( .D(n8), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[7]) );
  DFFRQX2M \o_sync_bus_reg[3]  ( .D(n4), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[3]) );
  DFFRQX2M \o_sync_bus_reg[2]  ( .D(n3), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[2]) );
  DFFRQX2M \o_sync_bus_reg[0]  ( .D(n9), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[0]) );
  DFFRQX2M \o_sync_bus_reg[1]  ( .D(n2), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_sync_bus[1]) );
  DFFRQX2M o_en_pulse_reg ( .D(n10), .CK(i_des_clk), .RN(i_des_rst_n), .Q(
        o_en_pulse) );
  DFFRQX2M \sync_en_reg_reg[0]  ( .D(i_bus_en), .CK(i_des_clk), .RN(
        i_des_rst_n), .Q(sync_en_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(delayed_sync_en), .B(sync_en_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(i_unsync_bus[1]), .A1(n10), .B0(o_sync_bus[1]), .B1(n1), 
        .Y(n2) );
  AO22X1M U6 ( .A0(i_unsync_bus[2]), .A1(n10), .B0(o_sync_bus[2]), .B1(n1), 
        .Y(n3) );
  AO22X1M U7 ( .A0(i_unsync_bus[3]), .A1(n10), .B0(o_sync_bus[3]), .B1(n1), 
        .Y(n4) );
  AO22X1M U8 ( .A0(i_unsync_bus[4]), .A1(n10), .B0(o_sync_bus[4]), .B1(n1), 
        .Y(n5) );
  AO22X1M U9 ( .A0(i_unsync_bus[5]), .A1(n10), .B0(o_sync_bus[5]), .B1(n1), 
        .Y(n6) );
  AO22X1M U10 ( .A0(i_unsync_bus[6]), .A1(n10), .B0(o_sync_bus[6]), .B1(n1), 
        .Y(n7) );
  AO22X1M U11 ( .A0(i_unsync_bus[7]), .A1(n10), .B0(o_sync_bus[7]), .B1(n1), 
        .Y(n8) );
  AO22X1M U12 ( .A0(i_unsync_bus[0]), .A1(n10), .B0(o_sync_bus[0]), .B1(n1), 
        .Y(n9) );
endmodule


module DF_SYNC_00000005_2_0 ( i_sync_clk_dff, i_rst_n_dff, i_Async_bus_dff, 
        o_sync_bus_dff );
  input [4:0] i_Async_bus_dff;
  output [4:0] o_sync_bus_dff;
  input i_sync_clk_dff, i_rst_n_dff;
  wire   \sync_flops[4][0] , \sync_flops[3][0] , \sync_flops[2][0] ,
         \sync_flops[1][0] , \sync_flops[0][0] ;

  DFFRQX2M \sync_flops_reg[4][1]  ( .D(\sync_flops[4][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[4]) );
  DFFRQX2M \sync_flops_reg[3][1]  ( .D(\sync_flops[3][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[3]) );
  DFFRQX2M \sync_flops_reg[2][1]  ( .D(\sync_flops[2][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[2]) );
  DFFRQX2M \sync_flops_reg[0][1]  ( .D(\sync_flops[0][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[0]) );
  DFFRQX2M \sync_flops_reg[1][1]  ( .D(\sync_flops[1][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[1]) );
  DFFRQX2M \sync_flops_reg[4][0]  ( .D(i_Async_bus_dff[4]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[4][0] ) );
  DFFRQX2M \sync_flops_reg[3][0]  ( .D(i_Async_bus_dff[3]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[3][0] ) );
  DFFRQX2M \sync_flops_reg[2][0]  ( .D(i_Async_bus_dff[2]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[2][0] ) );
  DFFRQX2M \sync_flops_reg[1][0]  ( .D(i_Async_bus_dff[1]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[1][0] ) );
  DFFRQX2M \sync_flops_reg[0][0]  ( .D(i_Async_bus_dff[0]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[0][0] ) );
endmodule


module DF_SYNC_00000005_2_1 ( i_sync_clk_dff, i_rst_n_dff, i_Async_bus_dff, 
        o_sync_bus_dff );
  input [4:0] i_Async_bus_dff;
  output [4:0] o_sync_bus_dff;
  input i_sync_clk_dff, i_rst_n_dff;
  wire   \sync_flops[4][0] , \sync_flops[3][0] , \sync_flops[2][0] ,
         \sync_flops[1][0] , \sync_flops[0][0] ;

  DFFRQX2M \sync_flops_reg[3][1]  ( .D(\sync_flops[3][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[3]) );
  DFFRQX2M \sync_flops_reg[2][1]  ( .D(\sync_flops[2][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[2]) );
  DFFRQX2M \sync_flops_reg[1][1]  ( .D(\sync_flops[1][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[1]) );
  DFFRQX2M \sync_flops_reg[4][1]  ( .D(\sync_flops[4][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[4]) );
  DFFRQX2M \sync_flops_reg[0][1]  ( .D(\sync_flops[0][0] ), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(o_sync_bus_dff[0]) );
  DFFRQX2M \sync_flops_reg[4][0]  ( .D(i_Async_bus_dff[4]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[4][0] ) );
  DFFRQX2M \sync_flops_reg[3][0]  ( .D(i_Async_bus_dff[3]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[3][0] ) );
  DFFRQX2M \sync_flops_reg[2][0]  ( .D(i_Async_bus_dff[2]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[2][0] ) );
  DFFRQX2M \sync_flops_reg[1][0]  ( .D(i_Async_bus_dff[1]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[1][0] ) );
  DFFRQX2M \sync_flops_reg[0][0]  ( .D(i_Async_bus_dff[0]), .CK(i_sync_clk_dff), .RN(i_rst_n_dff), .Q(\sync_flops[0][0] ) );
endmodule


module FIFO_MEM_CNTRL_data_width_mem8_fifo_depth_mem16_address_W4 ( 
        i_w_clk_mem, i_w_rst_n_mem, i_w_inc_mem, i_w_full_mem, i_w_addr_mem, 
        i_r_addr_mem, i_w_data_mem, o_r_data_mem );
  input [3:0] i_w_addr_mem;
  input [3:0] i_r_addr_mem;
  input [7:0] i_w_data_mem;
  output [7:0] o_r_data_mem;
  input i_w_clk_mem, i_w_rst_n_mem, i_w_inc_mem, i_w_full_mem;
  wire   N10, N11, N12, N13, \fifo_memory[15][7] , \fifo_memory[15][6] ,
         \fifo_memory[15][5] , \fifo_memory[15][4] , \fifo_memory[15][3] ,
         \fifo_memory[15][2] , \fifo_memory[15][1] , \fifo_memory[15][0] ,
         \fifo_memory[14][7] , \fifo_memory[14][6] , \fifo_memory[14][5] ,
         \fifo_memory[14][4] , \fifo_memory[14][3] , \fifo_memory[14][2] ,
         \fifo_memory[14][1] , \fifo_memory[14][0] , \fifo_memory[13][7] ,
         \fifo_memory[13][6] , \fifo_memory[13][5] , \fifo_memory[13][4] ,
         \fifo_memory[13][3] , \fifo_memory[13][2] , \fifo_memory[13][1] ,
         \fifo_memory[13][0] , \fifo_memory[12][7] , \fifo_memory[12][6] ,
         \fifo_memory[12][5] , \fifo_memory[12][4] , \fifo_memory[12][3] ,
         \fifo_memory[12][2] , \fifo_memory[12][1] , \fifo_memory[12][0] ,
         \fifo_memory[11][7] , \fifo_memory[11][6] , \fifo_memory[11][5] ,
         \fifo_memory[11][4] , \fifo_memory[11][3] , \fifo_memory[11][2] ,
         \fifo_memory[11][1] , \fifo_memory[11][0] , \fifo_memory[10][7] ,
         \fifo_memory[10][6] , \fifo_memory[10][5] , \fifo_memory[10][4] ,
         \fifo_memory[10][3] , \fifo_memory[10][2] , \fifo_memory[10][1] ,
         \fifo_memory[10][0] , \fifo_memory[9][7] , \fifo_memory[9][6] ,
         \fifo_memory[9][5] , \fifo_memory[9][4] , \fifo_memory[9][3] ,
         \fifo_memory[9][2] , \fifo_memory[9][1] , \fifo_memory[9][0] ,
         \fifo_memory[8][7] , \fifo_memory[8][6] , \fifo_memory[8][5] ,
         \fifo_memory[8][4] , \fifo_memory[8][3] , \fifo_memory[8][2] ,
         \fifo_memory[8][1] , \fifo_memory[8][0] , \fifo_memory[7][7] ,
         \fifo_memory[7][6] , \fifo_memory[7][5] , \fifo_memory[7][4] ,
         \fifo_memory[7][3] , \fifo_memory[7][2] , \fifo_memory[7][1] ,
         \fifo_memory[7][0] , \fifo_memory[6][7] , \fifo_memory[6][6] ,
         \fifo_memory[6][5] , \fifo_memory[6][4] , \fifo_memory[6][3] ,
         \fifo_memory[6][2] , \fifo_memory[6][1] , \fifo_memory[6][0] ,
         \fifo_memory[5][7] , \fifo_memory[5][6] , \fifo_memory[5][5] ,
         \fifo_memory[5][4] , \fifo_memory[5][3] , \fifo_memory[5][2] ,
         \fifo_memory[5][1] , \fifo_memory[5][0] , \fifo_memory[4][7] ,
         \fifo_memory[4][6] , \fifo_memory[4][5] , \fifo_memory[4][4] ,
         \fifo_memory[4][3] , \fifo_memory[4][2] , \fifo_memory[4][1] ,
         \fifo_memory[4][0] , \fifo_memory[3][7] , \fifo_memory[3][6] ,
         \fifo_memory[3][5] , \fifo_memory[3][4] , \fifo_memory[3][3] ,
         \fifo_memory[3][2] , \fifo_memory[3][1] , \fifo_memory[3][0] ,
         \fifo_memory[2][7] , \fifo_memory[2][6] , \fifo_memory[2][5] ,
         \fifo_memory[2][4] , \fifo_memory[2][3] , \fifo_memory[2][2] ,
         \fifo_memory[2][1] , \fifo_memory[2][0] , \fifo_memory[1][7] ,
         \fifo_memory[1][6] , \fifo_memory[1][5] , \fifo_memory[1][4] ,
         \fifo_memory[1][3] , \fifo_memory[1][2] , \fifo_memory[1][1] ,
         \fifo_memory[1][0] , \fifo_memory[0][7] , \fifo_memory[0][6] ,
         \fifo_memory[0][5] , \fifo_memory[0][4] , \fifo_memory[0][3] ,
         \fifo_memory[0][2] , \fifo_memory[0][1] , \fifo_memory[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290;
  assign N10 = i_r_addr_mem[0];
  assign N11 = i_r_addr_mem[1];
  assign N12 = i_r_addr_mem[2];
  assign N13 = i_r_addr_mem[3];

  DFFRQX2M \fifo_memory_reg[15][7]  ( .D(n165), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][7] ) );
  DFFRQX2M \fifo_memory_reg[15][6]  ( .D(n164), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][6] ) );
  DFFRQX2M \fifo_memory_reg[15][5]  ( .D(n163), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][5] ) );
  DFFRQX2M \fifo_memory_reg[15][4]  ( .D(n162), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][4] ) );
  DFFRQX2M \fifo_memory_reg[15][3]  ( .D(n161), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][3] ) );
  DFFRQX2M \fifo_memory_reg[15][2]  ( .D(n160), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][2] ) );
  DFFRQX2M \fifo_memory_reg[15][1]  ( .D(n159), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][1] ) );
  DFFRQX2M \fifo_memory_reg[15][0]  ( .D(n158), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[15][0] ) );
  DFFRQX2M \fifo_memory_reg[13][7]  ( .D(n149), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][7] ) );
  DFFRQX2M \fifo_memory_reg[13][6]  ( .D(n148), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][6] ) );
  DFFRQX2M \fifo_memory_reg[13][5]  ( .D(n147), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][5] ) );
  DFFRQX2M \fifo_memory_reg[13][4]  ( .D(n146), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][4] ) );
  DFFRQX2M \fifo_memory_reg[13][3]  ( .D(n145), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][3] ) );
  DFFRQX2M \fifo_memory_reg[13][2]  ( .D(n144), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][2] ) );
  DFFRQX2M \fifo_memory_reg[13][1]  ( .D(n143), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][1] ) );
  DFFRQX2M \fifo_memory_reg[13][0]  ( .D(n142), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[13][0] ) );
  DFFRQX2M \fifo_memory_reg[11][7]  ( .D(n133), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][7] ) );
  DFFRQX2M \fifo_memory_reg[11][6]  ( .D(n132), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][6] ) );
  DFFRQX2M \fifo_memory_reg[11][5]  ( .D(n131), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][5] ) );
  DFFRQX2M \fifo_memory_reg[11][4]  ( .D(n130), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][4] ) );
  DFFRQX2M \fifo_memory_reg[11][3]  ( .D(n129), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][3] ) );
  DFFRQX2M \fifo_memory_reg[11][2]  ( .D(n128), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][2] ) );
  DFFRQX2M \fifo_memory_reg[11][1]  ( .D(n127), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[11][1] ) );
  DFFRQX2M \fifo_memory_reg[11][0]  ( .D(n126), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[11][0] ) );
  DFFRQX2M \fifo_memory_reg[9][7]  ( .D(n117), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[9][7] ) );
  DFFRQX2M \fifo_memory_reg[9][6]  ( .D(n116), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[9][6] ) );
  DFFRQX2M \fifo_memory_reg[9][5]  ( .D(n115), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[9][5] ) );
  DFFRQX2M \fifo_memory_reg[9][4]  ( .D(n114), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[9][4] ) );
  DFFRQX2M \fifo_memory_reg[9][3]  ( .D(n113), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[9][3] ) );
  DFFRQX2M \fifo_memory_reg[9][2]  ( .D(n112), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[9][2] ) );
  DFFRQX2M \fifo_memory_reg[9][1]  ( .D(n111), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[9][1] ) );
  DFFRQX2M \fifo_memory_reg[9][0]  ( .D(n110), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[9][0] ) );
  DFFRQX2M \fifo_memory_reg[7][7]  ( .D(n101), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[7][7] ) );
  DFFRQX2M \fifo_memory_reg[7][6]  ( .D(n100), .CK(i_w_clk_mem), .RN(n271), 
        .Q(\fifo_memory[7][6] ) );
  DFFRQX2M \fifo_memory_reg[7][5]  ( .D(n99), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[7][5] ) );
  DFFRQX2M \fifo_memory_reg[7][4]  ( .D(n98), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[7][4] ) );
  DFFRQX2M \fifo_memory_reg[7][3]  ( .D(n97), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[7][3] ) );
  DFFRQX2M \fifo_memory_reg[7][2]  ( .D(n96), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[7][2] ) );
  DFFRQX2M \fifo_memory_reg[7][1]  ( .D(n95), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[7][1] ) );
  DFFRQX2M \fifo_memory_reg[7][0]  ( .D(n94), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[7][0] ) );
  DFFRQX2M \fifo_memory_reg[5][7]  ( .D(n85), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][7] ) );
  DFFRQX2M \fifo_memory_reg[5][6]  ( .D(n84), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][6] ) );
  DFFRQX2M \fifo_memory_reg[5][5]  ( .D(n83), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][5] ) );
  DFFRQX2M \fifo_memory_reg[5][4]  ( .D(n82), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][4] ) );
  DFFRQX2M \fifo_memory_reg[5][3]  ( .D(n81), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][3] ) );
  DFFRQX2M \fifo_memory_reg[5][2]  ( .D(n80), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][2] ) );
  DFFRQX2M \fifo_memory_reg[5][1]  ( .D(n79), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][1] ) );
  DFFRQX2M \fifo_memory_reg[5][0]  ( .D(n78), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[5][0] ) );
  DFFRQX2M \fifo_memory_reg[3][7]  ( .D(n69), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][7] ) );
  DFFRQX2M \fifo_memory_reg[3][6]  ( .D(n68), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][6] ) );
  DFFRQX2M \fifo_memory_reg[3][5]  ( .D(n67), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][5] ) );
  DFFRQX2M \fifo_memory_reg[3][4]  ( .D(n66), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][4] ) );
  DFFRQX2M \fifo_memory_reg[3][3]  ( .D(n65), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][3] ) );
  DFFRQX2M \fifo_memory_reg[3][2]  ( .D(n64), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][2] ) );
  DFFRQX2M \fifo_memory_reg[3][1]  ( .D(n63), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][1] ) );
  DFFRQX2M \fifo_memory_reg[3][0]  ( .D(n62), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[3][0] ) );
  DFFRQX2M \fifo_memory_reg[1][7]  ( .D(n53), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[1][7] ) );
  DFFRQX2M \fifo_memory_reg[1][6]  ( .D(n52), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[1][6] ) );
  DFFRQX2M \fifo_memory_reg[1][5]  ( .D(n51), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[1][5] ) );
  DFFRQX2M \fifo_memory_reg[1][4]  ( .D(n50), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[1][4] ) );
  DFFRQX2M \fifo_memory_reg[1][3]  ( .D(n49), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[1][3] ) );
  DFFRQX2M \fifo_memory_reg[1][2]  ( .D(n48), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[1][2] ) );
  DFFRQX2M \fifo_memory_reg[1][1]  ( .D(n47), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[1][1] ) );
  DFFRQX2M \fifo_memory_reg[1][0]  ( .D(n46), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[1][0] ) );
  DFFRQX2M \fifo_memory_reg[14][7]  ( .D(n157), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[14][7] ) );
  DFFRQX2M \fifo_memory_reg[14][6]  ( .D(n156), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[14][6] ) );
  DFFRQX2M \fifo_memory_reg[14][5]  ( .D(n155), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[14][5] ) );
  DFFRQX2M \fifo_memory_reg[14][4]  ( .D(n154), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[14][4] ) );
  DFFRQX2M \fifo_memory_reg[14][3]  ( .D(n153), .CK(i_w_clk_mem), .RN(n266), 
        .Q(\fifo_memory[14][3] ) );
  DFFRQX2M \fifo_memory_reg[14][2]  ( .D(n152), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[14][2] ) );
  DFFRQX2M \fifo_memory_reg[14][1]  ( .D(n151), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[14][1] ) );
  DFFRQX2M \fifo_memory_reg[14][0]  ( .D(n150), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[14][0] ) );
  DFFRQX2M \fifo_memory_reg[12][7]  ( .D(n141), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[12][7] ) );
  DFFRQX2M \fifo_memory_reg[12][6]  ( .D(n140), .CK(i_w_clk_mem), .RN(n267), 
        .Q(\fifo_memory[12][6] ) );
  DFFRQX2M \fifo_memory_reg[12][5]  ( .D(n139), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[12][5] ) );
  DFFRQX2M \fifo_memory_reg[12][4]  ( .D(n138), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[12][4] ) );
  DFFRQX2M \fifo_memory_reg[12][3]  ( .D(n137), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[12][3] ) );
  DFFRQX2M \fifo_memory_reg[12][2]  ( .D(n136), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[12][2] ) );
  DFFRQX2M \fifo_memory_reg[12][1]  ( .D(n135), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[12][1] ) );
  DFFRQX2M \fifo_memory_reg[12][0]  ( .D(n134), .CK(i_w_clk_mem), .RN(n268), 
        .Q(\fifo_memory[12][0] ) );
  DFFRQX2M \fifo_memory_reg[10][7]  ( .D(n125), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][7] ) );
  DFFRQX2M \fifo_memory_reg[10][6]  ( .D(n124), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][6] ) );
  DFFRQX2M \fifo_memory_reg[10][5]  ( .D(n123), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][5] ) );
  DFFRQX2M \fifo_memory_reg[10][4]  ( .D(n122), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][4] ) );
  DFFRQX2M \fifo_memory_reg[10][3]  ( .D(n121), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][3] ) );
  DFFRQX2M \fifo_memory_reg[10][2]  ( .D(n120), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][2] ) );
  DFFRQX2M \fifo_memory_reg[10][1]  ( .D(n119), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][1] ) );
  DFFRQX2M \fifo_memory_reg[10][0]  ( .D(n118), .CK(i_w_clk_mem), .RN(n269), 
        .Q(\fifo_memory[10][0] ) );
  DFFRQX2M \fifo_memory_reg[8][7]  ( .D(n109), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][7] ) );
  DFFRQX2M \fifo_memory_reg[8][6]  ( .D(n108), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][6] ) );
  DFFRQX2M \fifo_memory_reg[8][5]  ( .D(n107), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][5] ) );
  DFFRQX2M \fifo_memory_reg[8][4]  ( .D(n106), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][4] ) );
  DFFRQX2M \fifo_memory_reg[8][3]  ( .D(n105), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][3] ) );
  DFFRQX2M \fifo_memory_reg[8][2]  ( .D(n104), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][2] ) );
  DFFRQX2M \fifo_memory_reg[8][1]  ( .D(n103), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][1] ) );
  DFFRQX2M \fifo_memory_reg[8][0]  ( .D(n102), .CK(i_w_clk_mem), .RN(n270), 
        .Q(\fifo_memory[8][0] ) );
  DFFRQX2M \fifo_memory_reg[6][7]  ( .D(n93), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[6][7] ) );
  DFFRQX2M \fifo_memory_reg[6][6]  ( .D(n92), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[6][6] ) );
  DFFRQX2M \fifo_memory_reg[6][5]  ( .D(n91), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[6][5] ) );
  DFFRQX2M \fifo_memory_reg[6][4]  ( .D(n90), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[6][4] ) );
  DFFRQX2M \fifo_memory_reg[6][3]  ( .D(n89), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[6][3] ) );
  DFFRQX2M \fifo_memory_reg[6][2]  ( .D(n88), .CK(i_w_clk_mem), .RN(n271), .Q(
        \fifo_memory[6][2] ) );
  DFFRQX2M \fifo_memory_reg[6][1]  ( .D(n87), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[6][1] ) );
  DFFRQX2M \fifo_memory_reg[6][0]  ( .D(n86), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[6][0] ) );
  DFFRQX2M \fifo_memory_reg[4][7]  ( .D(n77), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[4][7] ) );
  DFFRQX2M \fifo_memory_reg[4][6]  ( .D(n76), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[4][6] ) );
  DFFRQX2M \fifo_memory_reg[4][5]  ( .D(n75), .CK(i_w_clk_mem), .RN(n272), .Q(
        \fifo_memory[4][5] ) );
  DFFRQX2M \fifo_memory_reg[4][4]  ( .D(n74), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[4][4] ) );
  DFFRQX2M \fifo_memory_reg[4][3]  ( .D(n73), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[4][3] ) );
  DFFRQX2M \fifo_memory_reg[4][2]  ( .D(n72), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[4][2] ) );
  DFFRQX2M \fifo_memory_reg[4][1]  ( .D(n71), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[4][1] ) );
  DFFRQX2M \fifo_memory_reg[4][0]  ( .D(n70), .CK(i_w_clk_mem), .RN(n273), .Q(
        \fifo_memory[4][0] ) );
  DFFRQX2M \fifo_memory_reg[2][7]  ( .D(n61), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][7] ) );
  DFFRQX2M \fifo_memory_reg[2][6]  ( .D(n60), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][6] ) );
  DFFRQX2M \fifo_memory_reg[2][5]  ( .D(n59), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][5] ) );
  DFFRQX2M \fifo_memory_reg[2][4]  ( .D(n58), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][4] ) );
  DFFRQX2M \fifo_memory_reg[2][3]  ( .D(n57), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][3] ) );
  DFFRQX2M \fifo_memory_reg[2][2]  ( .D(n56), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][2] ) );
  DFFRQX2M \fifo_memory_reg[2][1]  ( .D(n55), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][1] ) );
  DFFRQX2M \fifo_memory_reg[2][0]  ( .D(n54), .CK(i_w_clk_mem), .RN(n274), .Q(
        \fifo_memory[2][0] ) );
  DFFRQX2M \fifo_memory_reg[0][7]  ( .D(n45), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][7] ) );
  DFFRQX2M \fifo_memory_reg[0][6]  ( .D(n44), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][6] ) );
  DFFRQX2M \fifo_memory_reg[0][5]  ( .D(n43), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][5] ) );
  DFFRQX2M \fifo_memory_reg[0][4]  ( .D(n42), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][4] ) );
  DFFRQX2M \fifo_memory_reg[0][3]  ( .D(n41), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][3] ) );
  DFFRQX2M \fifo_memory_reg[0][2]  ( .D(n40), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][2] ) );
  DFFRQX2M \fifo_memory_reg[0][1]  ( .D(n39), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][1] ) );
  DFFRQX2M \fifo_memory_reg[0][0]  ( .D(n38), .CK(i_w_clk_mem), .RN(n275), .Q(
        \fifo_memory[0][0] ) );
  NOR2X2M U2 ( .A(n260), .B(n263), .Y(n1) );
  NOR2X2M U3 ( .A(n263), .B(N11), .Y(n2) );
  NOR2X2M U4 ( .A(n290), .B(i_w_addr_mem[2]), .Y(n17) );
  NOR2X2M U5 ( .A(i_w_addr_mem[1]), .B(i_w_addr_mem[2]), .Y(n12) );
  BUFX2M U6 ( .A(n276), .Y(n274) );
  BUFX2M U7 ( .A(n277), .Y(n273) );
  BUFX2M U8 ( .A(n277), .Y(n272) );
  BUFX2M U9 ( .A(n278), .Y(n271) );
  BUFX2M U10 ( .A(n278), .Y(n270) );
  BUFX2M U11 ( .A(n279), .Y(n269) );
  BUFX2M U12 ( .A(n279), .Y(n268) );
  BUFX2M U13 ( .A(n280), .Y(n267) );
  BUFX2M U14 ( .A(n280), .Y(n266) );
  BUFX2M U15 ( .A(n276), .Y(n275) );
  NOR2BX2M U16 ( .AN(i_w_inc_mem), .B(i_w_full_mem), .Y(n26) );
  BUFX2M U17 ( .A(i_w_rst_n_mem), .Y(n276) );
  BUFX2M U18 ( .A(i_w_rst_n_mem), .Y(n277) );
  BUFX2M U19 ( .A(i_w_rst_n_mem), .Y(n278) );
  BUFX2M U20 ( .A(i_w_rst_n_mem), .Y(n279) );
  BUFX2M U21 ( .A(i_w_rst_n_mem), .Y(n280) );
  NAND2X2M U22 ( .A(n15), .B(n12), .Y(n14) );
  NAND2X2M U23 ( .A(n17), .B(n13), .Y(n16) );
  NAND2X2M U24 ( .A(n17), .B(n15), .Y(n18) );
  NAND2X2M U25 ( .A(n20), .B(n13), .Y(n19) );
  NAND2X2M U26 ( .A(n20), .B(n15), .Y(n21) );
  NAND2X2M U27 ( .A(n23), .B(n13), .Y(n22) );
  NAND2X2M U28 ( .A(n23), .B(n15), .Y(n25) );
  NAND2X2M U29 ( .A(n28), .B(n12), .Y(n27) );
  NAND2X2M U30 ( .A(n30), .B(n12), .Y(n29) );
  NAND2X2M U31 ( .A(n28), .B(n17), .Y(n31) );
  NAND2X2M U32 ( .A(n30), .B(n17), .Y(n32) );
  NAND2X2M U33 ( .A(n28), .B(n20), .Y(n33) );
  NAND2X2M U34 ( .A(n30), .B(n20), .Y(n34) );
  NAND2X2M U35 ( .A(n28), .B(n23), .Y(n35) );
  NAND2X2M U36 ( .A(n30), .B(n23), .Y(n37) );
  NAND2X2M U37 ( .A(n12), .B(n13), .Y(n11) );
  AND2X2M U38 ( .A(n24), .B(n289), .Y(n13) );
  AND2X2M U39 ( .A(n36), .B(n289), .Y(n28) );
  INVX2M U40 ( .A(n3), .Y(n264) );
  INVX2M U41 ( .A(n4), .Y(n265) );
  INVX2M U42 ( .A(i_w_data_mem[0]), .Y(n281) );
  INVX2M U43 ( .A(i_w_data_mem[1]), .Y(n282) );
  INVX2M U44 ( .A(i_w_data_mem[2]), .Y(n283) );
  INVX2M U45 ( .A(i_w_data_mem[3]), .Y(n284) );
  INVX2M U46 ( .A(i_w_data_mem[4]), .Y(n285) );
  INVX2M U47 ( .A(i_w_data_mem[5]), .Y(n286) );
  INVX2M U48 ( .A(i_w_data_mem[6]), .Y(n287) );
  INVX2M U49 ( .A(i_w_data_mem[7]), .Y(n288) );
  OAI2BB2X1M U50 ( .B0(n11), .B1(n281), .A0N(\fifo_memory[0][0] ), .A1N(n11), 
        .Y(n38) );
  OAI2BB2X1M U51 ( .B0(n11), .B1(n282), .A0N(\fifo_memory[0][1] ), .A1N(n11), 
        .Y(n39) );
  OAI2BB2X1M U52 ( .B0(n11), .B1(n283), .A0N(\fifo_memory[0][2] ), .A1N(n11), 
        .Y(n40) );
  OAI2BB2X1M U53 ( .B0(n11), .B1(n284), .A0N(\fifo_memory[0][3] ), .A1N(n11), 
        .Y(n41) );
  OAI2BB2X1M U54 ( .B0(n11), .B1(n285), .A0N(\fifo_memory[0][4] ), .A1N(n11), 
        .Y(n42) );
  OAI2BB2X1M U55 ( .B0(n11), .B1(n286), .A0N(\fifo_memory[0][5] ), .A1N(n11), 
        .Y(n43) );
  OAI2BB2X1M U56 ( .B0(n11), .B1(n287), .A0N(\fifo_memory[0][6] ), .A1N(n11), 
        .Y(n44) );
  OAI2BB2X1M U57 ( .B0(n11), .B1(n288), .A0N(\fifo_memory[0][7] ), .A1N(n11), 
        .Y(n45) );
  OAI2BB2X1M U58 ( .B0(n281), .B1(n16), .A0N(\fifo_memory[2][0] ), .A1N(n16), 
        .Y(n54) );
  OAI2BB2X1M U59 ( .B0(n282), .B1(n16), .A0N(\fifo_memory[2][1] ), .A1N(n16), 
        .Y(n55) );
  OAI2BB2X1M U60 ( .B0(n283), .B1(n16), .A0N(\fifo_memory[2][2] ), .A1N(n16), 
        .Y(n56) );
  OAI2BB2X1M U61 ( .B0(n284), .B1(n16), .A0N(\fifo_memory[2][3] ), .A1N(n16), 
        .Y(n57) );
  OAI2BB2X1M U62 ( .B0(n285), .B1(n16), .A0N(\fifo_memory[2][4] ), .A1N(n16), 
        .Y(n58) );
  OAI2BB2X1M U63 ( .B0(n286), .B1(n16), .A0N(\fifo_memory[2][5] ), .A1N(n16), 
        .Y(n59) );
  OAI2BB2X1M U64 ( .B0(n287), .B1(n16), .A0N(\fifo_memory[2][6] ), .A1N(n16), 
        .Y(n60) );
  OAI2BB2X1M U65 ( .B0(n288), .B1(n16), .A0N(\fifo_memory[2][7] ), .A1N(n16), 
        .Y(n61) );
  OAI2BB2X1M U66 ( .B0(n281), .B1(n18), .A0N(\fifo_memory[3][0] ), .A1N(n18), 
        .Y(n62) );
  OAI2BB2X1M U67 ( .B0(n282), .B1(n18), .A0N(\fifo_memory[3][1] ), .A1N(n18), 
        .Y(n63) );
  OAI2BB2X1M U68 ( .B0(n283), .B1(n18), .A0N(\fifo_memory[3][2] ), .A1N(n18), 
        .Y(n64) );
  OAI2BB2X1M U69 ( .B0(n284), .B1(n18), .A0N(\fifo_memory[3][3] ), .A1N(n18), 
        .Y(n65) );
  OAI2BB2X1M U70 ( .B0(n285), .B1(n18), .A0N(\fifo_memory[3][4] ), .A1N(n18), 
        .Y(n66) );
  OAI2BB2X1M U71 ( .B0(n286), .B1(n18), .A0N(\fifo_memory[3][5] ), .A1N(n18), 
        .Y(n67) );
  OAI2BB2X1M U72 ( .B0(n287), .B1(n18), .A0N(\fifo_memory[3][6] ), .A1N(n18), 
        .Y(n68) );
  OAI2BB2X1M U73 ( .B0(n288), .B1(n18), .A0N(\fifo_memory[3][7] ), .A1N(n18), 
        .Y(n69) );
  OAI2BB2X1M U74 ( .B0(n281), .B1(n14), .A0N(\fifo_memory[1][0] ), .A1N(n14), 
        .Y(n46) );
  OAI2BB2X1M U75 ( .B0(n282), .B1(n14), .A0N(\fifo_memory[1][1] ), .A1N(n14), 
        .Y(n47) );
  OAI2BB2X1M U76 ( .B0(n283), .B1(n14), .A0N(\fifo_memory[1][2] ), .A1N(n14), 
        .Y(n48) );
  OAI2BB2X1M U77 ( .B0(n284), .B1(n14), .A0N(\fifo_memory[1][3] ), .A1N(n14), 
        .Y(n49) );
  OAI2BB2X1M U78 ( .B0(n285), .B1(n14), .A0N(\fifo_memory[1][4] ), .A1N(n14), 
        .Y(n50) );
  OAI2BB2X1M U79 ( .B0(n286), .B1(n14), .A0N(\fifo_memory[1][5] ), .A1N(n14), 
        .Y(n51) );
  OAI2BB2X1M U80 ( .B0(n287), .B1(n14), .A0N(\fifo_memory[1][6] ), .A1N(n14), 
        .Y(n52) );
  OAI2BB2X1M U81 ( .B0(n288), .B1(n14), .A0N(\fifo_memory[1][7] ), .A1N(n14), 
        .Y(n53) );
  OAI2BB2X1M U82 ( .B0(n281), .B1(n27), .A0N(\fifo_memory[8][0] ), .A1N(n27), 
        .Y(n102) );
  OAI2BB2X1M U83 ( .B0(n282), .B1(n27), .A0N(\fifo_memory[8][1] ), .A1N(n27), 
        .Y(n103) );
  OAI2BB2X1M U84 ( .B0(n283), .B1(n27), .A0N(\fifo_memory[8][2] ), .A1N(n27), 
        .Y(n104) );
  OAI2BB2X1M U85 ( .B0(n284), .B1(n27), .A0N(\fifo_memory[8][3] ), .A1N(n27), 
        .Y(n105) );
  OAI2BB2X1M U86 ( .B0(n285), .B1(n27), .A0N(\fifo_memory[8][4] ), .A1N(n27), 
        .Y(n106) );
  OAI2BB2X1M U87 ( .B0(n286), .B1(n27), .A0N(\fifo_memory[8][5] ), .A1N(n27), 
        .Y(n107) );
  OAI2BB2X1M U88 ( .B0(n287), .B1(n27), .A0N(\fifo_memory[8][6] ), .A1N(n27), 
        .Y(n108) );
  OAI2BB2X1M U89 ( .B0(n288), .B1(n27), .A0N(\fifo_memory[8][7] ), .A1N(n27), 
        .Y(n109) );
  OAI2BB2X1M U90 ( .B0(n281), .B1(n29), .A0N(\fifo_memory[9][0] ), .A1N(n29), 
        .Y(n110) );
  OAI2BB2X1M U91 ( .B0(n282), .B1(n29), .A0N(\fifo_memory[9][1] ), .A1N(n29), 
        .Y(n111) );
  OAI2BB2X1M U92 ( .B0(n283), .B1(n29), .A0N(\fifo_memory[9][2] ), .A1N(n29), 
        .Y(n112) );
  OAI2BB2X1M U93 ( .B0(n284), .B1(n29), .A0N(\fifo_memory[9][3] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U94 ( .B0(n285), .B1(n29), .A0N(\fifo_memory[9][4] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U95 ( .B0(n286), .B1(n29), .A0N(\fifo_memory[9][5] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U96 ( .B0(n287), .B1(n29), .A0N(\fifo_memory[9][6] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U97 ( .B0(n288), .B1(n29), .A0N(\fifo_memory[9][7] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U98 ( .B0(n281), .B1(n31), .A0N(\fifo_memory[10][0] ), .A1N(n31), 
        .Y(n118) );
  OAI2BB2X1M U99 ( .B0(n282), .B1(n31), .A0N(\fifo_memory[10][1] ), .A1N(n31), 
        .Y(n119) );
  OAI2BB2X1M U100 ( .B0(n283), .B1(n31), .A0N(\fifo_memory[10][2] ), .A1N(n31), 
        .Y(n120) );
  OAI2BB2X1M U101 ( .B0(n284), .B1(n31), .A0N(\fifo_memory[10][3] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U102 ( .B0(n285), .B1(n31), .A0N(\fifo_memory[10][4] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U103 ( .B0(n286), .B1(n31), .A0N(\fifo_memory[10][5] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U104 ( .B0(n287), .B1(n31), .A0N(\fifo_memory[10][6] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U105 ( .B0(n288), .B1(n31), .A0N(\fifo_memory[10][7] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U106 ( .B0(n281), .B1(n32), .A0N(\fifo_memory[11][0] ), .A1N(n32), 
        .Y(n126) );
  OAI2BB2X1M U107 ( .B0(n282), .B1(n32), .A0N(\fifo_memory[11][1] ), .A1N(n32), 
        .Y(n127) );
  OAI2BB2X1M U108 ( .B0(n283), .B1(n32), .A0N(\fifo_memory[11][2] ), .A1N(n32), 
        .Y(n128) );
  OAI2BB2X1M U109 ( .B0(n284), .B1(n32), .A0N(\fifo_memory[11][3] ), .A1N(n32), 
        .Y(n129) );
  OAI2BB2X1M U110 ( .B0(n285), .B1(n32), .A0N(\fifo_memory[11][4] ), .A1N(n32), 
        .Y(n130) );
  OAI2BB2X1M U111 ( .B0(n286), .B1(n32), .A0N(\fifo_memory[11][5] ), .A1N(n32), 
        .Y(n131) );
  OAI2BB2X1M U112 ( .B0(n287), .B1(n32), .A0N(\fifo_memory[11][6] ), .A1N(n32), 
        .Y(n132) );
  OAI2BB2X1M U113 ( .B0(n288), .B1(n32), .A0N(\fifo_memory[11][7] ), .A1N(n32), 
        .Y(n133) );
  OAI2BB2X1M U114 ( .B0(n281), .B1(n19), .A0N(\fifo_memory[4][0] ), .A1N(n19), 
        .Y(n70) );
  OAI2BB2X1M U115 ( .B0(n282), .B1(n19), .A0N(\fifo_memory[4][1] ), .A1N(n19), 
        .Y(n71) );
  OAI2BB2X1M U116 ( .B0(n283), .B1(n19), .A0N(\fifo_memory[4][2] ), .A1N(n19), 
        .Y(n72) );
  OAI2BB2X1M U117 ( .B0(n284), .B1(n19), .A0N(\fifo_memory[4][3] ), .A1N(n19), 
        .Y(n73) );
  OAI2BB2X1M U118 ( .B0(n285), .B1(n19), .A0N(\fifo_memory[4][4] ), .A1N(n19), 
        .Y(n74) );
  OAI2BB2X1M U119 ( .B0(n286), .B1(n19), .A0N(\fifo_memory[4][5] ), .A1N(n19), 
        .Y(n75) );
  OAI2BB2X1M U120 ( .B0(n287), .B1(n19), .A0N(\fifo_memory[4][6] ), .A1N(n19), 
        .Y(n76) );
  OAI2BB2X1M U121 ( .B0(n288), .B1(n19), .A0N(\fifo_memory[4][7] ), .A1N(n19), 
        .Y(n77) );
  OAI2BB2X1M U122 ( .B0(n281), .B1(n21), .A0N(\fifo_memory[5][0] ), .A1N(n21), 
        .Y(n78) );
  OAI2BB2X1M U123 ( .B0(n282), .B1(n21), .A0N(\fifo_memory[5][1] ), .A1N(n21), 
        .Y(n79) );
  OAI2BB2X1M U124 ( .B0(n283), .B1(n21), .A0N(\fifo_memory[5][2] ), .A1N(n21), 
        .Y(n80) );
  OAI2BB2X1M U125 ( .B0(n284), .B1(n21), .A0N(\fifo_memory[5][3] ), .A1N(n21), 
        .Y(n81) );
  OAI2BB2X1M U126 ( .B0(n285), .B1(n21), .A0N(\fifo_memory[5][4] ), .A1N(n21), 
        .Y(n82) );
  OAI2BB2X1M U127 ( .B0(n286), .B1(n21), .A0N(\fifo_memory[5][5] ), .A1N(n21), 
        .Y(n83) );
  OAI2BB2X1M U128 ( .B0(n287), .B1(n21), .A0N(\fifo_memory[5][6] ), .A1N(n21), 
        .Y(n84) );
  OAI2BB2X1M U129 ( .B0(n288), .B1(n21), .A0N(\fifo_memory[5][7] ), .A1N(n21), 
        .Y(n85) );
  OAI2BB2X1M U130 ( .B0(n281), .B1(n22), .A0N(\fifo_memory[6][0] ), .A1N(n22), 
        .Y(n86) );
  OAI2BB2X1M U131 ( .B0(n282), .B1(n22), .A0N(\fifo_memory[6][1] ), .A1N(n22), 
        .Y(n87) );
  OAI2BB2X1M U132 ( .B0(n283), .B1(n22), .A0N(\fifo_memory[6][2] ), .A1N(n22), 
        .Y(n88) );
  OAI2BB2X1M U133 ( .B0(n284), .B1(n22), .A0N(\fifo_memory[6][3] ), .A1N(n22), 
        .Y(n89) );
  OAI2BB2X1M U134 ( .B0(n285), .B1(n22), .A0N(\fifo_memory[6][4] ), .A1N(n22), 
        .Y(n90) );
  OAI2BB2X1M U135 ( .B0(n286), .B1(n22), .A0N(\fifo_memory[6][5] ), .A1N(n22), 
        .Y(n91) );
  OAI2BB2X1M U136 ( .B0(n287), .B1(n22), .A0N(\fifo_memory[6][6] ), .A1N(n22), 
        .Y(n92) );
  OAI2BB2X1M U137 ( .B0(n288), .B1(n22), .A0N(\fifo_memory[6][7] ), .A1N(n22), 
        .Y(n93) );
  OAI2BB2X1M U138 ( .B0(n281), .B1(n25), .A0N(\fifo_memory[7][0] ), .A1N(n25), 
        .Y(n94) );
  OAI2BB2X1M U139 ( .B0(n282), .B1(n25), .A0N(\fifo_memory[7][1] ), .A1N(n25), 
        .Y(n95) );
  OAI2BB2X1M U140 ( .B0(n283), .B1(n25), .A0N(\fifo_memory[7][2] ), .A1N(n25), 
        .Y(n96) );
  OAI2BB2X1M U141 ( .B0(n284), .B1(n25), .A0N(\fifo_memory[7][3] ), .A1N(n25), 
        .Y(n97) );
  OAI2BB2X1M U142 ( .B0(n285), .B1(n25), .A0N(\fifo_memory[7][4] ), .A1N(n25), 
        .Y(n98) );
  OAI2BB2X1M U143 ( .B0(n286), .B1(n25), .A0N(\fifo_memory[7][5] ), .A1N(n25), 
        .Y(n99) );
  OAI2BB2X1M U144 ( .B0(n287), .B1(n25), .A0N(\fifo_memory[7][6] ), .A1N(n25), 
        .Y(n100) );
  OAI2BB2X1M U145 ( .B0(n288), .B1(n25), .A0N(\fifo_memory[7][7] ), .A1N(n25), 
        .Y(n101) );
  OAI2BB2X1M U146 ( .B0(n281), .B1(n33), .A0N(\fifo_memory[12][0] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U147 ( .B0(n282), .B1(n33), .A0N(\fifo_memory[12][1] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U148 ( .B0(n283), .B1(n33), .A0N(\fifo_memory[12][2] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U149 ( .B0(n284), .B1(n33), .A0N(\fifo_memory[12][3] ), .A1N(n33), 
        .Y(n137) );
  OAI2BB2X1M U150 ( .B0(n285), .B1(n33), .A0N(\fifo_memory[12][4] ), .A1N(n33), 
        .Y(n138) );
  OAI2BB2X1M U151 ( .B0(n286), .B1(n33), .A0N(\fifo_memory[12][5] ), .A1N(n33), 
        .Y(n139) );
  OAI2BB2X1M U152 ( .B0(n287), .B1(n33), .A0N(\fifo_memory[12][6] ), .A1N(n33), 
        .Y(n140) );
  OAI2BB2X1M U153 ( .B0(n288), .B1(n33), .A0N(\fifo_memory[12][7] ), .A1N(n33), 
        .Y(n141) );
  OAI2BB2X1M U154 ( .B0(n281), .B1(n34), .A0N(\fifo_memory[13][0] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U155 ( .B0(n282), .B1(n34), .A0N(\fifo_memory[13][1] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U156 ( .B0(n283), .B1(n34), .A0N(\fifo_memory[13][2] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U157 ( .B0(n284), .B1(n34), .A0N(\fifo_memory[13][3] ), .A1N(n34), 
        .Y(n145) );
  OAI2BB2X1M U158 ( .B0(n285), .B1(n34), .A0N(\fifo_memory[13][4] ), .A1N(n34), 
        .Y(n146) );
  OAI2BB2X1M U159 ( .B0(n286), .B1(n34), .A0N(\fifo_memory[13][5] ), .A1N(n34), 
        .Y(n147) );
  OAI2BB2X1M U160 ( .B0(n287), .B1(n34), .A0N(\fifo_memory[13][6] ), .A1N(n34), 
        .Y(n148) );
  OAI2BB2X1M U161 ( .B0(n288), .B1(n34), .A0N(\fifo_memory[13][7] ), .A1N(n34), 
        .Y(n149) );
  OAI2BB2X1M U162 ( .B0(n281), .B1(n35), .A0N(\fifo_memory[14][0] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U163 ( .B0(n282), .B1(n35), .A0N(\fifo_memory[14][1] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U164 ( .B0(n283), .B1(n35), .A0N(\fifo_memory[14][2] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U165 ( .B0(n284), .B1(n35), .A0N(\fifo_memory[14][3] ), .A1N(n35), 
        .Y(n153) );
  OAI2BB2X1M U166 ( .B0(n285), .B1(n35), .A0N(\fifo_memory[14][4] ), .A1N(n35), 
        .Y(n154) );
  OAI2BB2X1M U167 ( .B0(n286), .B1(n35), .A0N(\fifo_memory[14][5] ), .A1N(n35), 
        .Y(n155) );
  OAI2BB2X1M U168 ( .B0(n287), .B1(n35), .A0N(\fifo_memory[14][6] ), .A1N(n35), 
        .Y(n156) );
  OAI2BB2X1M U169 ( .B0(n288), .B1(n35), .A0N(\fifo_memory[14][7] ), .A1N(n35), 
        .Y(n157) );
  OAI2BB2X1M U170 ( .B0(n281), .B1(n37), .A0N(\fifo_memory[15][0] ), .A1N(n37), 
        .Y(n158) );
  OAI2BB2X1M U171 ( .B0(n282), .B1(n37), .A0N(\fifo_memory[15][1] ), .A1N(n37), 
        .Y(n159) );
  OAI2BB2X1M U172 ( .B0(n283), .B1(n37), .A0N(\fifo_memory[15][2] ), .A1N(n37), 
        .Y(n160) );
  OAI2BB2X1M U173 ( .B0(n284), .B1(n37), .A0N(\fifo_memory[15][3] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U174 ( .B0(n285), .B1(n37), .A0N(\fifo_memory[15][4] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U175 ( .B0(n286), .B1(n37), .A0N(\fifo_memory[15][5] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U176 ( .B0(n287), .B1(n37), .A0N(\fifo_memory[15][6] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U177 ( .B0(n288), .B1(n37), .A0N(\fifo_memory[15][7] ), .A1N(n37), 
        .Y(n165) );
  AND2X2M U178 ( .A(n24), .B(i_w_addr_mem[0]), .Y(n15) );
  AND2X2M U179 ( .A(n36), .B(i_w_addr_mem[0]), .Y(n30) );
  NOR2BX2M U180 ( .AN(n26), .B(i_w_addr_mem[3]), .Y(n24) );
  AND2X2M U181 ( .A(i_w_addr_mem[3]), .B(n26), .Y(n36) );
  AND2X2M U182 ( .A(i_w_addr_mem[2]), .B(n290), .Y(n20) );
  AND2X2M U183 ( .A(i_w_addr_mem[2]), .B(i_w_addr_mem[1]), .Y(n23) );
  INVX2M U184 ( .A(i_w_addr_mem[1]), .Y(n290) );
  INVX2M U185 ( .A(i_w_addr_mem[0]), .Y(n289) );
  OR2X2M U186 ( .A(n260), .B(N10), .Y(n3) );
  OR2X2M U187 ( .A(N10), .B(N11), .Y(n4) );
  INVX2M U188 ( .A(N11), .Y(n260) );
  INVX2M U189 ( .A(N10), .Y(n263) );
  INVX2M U190 ( .A(N13), .Y(n262) );
  INVX2M U191 ( .A(N12), .Y(n261) );
  AOI22X1M U192 ( .A0(\fifo_memory[10][0] ), .A1(n264), .B0(
        \fifo_memory[11][0] ), .B1(n1), .Y(n6) );
  AOI22X1M U193 ( .A0(\fifo_memory[8][0] ), .A1(n265), .B0(\fifo_memory[9][0] ), .B1(n2), .Y(n5) );
  CLKNAND2X2M U194 ( .A(N13), .B(n261), .Y(n244) );
  AOI21X1M U195 ( .A0(n6), .A1(n5), .B0(n244), .Y(n171) );
  AOI22X1M U196 ( .A0(\fifo_memory[14][0] ), .A1(n264), .B0(
        \fifo_memory[15][0] ), .B1(n1), .Y(n8) );
  AOI22X1M U197 ( .A0(\fifo_memory[12][0] ), .A1(n265), .B0(
        \fifo_memory[13][0] ), .B1(n2), .Y(n7) );
  CLKNAND2X2M U198 ( .A(N13), .B(N12), .Y(n247) );
  AOI21X1M U199 ( .A0(n8), .A1(n7), .B0(n247), .Y(n170) );
  AOI22X1M U200 ( .A0(\fifo_memory[2][0] ), .A1(n264), .B0(\fifo_memory[3][0] ), .B1(n1), .Y(n10) );
  AOI22X1M U201 ( .A0(\fifo_memory[0][0] ), .A1(n265), .B0(\fifo_memory[1][0] ), .B1(n2), .Y(n9) );
  CLKNAND2X2M U202 ( .A(n261), .B(n262), .Y(n250) );
  AOI21X1M U203 ( .A0(n10), .A1(n9), .B0(n250), .Y(n169) );
  AOI22X1M U204 ( .A0(\fifo_memory[6][0] ), .A1(n264), .B0(\fifo_memory[7][0] ), .B1(n1), .Y(n167) );
  AOI22X1M U205 ( .A0(\fifo_memory[4][0] ), .A1(n265), .B0(\fifo_memory[5][0] ), .B1(n2), .Y(n166) );
  CLKNAND2X2M U206 ( .A(N12), .B(n262), .Y(n253) );
  AOI21X1M U207 ( .A0(n167), .A1(n166), .B0(n253), .Y(n168) );
  OR4X1M U208 ( .A(n171), .B(n170), .C(n169), .D(n168), .Y(o_r_data_mem[0]) );
  AOI22X1M U209 ( .A0(\fifo_memory[10][1] ), .A1(n264), .B0(
        \fifo_memory[11][1] ), .B1(n1), .Y(n173) );
  AOI22X1M U210 ( .A0(\fifo_memory[8][1] ), .A1(n265), .B0(\fifo_memory[9][1] ), .B1(n2), .Y(n172) );
  AOI21X1M U211 ( .A0(n173), .A1(n172), .B0(n244), .Y(n183) );
  AOI22X1M U212 ( .A0(\fifo_memory[14][1] ), .A1(n264), .B0(
        \fifo_memory[15][1] ), .B1(n1), .Y(n175) );
  AOI22X1M U213 ( .A0(\fifo_memory[12][1] ), .A1(n265), .B0(
        \fifo_memory[13][1] ), .B1(n2), .Y(n174) );
  AOI21X1M U214 ( .A0(n175), .A1(n174), .B0(n247), .Y(n182) );
  AOI22X1M U215 ( .A0(\fifo_memory[2][1] ), .A1(n264), .B0(\fifo_memory[3][1] ), .B1(n1), .Y(n177) );
  AOI22X1M U216 ( .A0(\fifo_memory[0][1] ), .A1(n265), .B0(\fifo_memory[1][1] ), .B1(n2), .Y(n176) );
  AOI21X1M U217 ( .A0(n177), .A1(n176), .B0(n250), .Y(n181) );
  AOI22X1M U218 ( .A0(\fifo_memory[6][1] ), .A1(n264), .B0(\fifo_memory[7][1] ), .B1(n1), .Y(n179) );
  AOI22X1M U219 ( .A0(\fifo_memory[4][1] ), .A1(n265), .B0(\fifo_memory[5][1] ), .B1(n2), .Y(n178) );
  AOI21X1M U220 ( .A0(n179), .A1(n178), .B0(n253), .Y(n180) );
  OR4X1M U221 ( .A(n183), .B(n182), .C(n181), .D(n180), .Y(o_r_data_mem[1]) );
  AOI22X1M U222 ( .A0(\fifo_memory[10][2] ), .A1(n264), .B0(
        \fifo_memory[11][2] ), .B1(n1), .Y(n185) );
  AOI22X1M U223 ( .A0(\fifo_memory[8][2] ), .A1(n265), .B0(\fifo_memory[9][2] ), .B1(n2), .Y(n184) );
  AOI21X1M U224 ( .A0(n185), .A1(n184), .B0(n244), .Y(n195) );
  AOI22X1M U225 ( .A0(\fifo_memory[14][2] ), .A1(n264), .B0(
        \fifo_memory[15][2] ), .B1(n1), .Y(n187) );
  AOI22X1M U226 ( .A0(\fifo_memory[12][2] ), .A1(n265), .B0(
        \fifo_memory[13][2] ), .B1(n2), .Y(n186) );
  AOI21X1M U227 ( .A0(n187), .A1(n186), .B0(n247), .Y(n194) );
  AOI22X1M U228 ( .A0(\fifo_memory[2][2] ), .A1(n264), .B0(\fifo_memory[3][2] ), .B1(n1), .Y(n189) );
  AOI22X1M U229 ( .A0(\fifo_memory[0][2] ), .A1(n265), .B0(\fifo_memory[1][2] ), .B1(n2), .Y(n188) );
  AOI21X1M U230 ( .A0(n189), .A1(n188), .B0(n250), .Y(n193) );
  AOI22X1M U231 ( .A0(\fifo_memory[6][2] ), .A1(n264), .B0(\fifo_memory[7][2] ), .B1(n1), .Y(n191) );
  AOI22X1M U232 ( .A0(\fifo_memory[4][2] ), .A1(n265), .B0(\fifo_memory[5][2] ), .B1(n2), .Y(n190) );
  AOI21X1M U233 ( .A0(n191), .A1(n190), .B0(n253), .Y(n192) );
  OR4X1M U234 ( .A(n195), .B(n194), .C(n193), .D(n192), .Y(o_r_data_mem[2]) );
  AOI22X1M U235 ( .A0(\fifo_memory[10][3] ), .A1(n264), .B0(
        \fifo_memory[11][3] ), .B1(n1), .Y(n197) );
  AOI22X1M U236 ( .A0(\fifo_memory[8][3] ), .A1(n265), .B0(\fifo_memory[9][3] ), .B1(n2), .Y(n196) );
  AOI21X1M U237 ( .A0(n197), .A1(n196), .B0(n244), .Y(n207) );
  AOI22X1M U238 ( .A0(\fifo_memory[14][3] ), .A1(n264), .B0(
        \fifo_memory[15][3] ), .B1(n1), .Y(n199) );
  AOI22X1M U239 ( .A0(\fifo_memory[12][3] ), .A1(n265), .B0(
        \fifo_memory[13][3] ), .B1(n2), .Y(n198) );
  AOI21X1M U240 ( .A0(n199), .A1(n198), .B0(n247), .Y(n206) );
  AOI22X1M U241 ( .A0(\fifo_memory[2][3] ), .A1(n264), .B0(\fifo_memory[3][3] ), .B1(n1), .Y(n201) );
  AOI22X1M U242 ( .A0(\fifo_memory[0][3] ), .A1(n265), .B0(\fifo_memory[1][3] ), .B1(n2), .Y(n200) );
  AOI21X1M U243 ( .A0(n201), .A1(n200), .B0(n250), .Y(n205) );
  AOI22X1M U244 ( .A0(\fifo_memory[6][3] ), .A1(n264), .B0(\fifo_memory[7][3] ), .B1(n1), .Y(n203) );
  AOI22X1M U245 ( .A0(\fifo_memory[4][3] ), .A1(n265), .B0(\fifo_memory[5][3] ), .B1(n2), .Y(n202) );
  AOI21X1M U246 ( .A0(n203), .A1(n202), .B0(n253), .Y(n204) );
  OR4X1M U247 ( .A(n207), .B(n206), .C(n205), .D(n204), .Y(o_r_data_mem[3]) );
  AOI22X1M U248 ( .A0(\fifo_memory[10][4] ), .A1(n264), .B0(
        \fifo_memory[11][4] ), .B1(n1), .Y(n209) );
  AOI22X1M U249 ( .A0(\fifo_memory[8][4] ), .A1(n265), .B0(\fifo_memory[9][4] ), .B1(n2), .Y(n208) );
  AOI21X1M U250 ( .A0(n209), .A1(n208), .B0(n244), .Y(n219) );
  AOI22X1M U251 ( .A0(\fifo_memory[14][4] ), .A1(n264), .B0(
        \fifo_memory[15][4] ), .B1(n1), .Y(n211) );
  AOI22X1M U252 ( .A0(\fifo_memory[12][4] ), .A1(n265), .B0(
        \fifo_memory[13][4] ), .B1(n2), .Y(n210) );
  AOI21X1M U253 ( .A0(n211), .A1(n210), .B0(n247), .Y(n218) );
  AOI22X1M U254 ( .A0(\fifo_memory[2][4] ), .A1(n264), .B0(\fifo_memory[3][4] ), .B1(n1), .Y(n213) );
  AOI22X1M U255 ( .A0(\fifo_memory[0][4] ), .A1(n265), .B0(\fifo_memory[1][4] ), .B1(n2), .Y(n212) );
  AOI21X1M U256 ( .A0(n213), .A1(n212), .B0(n250), .Y(n217) );
  AOI22X1M U257 ( .A0(\fifo_memory[6][4] ), .A1(n264), .B0(\fifo_memory[7][4] ), .B1(n1), .Y(n215) );
  AOI22X1M U258 ( .A0(\fifo_memory[4][4] ), .A1(n265), .B0(\fifo_memory[5][4] ), .B1(n2), .Y(n214) );
  AOI21X1M U259 ( .A0(n215), .A1(n214), .B0(n253), .Y(n216) );
  OR4X1M U260 ( .A(n219), .B(n218), .C(n217), .D(n216), .Y(o_r_data_mem[4]) );
  AOI22X1M U261 ( .A0(\fifo_memory[10][5] ), .A1(n264), .B0(
        \fifo_memory[11][5] ), .B1(n1), .Y(n221) );
  AOI22X1M U262 ( .A0(\fifo_memory[8][5] ), .A1(n265), .B0(\fifo_memory[9][5] ), .B1(n2), .Y(n220) );
  AOI21X1M U263 ( .A0(n221), .A1(n220), .B0(n244), .Y(n231) );
  AOI22X1M U264 ( .A0(\fifo_memory[14][5] ), .A1(n264), .B0(
        \fifo_memory[15][5] ), .B1(n1), .Y(n223) );
  AOI22X1M U265 ( .A0(\fifo_memory[12][5] ), .A1(n265), .B0(
        \fifo_memory[13][5] ), .B1(n2), .Y(n222) );
  AOI21X1M U266 ( .A0(n223), .A1(n222), .B0(n247), .Y(n230) );
  AOI22X1M U267 ( .A0(\fifo_memory[2][5] ), .A1(n264), .B0(\fifo_memory[3][5] ), .B1(n1), .Y(n225) );
  AOI22X1M U268 ( .A0(\fifo_memory[0][5] ), .A1(n265), .B0(\fifo_memory[1][5] ), .B1(n2), .Y(n224) );
  AOI21X1M U269 ( .A0(n225), .A1(n224), .B0(n250), .Y(n229) );
  AOI22X1M U270 ( .A0(\fifo_memory[6][5] ), .A1(n264), .B0(\fifo_memory[7][5] ), .B1(n1), .Y(n227) );
  AOI22X1M U271 ( .A0(\fifo_memory[4][5] ), .A1(n265), .B0(\fifo_memory[5][5] ), .B1(n2), .Y(n226) );
  AOI21X1M U272 ( .A0(n227), .A1(n226), .B0(n253), .Y(n228) );
  OR4X1M U273 ( .A(n231), .B(n230), .C(n229), .D(n228), .Y(o_r_data_mem[5]) );
  AOI22X1M U274 ( .A0(\fifo_memory[10][6] ), .A1(n264), .B0(
        \fifo_memory[11][6] ), .B1(n1), .Y(n233) );
  AOI22X1M U275 ( .A0(\fifo_memory[8][6] ), .A1(n265), .B0(\fifo_memory[9][6] ), .B1(n2), .Y(n232) );
  AOI21X1M U276 ( .A0(n233), .A1(n232), .B0(n244), .Y(n243) );
  AOI22X1M U277 ( .A0(\fifo_memory[14][6] ), .A1(n264), .B0(
        \fifo_memory[15][6] ), .B1(n1), .Y(n235) );
  AOI22X1M U278 ( .A0(\fifo_memory[12][6] ), .A1(n265), .B0(
        \fifo_memory[13][6] ), .B1(n2), .Y(n234) );
  AOI21X1M U279 ( .A0(n235), .A1(n234), .B0(n247), .Y(n242) );
  AOI22X1M U280 ( .A0(\fifo_memory[2][6] ), .A1(n264), .B0(\fifo_memory[3][6] ), .B1(n1), .Y(n237) );
  AOI22X1M U281 ( .A0(\fifo_memory[0][6] ), .A1(n265), .B0(\fifo_memory[1][6] ), .B1(n2), .Y(n236) );
  AOI21X1M U282 ( .A0(n237), .A1(n236), .B0(n250), .Y(n241) );
  AOI22X1M U283 ( .A0(\fifo_memory[6][6] ), .A1(n264), .B0(\fifo_memory[7][6] ), .B1(n1), .Y(n239) );
  AOI22X1M U284 ( .A0(\fifo_memory[4][6] ), .A1(n265), .B0(\fifo_memory[5][6] ), .B1(n2), .Y(n238) );
  AOI21X1M U285 ( .A0(n239), .A1(n238), .B0(n253), .Y(n240) );
  OR4X1M U286 ( .A(n243), .B(n242), .C(n241), .D(n240), .Y(o_r_data_mem[6]) );
  AOI22X1M U287 ( .A0(\fifo_memory[10][7] ), .A1(n264), .B0(
        \fifo_memory[11][7] ), .B1(n1), .Y(n246) );
  AOI22X1M U288 ( .A0(\fifo_memory[8][7] ), .A1(n265), .B0(\fifo_memory[9][7] ), .B1(n2), .Y(n245) );
  AOI21X1M U289 ( .A0(n246), .A1(n245), .B0(n244), .Y(n259) );
  AOI22X1M U290 ( .A0(\fifo_memory[14][7] ), .A1(n264), .B0(
        \fifo_memory[15][7] ), .B1(n1), .Y(n249) );
  AOI22X1M U291 ( .A0(\fifo_memory[12][7] ), .A1(n265), .B0(
        \fifo_memory[13][7] ), .B1(n2), .Y(n248) );
  AOI21X1M U292 ( .A0(n249), .A1(n248), .B0(n247), .Y(n258) );
  AOI22X1M U293 ( .A0(\fifo_memory[2][7] ), .A1(n264), .B0(\fifo_memory[3][7] ), .B1(n1), .Y(n252) );
  AOI22X1M U294 ( .A0(\fifo_memory[0][7] ), .A1(n265), .B0(\fifo_memory[1][7] ), .B1(n2), .Y(n251) );
  AOI21X1M U295 ( .A0(n252), .A1(n251), .B0(n250), .Y(n257) );
  AOI22X1M U296 ( .A0(\fifo_memory[6][7] ), .A1(n264), .B0(\fifo_memory[7][7] ), .B1(n1), .Y(n255) );
  AOI22X1M U297 ( .A0(\fifo_memory[4][7] ), .A1(n265), .B0(\fifo_memory[5][7] ), .B1(n2), .Y(n254) );
  AOI21X1M U298 ( .A0(n255), .A1(n254), .B0(n253), .Y(n256) );
  OR4X1M U299 ( .A(n259), .B(n258), .C(n257), .D(n256), .Y(o_r_data_mem[7]) );
endmodule


module FIFO_WR_4_00000005 ( i_w_clk_WR, i_w_rst_n_WR, i_w_inc_WR, 
        i_wq2_r_ptr_WR, o_w_ptr_WR, o_w_addr_WR, o_w_full_WR );
  input [4:0] i_wq2_r_ptr_WR;
  output [4:0] o_w_ptr_WR;
  output [3:0] o_w_addr_WR;
  input i_w_clk_WR, i_w_rst_n_WR, i_w_inc_WR;
  output o_w_full_WR;
  wire   \ptr_inBinary_w[4] , N3, N4, N5, N6, N7, N17, n1, n2, n3, n4, n5, n6,
         n7, n13, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, \r57/carry[4] , \r57/carry[3] , \r57/carry[2] ,
         n8, n9, n10, n11, n12;

  DFFRQX2M \ptr_inBinary_w_reg[4]  ( .D(n24), .CK(i_w_clk_WR), .RN(
        i_w_rst_n_WR), .Q(\ptr_inBinary_w[4] ) );
  DFFRQX2M \ptr_inBinary_w_reg[3]  ( .D(n23), .CK(i_w_clk_WR), .RN(
        i_w_rst_n_WR), .Q(o_w_addr_WR[3]) );
  DFFRQX2M \ptr_inBinary_w_reg[0]  ( .D(n30), .CK(i_w_clk_WR), .RN(
        i_w_rst_n_WR), .Q(o_w_addr_WR[0]) );
  DFFRQX2M \ptr_inBinary_w_reg[1]  ( .D(n21), .CK(i_w_clk_WR), .RN(
        i_w_rst_n_WR), .Q(o_w_addr_WR[1]) );
  DFFRQX2M \ptr_inBinary_w_reg[2]  ( .D(n22), .CK(i_w_clk_WR), .RN(
        i_w_rst_n_WR), .Q(o_w_addr_WR[2]) );
  DFFRQX2M \ptr_inGray_w_reg[3]  ( .D(n28), .CK(i_w_clk_WR), .RN(i_w_rst_n_WR), 
        .Q(o_w_ptr_WR[3]) );
  DFFRQX2M \ptr_inGray_w_reg[1]  ( .D(n26), .CK(i_w_clk_WR), .RN(i_w_rst_n_WR), 
        .Q(o_w_ptr_WR[1]) );
  DFFRQX2M \ptr_inGray_w_reg[4]  ( .D(n29), .CK(i_w_clk_WR), .RN(i_w_rst_n_WR), 
        .Q(o_w_ptr_WR[4]) );
  DFFRQX2M \ptr_inGray_w_reg[0]  ( .D(n25), .CK(i_w_clk_WR), .RN(i_w_rst_n_WR), 
        .Q(o_w_ptr_WR[0]) );
  DFFRQX2M \ptr_inGray_w_reg[2]  ( .D(n27), .CK(i_w_clk_WR), .RN(i_w_rst_n_WR), 
        .Q(o_w_ptr_WR[2]) );
  INVX2M U3 ( .A(n2), .Y(n8) );
  OAI222X1M U4 ( .A0(N4), .A1(n4), .B0(N5), .B1(n3), .C0(n8), .C1(n12), .Y(n26) );
  OAI222X1M U5 ( .A0(N6), .A1(n6), .B0(N7), .B1(n5), .C0(n8), .C1(n10), .Y(n28) );
  NAND2X2M U6 ( .A(i_w_inc_WR), .B(n1), .Y(n2) );
  NAND2X2M U7 ( .A(N4), .B(n8), .Y(n3) );
  NAND2X2M U8 ( .A(N5), .B(n8), .Y(n4) );
  NAND2X2M U9 ( .A(N6), .B(n8), .Y(n5) );
  NAND2X2M U10 ( .A(N7), .B(n8), .Y(n6) );
  INVX2M U11 ( .A(n1), .Y(o_w_full_WR) );
  OAI222X1M U12 ( .A0(N5), .A1(n5), .B0(N6), .B1(n4), .C0(n8), .C1(n11), .Y(
        n27) );
  INVX2M U13 ( .A(o_w_ptr_WR[2]), .Y(n11) );
  NAND4X2M U14 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n1) );
  XNOR2X2M U15 ( .A(o_w_ptr_WR[2]), .B(i_wq2_r_ptr_WR[2]), .Y(n17) );
  XNOR2X2M U16 ( .A(n10), .B(i_wq2_r_ptr_WR[3]), .Y(n16) );
  CLKXOR2X2M U17 ( .A(o_w_ptr_WR[4]), .B(i_wq2_r_ptr_WR[4]), .Y(n15) );
  OAI2BB2X1M U18 ( .B0(n2), .B1(o_w_addr_WR[0]), .A0N(o_w_addr_WR[0]), .A1N(n2), .Y(n30) );
  NOR2X2M U19 ( .A(n19), .B(n20), .Y(n18) );
  XNOR2X2M U20 ( .A(n12), .B(i_wq2_r_ptr_WR[1]), .Y(n19) );
  CLKXOR2X2M U21 ( .A(o_w_ptr_WR[0]), .B(i_wq2_r_ptr_WR[0]), .Y(n20) );
  OAI2BB1X2M U22 ( .A0N(o_w_addr_WR[1]), .A1N(n2), .B0(n3), .Y(n21) );
  OAI2BB1X2M U23 ( .A0N(o_w_addr_WR[2]), .A1N(n2), .B0(n4), .Y(n22) );
  OAI2BB1X2M U24 ( .A0N(o_w_addr_WR[3]), .A1N(n2), .B0(n5), .Y(n23) );
  OAI2BB1X2M U25 ( .A0N(\ptr_inBinary_w[4] ), .A1N(n2), .B0(n6), .Y(n24) );
  AO21XLM U26 ( .A0(n2), .A1(o_w_ptr_WR[4]), .B0(n13), .Y(n29) );
  OAI32X1M U27 ( .A0(n2), .A1(N7), .A2(n9), .B0(n6), .B1(N17), .Y(n13) );
  INVX2M U28 ( .A(N17), .Y(n9) );
  AO21XLM U29 ( .A0(n2), .A1(o_w_ptr_WR[0]), .B0(n7), .Y(n25) );
  OAI32X1M U30 ( .A0(n2), .A1(N4), .A2(o_w_addr_WR[0]), .B0(n3), .B1(N3), .Y(
        n7) );
  INVX2M U31 ( .A(o_w_ptr_WR[1]), .Y(n12) );
  INVX2M U32 ( .A(o_w_ptr_WR[3]), .Y(n10) );
  ADDHX1M U33 ( .A(\ptr_inBinary_w[4] ), .B(\r57/carry[4] ), .CO(N17), .S(N7)
         );
  ADDHX1M U34 ( .A(o_w_addr_WR[2]), .B(\r57/carry[2] ), .CO(\r57/carry[3] ), 
        .S(N5) );
  ADDHX1M U35 ( .A(o_w_addr_WR[1]), .B(o_w_addr_WR[0]), .CO(\r57/carry[2] ), 
        .S(N4) );
  ADDHX1M U36 ( .A(o_w_addr_WR[3]), .B(\r57/carry[3] ), .CO(\r57/carry[4] ), 
        .S(N6) );
  CLKINVX1M U37 ( .A(o_w_addr_WR[0]), .Y(N3) );
endmodule


module FIFO_RD_4_00000005 ( i_r_clk_RD, i_r_rst_n_RD, i_r_inc_RD, 
        i_rq2_w_ptr_RD, o_r_ptr_RD, o_r_addr_RD, o_r_empty_RD );
  input [4:0] i_rq2_w_ptr_RD;
  output [4:0] o_r_ptr_RD;
  output [3:0] o_r_addr_RD;
  input i_r_clk_RD, i_r_rst_n_RD, i_r_inc_RD;
  output o_r_empty_RD;
  wire   \ptr_inBinary_r[4] , N3, N4, N5, N6, N7, N17, n2, n3, n4, n5, n6, n7,
         n10, n12, n14, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         \r57/carry[4] , \r57/carry[3] , \r57/carry[2] , n1, n8, n9, n11, n13,
         n15, n17, n28, n29, n30, n31, n32, n33, n34;

  DFFRQX2M \ptr_inBinary_r_reg[4]  ( .D(n21), .CK(i_r_clk_RD), .RN(
        i_r_rst_n_RD), .Q(\ptr_inBinary_r[4] ) );
  DFFRQX2M \ptr_inGray_r_reg[0]  ( .D(n22), .CK(i_r_clk_RD), .RN(i_r_rst_n_RD), 
        .Q(o_r_ptr_RD[0]) );
  DFFRQX2M \ptr_inGray_r_reg[1]  ( .D(n23), .CK(i_r_clk_RD), .RN(i_r_rst_n_RD), 
        .Q(o_r_ptr_RD[1]) );
  DFFRQX2M \ptr_inGray_r_reg[4]  ( .D(n26), .CK(i_r_clk_RD), .RN(i_r_rst_n_RD), 
        .Q(o_r_ptr_RD[4]) );
  DFFRQX2M \ptr_inGray_r_reg[3]  ( .D(n25), .CK(i_r_clk_RD), .RN(i_r_rst_n_RD), 
        .Q(o_r_ptr_RD[3]) );
  DFFRQX2M \ptr_inGray_r_reg[2]  ( .D(n24), .CK(i_r_clk_RD), .RN(i_r_rst_n_RD), 
        .Q(o_r_ptr_RD[2]) );
  DFFRQX2M \ptr_inBinary_r_reg[3]  ( .D(n20), .CK(i_r_clk_RD), .RN(
        i_r_rst_n_RD), .Q(o_r_addr_RD[3]) );
  DFFRQX2M \ptr_inBinary_r_reg[2]  ( .D(n19), .CK(i_r_clk_RD), .RN(
        i_r_rst_n_RD), .Q(o_r_addr_RD[2]) );
  DFFRQX2M \ptr_inBinary_r_reg[0]  ( .D(n27), .CK(i_r_clk_RD), .RN(
        i_r_rst_n_RD), .Q(o_r_addr_RD[0]) );
  DFFRQX2M \ptr_inBinary_r_reg[1]  ( .D(n18), .CK(i_r_clk_RD), .RN(
        i_r_rst_n_RD), .Q(o_r_addr_RD[1]) );
  NOR2X2M U3 ( .A(n34), .B(n29), .Y(n2) );
  NOR2X2M U4 ( .A(n33), .B(n29), .Y(n3) );
  NOR2X2M U5 ( .A(n32), .B(n29), .Y(n4) );
  NOR2X2M U6 ( .A(n31), .B(n29), .Y(n5) );
  INVX2M U7 ( .A(n7), .Y(n29) );
  INVX2M U8 ( .A(N7), .Y(n31) );
  INVX2M U9 ( .A(N5), .Y(n33) );
  INVX2M U10 ( .A(N6), .Y(n32) );
  INVX2M U11 ( .A(N4), .Y(n34) );
  NOR2BX2M U12 ( .AN(i_r_inc_RD), .B(o_r_empty_RD), .Y(n7) );
  OAI2BB2X1M U13 ( .B0(n29), .B1(o_r_addr_RD[0]), .A0N(o_r_addr_RD[0]), .A1N(
        n29), .Y(n27) );
  OAI2BB1X2M U14 ( .A0N(o_r_ptr_RD[0]), .A1N(n29), .B0(n6), .Y(n22) );
  AOI32X1M U15 ( .A0(n7), .A1(n34), .A2(N3), .B0(n2), .B1(o_r_addr_RD[0]), .Y(
        n6) );
  OAI2BB1X2M U16 ( .A0N(o_r_ptr_RD[4]), .A1N(n29), .B0(n16), .Y(n26) );
  AOI32X1M U17 ( .A0(n7), .A1(n31), .A2(N17), .B0(n5), .B1(n30), .Y(n16) );
  INVX2M U18 ( .A(N17), .Y(n30) );
  OAI2BB1X2M U19 ( .A0N(o_r_ptr_RD[1]), .A1N(n29), .B0(n10), .Y(n23) );
  AOI22X1M U20 ( .A0(n2), .A1(n33), .B0(n3), .B1(n34), .Y(n10) );
  OAI2BB1X2M U21 ( .A0N(o_r_ptr_RD[2]), .A1N(n29), .B0(n12), .Y(n24) );
  AOI22X1M U22 ( .A0(n3), .A1(n32), .B0(n4), .B1(n33), .Y(n12) );
  OAI2BB1X2M U23 ( .A0N(o_r_ptr_RD[3]), .A1N(n29), .B0(n14), .Y(n25) );
  AOI22X1M U24 ( .A0(n4), .A1(n31), .B0(n5), .B1(n32), .Y(n14) );
  AO21XLM U25 ( .A0(o_r_addr_RD[1]), .A1(n29), .B0(n2), .Y(n18) );
  AO21XLM U26 ( .A0(o_r_addr_RD[2]), .A1(n29), .B0(n3), .Y(n19) );
  AO21XLM U27 ( .A0(o_r_addr_RD[3]), .A1(n29), .B0(n4), .Y(n20) );
  AO21XLM U28 ( .A0(\ptr_inBinary_r[4] ), .A1(n29), .B0(n5), .Y(n21) );
  ADDHX1M U29 ( .A(\ptr_inBinary_r[4] ), .B(\r57/carry[4] ), .CO(N17), .S(N7)
         );
  ADDHX1M U30 ( .A(o_r_addr_RD[2]), .B(\r57/carry[2] ), .CO(\r57/carry[3] ), 
        .S(N5) );
  ADDHX1M U31 ( .A(o_r_addr_RD[3]), .B(\r57/carry[3] ), .CO(\r57/carry[4] ), 
        .S(N6) );
  ADDHX1M U32 ( .A(o_r_addr_RD[1]), .B(o_r_addr_RD[0]), .CO(\r57/carry[2] ), 
        .S(N4) );
  CLKINVX1M U33 ( .A(o_r_addr_RD[0]), .Y(N3) );
  CLKXOR2X2M U34 ( .A(o_r_ptr_RD[2]), .B(i_rq2_w_ptr_RD[2]), .Y(n28) );
  NOR2BX1M U35 ( .AN(o_r_ptr_RD[0]), .B(i_rq2_w_ptr_RD[0]), .Y(n1) );
  OAI2B2X1M U36 ( .A1N(i_rq2_w_ptr_RD[1]), .A0(n1), .B0(o_r_ptr_RD[1]), .B1(n1), .Y(n11) );
  NOR2BX1M U37 ( .AN(i_rq2_w_ptr_RD[0]), .B(o_r_ptr_RD[0]), .Y(n8) );
  OAI2B2X1M U38 ( .A1N(o_r_ptr_RD[1]), .A0(n8), .B0(i_rq2_w_ptr_RD[1]), .B1(n8), .Y(n9) );
  CLKNAND2X2M U39 ( .A(n11), .B(n9), .Y(n17) );
  CLKXOR2X2M U40 ( .A(o_r_ptr_RD[3]), .B(i_rq2_w_ptr_RD[3]), .Y(n15) );
  CLKXOR2X2M U41 ( .A(o_r_ptr_RD[4]), .B(i_rq2_w_ptr_RD[4]), .Y(n13) );
  NOR4X1M U42 ( .A(n28), .B(n17), .C(n15), .D(n13), .Y(o_r_empty_RD) );
endmodule


module Async_FIFO_Top_data_width8_fifo_depth16_NUM_STG_DFF2 ( i_w_clk, 
        i_w_rst_n, i_w_inc, i_WR_DATA, i_r_clk, i_r_rst_n, i_r_inc, o_RD_DATA, 
        o_EMPTY, o_FULL );
  input [7:0] i_WR_DATA;
  output [7:0] o_RD_DATA;
  input i_w_clk, i_w_rst_n, i_w_inc, i_r_clk, i_r_rst_n, i_r_inc;
  output o_EMPTY, o_FULL;
  wire   n1, n2, n3, n4;
  wire   [4:0] w_ptr;
  wire   [4:0] rq2_w_ptr;
  wire   [4:0] r_ptr;
  wire   [4:0] wq2_r_ptr;
  wire   [3:0] w_addr;
  wire   [3:0] r_addr;

  DF_SYNC_00000005_2_0 sync_w2r ( .i_sync_clk_dff(i_r_clk), .i_rst_n_dff(n3), 
        .i_Async_bus_dff(w_ptr), .o_sync_bus_dff(rq2_w_ptr) );
  DF_SYNC_00000005_2_1 sync_r2w ( .i_sync_clk_dff(i_w_clk), .i_rst_n_dff(n1), 
        .i_Async_bus_dff(r_ptr), .o_sync_bus_dff(wq2_r_ptr) );
  FIFO_MEM_CNTRL_data_width_mem8_fifo_depth_mem16_address_W4 FIFO_MEMO ( 
        .i_w_clk_mem(i_w_clk), .i_w_rst_n_mem(n1), .i_w_inc_mem(i_w_inc), 
        .i_w_full_mem(o_FULL), .i_w_addr_mem(w_addr), .i_r_addr_mem(r_addr), 
        .i_w_data_mem(i_WR_DATA), .o_r_data_mem(o_RD_DATA) );
  FIFO_WR_4_00000005 FIFO_WRITE ( .i_w_clk_WR(i_w_clk), .i_w_rst_n_WR(n1), 
        .i_w_inc_WR(i_w_inc), .i_wq2_r_ptr_WR(wq2_r_ptr), .o_w_ptr_WR(w_ptr), 
        .o_w_addr_WR(w_addr), .o_w_full_WR(o_FULL) );
  FIFO_RD_4_00000005 FIFO_READ ( .i_r_clk_RD(i_r_clk), .i_r_rst_n_RD(n3), 
        .i_r_inc_RD(i_r_inc), .i_rq2_w_ptr_RD(rq2_w_ptr), .o_r_ptr_RD(r_ptr), 
        .o_r_addr_RD(r_addr), .o_r_empty_RD(o_EMPTY) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_w_rst_n), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(i_r_rst_n), .Y(n4) );
endmodule


module SYS_TOP ( i_Ref_Clk, i_Uart_Clk, i_RST_n, i_RX_IN_sys, o_Stop_Error_sys, 
        o_Parity_Error_sys, o_TX_OUT_sys );
  input i_Ref_Clk, i_Uart_Clk, i_RST_n, i_RX_IN_sys;
  output o_Stop_Error_sys, o_Parity_Error_sys, o_TX_OUT_sys;
  wire   Gate_EN, ALU_CLK, Sync_Rst_1, RdEn, WrEn, Rd_D_vid, EN, OUT_Valid,
         Synced_RX_VLD, Fifo_full, WR_INC, Sync_Rst_2, TX_clk, RX_clk, busy,
         RD_INC, unSync_RX_VLD, Fifo_empty, n1, n2, n3, n4, n5;
  wire   [7:0] Wr_D;
  wire   [3:0] Addr;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   [7:0] UART_Config;
  wire   [7:0] Div_Ratio;
  wire   [7:0] Rd_D;
  wire   [3:0] Fun;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Synced_RX_D;
  wire   [7:0] WR_DATA;
  wire   [7:0] Rx_Div_ratio;
  wire   [7:0] RD_DATA;
  wire   [7:0] unSync_RX_D;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  CLK_Gating_unit GATED_CLK ( .i_ref_clk(i_Ref_Clk), .i_gate_en(Gate_EN), 
        .o_gated_clk(ALU_CLK) );
  rst_sync_unit_Num_stg2_0 RST_SYNC_1 ( .i_clk(i_Ref_Clk), .i_rst_n_Async(
        i_RST_n), .o_rst_n_Sync(Sync_Rst_1) );
  Reg_File_R_Width8_R_Depth16_R_Adderss_Bits4 SYS_REG_FILE ( .i_clk_reg(
        i_Ref_Clk), .i_rst_n_reg(n4), .i_RdEn_reg(RdEn), .i_WrEn_reg(WrEn), 
        .i_WrData_reg(Wr_D), .i_Address_reg(Addr), .o_REG0_reg(OP_A), 
        .o_REG1_reg(OP_B), .o_REG2_reg(UART_Config), .o_REG3_reg(Div_Ratio), 
        .o_Valid_reg(Rd_D_vid), .o_RdData_reg(Rd_D) );
  Alu_unit_op_width8 ALU ( .i_clk_alu(ALU_CLK), .i_rst_n_alu(n4), .i_OP_A_alu(
        OP_A), .i_OP_B_alu(OP_B), .i_Enable_alu(EN), .i_ALU_FUN_alu(Fun), 
        .o_ALU_OUT(ALU_OUT), .o_VALID_alu(OUT_Valid) );
  Sys_Ctrl_Unit_data_width8_Addr_Bits4 System_brain ( .i_ref_clk(i_Ref_Clk), 
        .i_rst_n(n4), .i_ALU_OUT(ALU_OUT), .i_VALID_alu(OUT_Valid), 
        .i_Synced_Rx_D(Synced_RX_D), .i_Synced_RX_VLD(Synced_RX_VLD), 
        .i_RdData(Rd_D), .i_Valid(Rd_D_vid), .i_fifo_f(Fifo_full), 
        .o_Gated_clk_en(Gate_EN), .o_Alu_EN(EN), .o_ALU_FUN(Fun), 
        .o_TX_P_DATA(WR_DATA), .o_TX_D_VLD(WR_INC), .o_Addr(Addr), .o_Wr_D(
        Wr_D), .o_WrEn(WrEn), .o_RdEn(RdEn) );
  rst_sync_unit_Num_stg2_1 RST_SYNC_2 ( .i_clk(i_Uart_Clk), .i_rst_n_Async(
        i_RST_n), .o_rst_n_Sync(Sync_Rst_2) );
  CLK_Div_mux_prescale_bits6 Div_mux ( .i_config_prescale(UART_Config[7:2]), 
        .o_config_prescale({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        Rx_Div_ratio[5:0]}) );
  CLK_Div_Unit_max_div_ratio256_div_bits8_0 TX_CLK_G ( .i_ref_clk(i_Uart_Clk), 
        .i_rst_n(n2), .i_clk_en(1'b1), .i_div_ratio(Div_Ratio), .o_div_clk(
        TX_clk) );
  CLK_Div_Unit_max_div_ratio256_div_bits8_1 RX_CLK_G ( .i_ref_clk(i_Uart_Clk), 
        .i_rst_n(n2), .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 
        Rx_Div_ratio[5:0]}), .o_div_clk(RX_clk) );
  pulse_gen_unit Pulse_G ( .i_clk_PG(TX_clk), .i_rst_n_PG(n2), .i_lvl_sig_PG(
        busy), .o_pulse_sig_PG(RD_INC) );
  Uart_TOP_data_width8_prescale_bits6 UART ( .i_TX_clk(TX_clk), .i_TX_IN_P(
        RD_DATA), .i_TX_data_valid(n1), .i_RX_clk(RX_clk), .i_RX_IN_S(
        i_RX_IN_sys), .i_RX_prescale(UART_Config[7:2]), .i_rst_n(n2), 
        .i_par_en(UART_Config[0]), .i_par_typ(UART_Config[1]), .o_TX_OUT_S(
        o_TX_OUT_sys), .o_TX_Busy(busy), .o_RX_data_valid(unSync_RX_VLD), 
        .o_RX_Stop_Error(o_Stop_Error_sys), .o_RX_Parity_Error(
        o_Parity_Error_sys), .o_RX_OUT_P(unSync_RX_D) );
  Data_synchronizer_data_width8_Num_Stg2 Data_Sync ( .i_des_clk(i_Ref_Clk), 
        .i_des_rst_n(n4), .i_bus_en(unSync_RX_VLD), .i_unsync_bus(unSync_RX_D), 
        .o_sync_bus(Synced_RX_D), .o_en_pulse(Synced_RX_VLD) );
  Async_FIFO_Top_data_width8_fifo_depth16_NUM_STG_DFF2 FIFO ( .i_w_clk(
        i_Ref_Clk), .i_w_rst_n(n4), .i_w_inc(WR_INC), .i_WR_DATA(WR_DATA), 
        .i_r_clk(TX_clk), .i_r_rst_n(n2), .i_r_inc(RD_INC), .o_RD_DATA(RD_DATA), .o_EMPTY(Fifo_empty), .o_FULL(Fifo_full) );
  INVX2M U2 ( .A(n3), .Y(n2) );
  INVX2M U3 ( .A(Fifo_empty), .Y(n1) );
  INVX4M U4 ( .A(n5), .Y(n4) );
  INVX2M U5 ( .A(Sync_Rst_1), .Y(n5) );
  INVX2M U6 ( .A(Sync_Rst_2), .Y(n3) );
endmodule

