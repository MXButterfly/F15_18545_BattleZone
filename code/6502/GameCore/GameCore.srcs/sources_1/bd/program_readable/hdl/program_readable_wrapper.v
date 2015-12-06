//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Dec  4 14:53:58 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target program_readable_wrapper.bd
//Design      : program_readable_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module program_readable_wrapper
   (address,
    address_b,
    clock,
    dataIn,
    dataIn_b,
    dataOut,
    dataOut_b,
    we,
    web);
  input [9:0]address;
  input [9:0]address_b;
  input clock;
  input [7:0]dataIn;
  input [7:0]dataIn_b;
  output [7:0]dataOut;
  output [7:0]dataOut_b;
  input we;
  input web;

  wire [9:0]address;
  wire [9:0]address_b;
  wire clock;
  wire [7:0]dataIn;
  wire [7:0]dataIn_b;
  wire [7:0]dataOut;
  wire [7:0]dataOut_b;
  wire we;
  wire web;

  program_readable program_readable_i
       (.address(address),
        .address_b(address_b),
        .clock(clock),
        .dataIn(dataIn),
        .dataIn_b(dataIn_b),
        .dataOut(dataOut),
        .dataOut_b(dataOut_b),
        .we(we),
        .web(web));
endmodule
