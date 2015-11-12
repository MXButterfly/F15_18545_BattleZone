//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Nov 12 18:03:04 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target mathBoxROM_wrapper.bd
//Design      : mathBoxROM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mathBoxROM_wrapper
   (addr_a,
    addr_b,
    clk,
    data_a,
    data_b);
  input [9:0]addr_a;
  input [9:0]addr_b;
  input clk;
  output [7:0]data_a;
  output [7:0]data_b;

  wire [9:0]addr_a;
  wire [9:0]addr_b;
  wire clk;
  wire [7:0]data_a;
  wire [7:0]data_b;

  mathBoxROM mathBoxROM_i
       (.addr_a(addr_a),
        .addr_b(addr_b),
        .clk(clk),
        .data_a(data_a),
        .data_b(data_b));
endmodule
