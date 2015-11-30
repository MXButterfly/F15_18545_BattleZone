//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Nov 22 18:23:25 2015
//Host        : chinook.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target vector_ram.bd
//Design      : vector_ram
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "vector_ram,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=vector_ram,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "vector_ram.hwdef" *) 
module vector_ram
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

  wire [12:0]addressA_1;
  wire [12:0]addressB_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire [7:0]blk_mem_gen_0_doutb;
  wire clk_1;
  wire [7:0]dataInA_1;
  wire [7:0]dataInB_1;
  wire [0:0]writeEnA_1;
  wire [0:0]writeEnableB_1;

  assign addressA_1 = addressA[12:0];
  assign addressB_1 = addressB[12:0];
  assign clk_1 = clk;
  assign dataInA_1 = dataInA[7:0];
  assign dataInB_1 = dataInB[7:0];
  assign dataOutA[7:0] = blk_mem_gen_0_douta;
  assign dataOutB[7:0] = blk_mem_gen_0_doutb;
  assign writeEnA_1 = writeEnA[0];
  assign writeEnableB_1 = writeEnableB[0];
  vector_ram_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addressA_1),
        .addrb(addressB_1),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(dataInA_1),
        .dinb(dataInB_1),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .wea(writeEnA_1),
        .web(writeEnableB_1));
endmodule
