//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Wed Oct 21 01:04:47 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target avgROM_wrapper.bd
//Design      : avgROM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module avgROM_wrapper
   (addra,
    addrb,
    clk,
    dina,
    dinb,
    douta,
    doutb,
    ena,
    wea);
  input [13:0]addra;
  input [13:0]addrb;
  input clk;
  input [7:0]dina;
  input [7:0]dinb;
  output [7:0]douta;
  output [7:0]doutb;
  input ena;
  input wea;

  wire [13:0]addra;
  wire [13:0]addrb;
  wire clk;
  wire [7:0]dina;
  wire [7:0]dinb;
  wire [7:0]douta;
  wire [7:0]doutb;
  wire ena;
  wire wea;

  avgROM avgROM_i
       (.addra(addra),
        .addrb(addrb),
        .clk(clk),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .wea(wea));
endmodule
