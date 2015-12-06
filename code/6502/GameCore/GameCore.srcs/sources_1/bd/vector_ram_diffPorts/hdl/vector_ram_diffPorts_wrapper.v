//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Dec  4 16:31:14 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target vector_ram_diffPorts_wrapper.bd
//Design      : vector_ram_diffPorts_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module vector_ram_diffPorts_wrapper
   (clock,
    dataOut,
    readAddr,
    writeAddr,
    writeData,
    writeEnable);
  input clock;
  output [15:0]dataOut;
  input [11:0]readAddr;
  input [12:0]writeAddr;
  input [7:0]writeData;
  input [0:0]writeEnable;

  wire clock;
  wire [15:0]dataOut;
  wire [11:0]readAddr;
  wire [12:0]writeAddr;
  wire [7:0]writeData;
  wire [0:0]writeEnable;

  vector_ram_diffPorts vector_ram_diffPorts_i
       (.clock(clock),
        .dataOut(dataOut),
        .readAddr(readAddr),
        .writeAddr(writeAddr),
        .writeData(writeData),
        .writeEnable(writeEnable));
endmodule
