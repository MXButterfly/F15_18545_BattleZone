//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Nov  5 21:14:30 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target fbRAM_wrapper.bd
//Design      : fbRAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fbRAM_wrapper
   (addr_a,
    clk,
    color_in,
    color_out,
    en,
    write_en);
  input [18:0]addr_a;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  input en;
  input write_en;

  wire [18:0]addr_a;
  wire clk;
  wire [3:0]color_in;
  wire [3:0]color_out;
  wire en;
  wire write_en;

  fbRAM fbRAM_i
       (.addr_a(addr_a),
        .clk(clk),
        .color_in(color_in),
        .color_out(color_out),
        .en(en),
        .write_en(write_en));
endmodule
