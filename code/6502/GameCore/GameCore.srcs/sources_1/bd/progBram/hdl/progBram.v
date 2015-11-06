//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Wed Oct 28 15:20:36 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target progBram.bd
//Design      : progBram
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "progBram,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=progBram,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "progBram.hwdef" *) 
module progBram
   (address,
    clk,
    dataOut);
  input address;
  input clk;
  output [7:0]dataOut;

  wire address_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire clk_1;

  assign address_1 = address;
  assign clk_1 = clk;
  assign dataOut[7:0] = blk_mem_gen_0_douta;
  progBram_blk_mem_gen_0_1 blk_mem_gen_0
       (.addra({address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1,address_1}),
        .clka(clk_1),
        .douta(blk_mem_gen_0_douta));
endmodule
