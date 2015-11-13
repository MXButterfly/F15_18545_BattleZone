//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Nov 12 17:11:51 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target bramDualPort_wrapper.bd
//Design      : bramDualPort_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bramDualPort_wrapper
   (addra,
    addrb,
    clk,
    color_in,
    color_out,
    en_a,
    en_b,
    wen_a,
    wen_b);
  input [18:0]addra;
  input [18:0]addrb;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  input en_a;
  input en_b;
  input wen_a;
  input wen_b;

  wire [18:0]addra;
  wire [18:0]addrb;
  wire clk;
  wire [3:0]color_in;
  wire [3:0]color_out;
  wire en_a;
  wire en_b;
  wire wen_a;
  wire wen_b;

  bramDualPort bramDualPort_i
       (.addra(addra),
        .addrb(addrb),
        .clk(clk),
        .color_in(color_in),
        .color_out(color_out),
        .en_a(en_a),
        .en_b(en_b),
        .wen_a(wen_a),
        .wen_b(wen_b));
endmodule
