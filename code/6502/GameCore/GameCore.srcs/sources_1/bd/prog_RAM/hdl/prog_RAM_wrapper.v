//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Tue Dec  1 22:19:26 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target prog_RAM_wrapper.bd
//Design      : prog_RAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module prog_RAM_wrapper
   (address,
    clock,
    dataIn,
    dataOut,
    we);
  input [9:0]address;
  input clock;
  input [7:0]dataIn;
  output [7:0]dataOut;
  input we;

  wire [9:0]address;
  wire clock;
  wire [7:0]dataIn;
  wire [7:0]dataOut;
  wire we;

  prog_RAM prog_RAM_i
       (.address(address),
        .clock(clock),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .we(we));
endmodule
