//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Nov 12 18:03:04 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target mathBoxROM.bd
//Design      : mathBoxROM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "mathBoxROM,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mathBoxROM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "mathBoxROM.hwdef" *) 
module mathBoxROM
   (addr_a,
    addr_b,
    clk,
    data_a,
    data_b);
  input [9:0]addr_a;
  input [9:0]addr_b;
  input clk;
  output [7:0]data_a;
  output [7:0]data_b;

  wire [9:0]addr_1;
  wire [9:0]addr_b_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire [7:0]blk_mem_gen_0_doutb;
  wire clk_1;

  assign addr_1 = addr_a[9:0];
  assign addr_b_1 = addr_b[9:0];
  assign clk_1 = clk;
  assign data_a[7:0] = blk_mem_gen_0_douta;
  assign data_b[7:0] = blk_mem_gen_0_doutb;
  mathBoxROM_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addr_1),
        .addrb(addr_b_1),
        .clka(clk_1),
        .clkb(clk_1),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb));
endmodule
