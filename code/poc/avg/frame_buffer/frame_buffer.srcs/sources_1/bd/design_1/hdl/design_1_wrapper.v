//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Sep 25 16:36:52 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (addr_a,
    clk,
    color_in,
    color_out,
    en,
    rst_l,
    write_en);
  input [18:0]addr_a;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  input en;
  input rst_l;
  input write_en;

  wire [18:0]addr_a;
  wire clk;
  wire [3:0]color_in;
  wire [3:0]color_out;
  wire en;
  wire rst_l;
  wire write_en;

  design_1 design_1_i
       (.addr_a(addr_a),
        .clk(clk),
        .color_in(color_in),
        .color_out(color_out),
        .en(en),
        .rst_l(rst_l),
        .write_en(write_en));
endmodule
