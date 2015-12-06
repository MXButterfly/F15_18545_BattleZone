//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Dec  4 01:30:34 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target prog_ram_readable_wrapper.bd
//Design      : prog_ram_readable_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module prog_ram_readable_wrapper
   (address,
    clock,
    dataIn,
    dataOut,
    r_addr,
    r_data,
    r_en,
    we,
    web);
  input [9:0]address;
  input clock;
  input [7:0]dataIn;
  output [7:0]dataOut;
  input [9:0]r_addr;
  output [7:0]r_data;
  input r_en;
  input we;
  input web;

  wire [9:0]address;
  wire clock;
  wire [7:0]dataIn;
  wire [7:0]dataOut;
  wire [9:0]r_addr;
  wire [7:0]r_data;
  wire r_en;
  wire we;
  wire web;

  prog_ram_readable prog_ram_readable_i
       (.address(address),
        .clock(clock),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .r_addr(r_addr),
        .r_data(r_data),
        .r_en(r_en),
        .we(we),
        .web(web));
endmodule
