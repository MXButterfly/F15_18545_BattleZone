//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Tue Dec  1 23:06:00 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target vram_2_wrapper.bd
//Design      : vram_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module vram_2_wrapper
   (addr,
    clk,
    dataIn,
    dataOut,
    we);
  input [12:0]addr;
  input clk;
  input [7:0]dataIn;
  output [7:0]dataOut;
  input [0:0]we;

  wire [12:0]addr;
  wire clk;
  wire [7:0]dataIn;
  wire [7:0]dataOut;
  wire [0:0]we;

  vram_2 vram_2_i
       (.addr(addr),
        .clk(clk),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .we(we));
endmodule
