//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Tue Dec  1 23:06:02 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target vector_ram_wrapper.bd
//Design      : vector_ram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module vector_ram_wrapper
   (addressA,
    addressB,
    clk,
    dataInA,
    dataInB,
    dataOutA,
    dataOutB,
    writeEnA,
    writeEnableB);
  input [12:0]addressA;
  input [12:0]addressB;
  input clk;
  input [7:0]dataInA;
  input [7:0]dataInB;
  output [7:0]dataOutA;
  output [7:0]dataOutB;
  input [0:0]writeEnA;
  input [0:0]writeEnableB;

  wire [12:0]addressA;
  wire [12:0]addressB;
  wire clk;
  wire [7:0]dataInA;
  wire [7:0]dataInB;
  wire [7:0]dataOutA;
  wire [7:0]dataOutB;
  wire [0:0]writeEnA;
  wire [0:0]writeEnableB;

  vector_ram vector_ram_i
       (.addressA(addressA),
        .addressB(addressB),
        .clk(clk),
        .dataInA(dataInA),
        .dataInB(dataInB),
        .dataOutA(dataOutA),
        .dataOutB(dataOutB),
        .writeEnA(writeEnA),
        .writeEnableB(writeEnableB));
endmodule
