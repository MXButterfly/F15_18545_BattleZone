//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Wed Oct 28 15:20:36 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target progBram_wrapper.bd
//Design      : progBram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module progBram_wrapper
   (address,
    clk,
    dataOut);
  input address;
  input clk;
  output [7:0]dataOut;

  wire address;
  wire clk;
  wire [7:0]dataOut;

  progBram progBram_i
       (.address(address),
        .clk(clk),
        .dataOut(dataOut));
endmodule
