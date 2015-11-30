//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Nov 22 18:23:26 2015
//Host        : chinook.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target prog_ROM_wrapper.bd
//Design      : prog_ROM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module prog_ROM_wrapper
   (Address,
    Clock,
    Data);
  input [13:0]Address;
  input Clock;
  output [7:0]Data;

  wire [13:0]Address;
  wire Clock;
  wire [7:0]Data;

  prog_ROM prog_ROM_i
       (.Address(Address),
        .Clock(Clock),
        .Data(Data));
endmodule
