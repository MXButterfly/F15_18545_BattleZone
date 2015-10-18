//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Oct 16 16:46:19 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target blockRam_wrapper.bd
//Design      : blockRam_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module blockRam_wrapper
   (addr_a,
    addr_b,
    clear_in,
    clk,
    color_in,
    color_out,
    color_out_b,
    en,
    en_b,
    write_en,
    write_en_b);
  input [18:0]addr_a;
  input [18:0]addr_b;
  input [3:0]clear_in;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  output [3:0]color_out_b;
  input en;
  input en_b;
  input write_en;
  input write_en_b;

  wire [18:0]addr_a;
  wire [18:0]addr_b;
  wire [3:0]clear_in;
  wire clk;
  wire [3:0]color_in;
  wire [3:0]color_out;
  wire [3:0]color_out_b;
  wire en;
  wire en_b;
  wire write_en;
  wire write_en_b;

  blockRam blockRam_i
       (.addr_a(addr_a),
        .addr_b(addr_b),
        .clear_in(clear_in),
        .clk(clk),
        .color_in(color_in),
        .color_out(color_out),
        .color_out_b(color_out_b),
        .en(en),
        .en_b(en_b),
        .write_en(write_en),
        .write_en_b(write_en_b));
endmodule
