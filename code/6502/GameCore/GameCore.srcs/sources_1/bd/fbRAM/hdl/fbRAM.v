//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Nov  5 21:14:29 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target fbRAM.bd
//Design      : fbRAM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "fbRAM,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fbRAM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "fbRAM.hwdef" *) 
module fbRAM
   (addr_a,
    clk,
    color_in,
    color_out,
    en,
    write_en);
  input [18:0]addr_a;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  input en;
  input write_en;

  wire [18:0]addr_a_1;
  wire [3:0]blk_mem_gen_0_douta;
  wire clk_1;
  wire [3:0]color_in_1;
  wire en_1;
  wire write_en_1;

  assign addr_a_1 = addr_a[18:0];
  assign clk_1 = clk;
  assign color_in_1 = color_in[3:0];
  assign color_out[3:0] = blk_mem_gen_0_douta;
  assign en_1 = en;
  assign write_en_1 = write_en;
  fbRAM_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addr_a_1),
        .clka(clk_1),
        .dina(color_in_1),
        .douta(blk_mem_gen_0_douta),
        .ena(en_1),
        .wea(write_en_1));
endmodule
