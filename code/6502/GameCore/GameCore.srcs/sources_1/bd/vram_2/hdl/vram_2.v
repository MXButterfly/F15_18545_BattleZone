//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Nov 22 18:23:23 2015
//Host        : chinook.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target vram_2.bd
//Design      : vram_2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "vram_2,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=vram_2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "vram_2.hwdef" *) 
module vram_2
   (addr,
    clk,
    dataIn,
    dataOut,
    we);
  input [12:0]addr;
  input clk;
  input [7:0]dataIn;
  output [7:0]dataOut;
  input [0:0]we;

  wire [12:0]addr_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire clk_1;
  wire [7:0]dataIn_1;
  wire [0:0]we_1;

  assign addr_1 = addr[12:0];
  assign clk_1 = clk;
  assign dataIn_1 = dataIn[7:0];
  assign dataOut[7:0] = blk_mem_gen_0_douta;
  assign we_1 = we[0];
  vram_2_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addr_1),
        .clka(clk_1),
        .dina(dataIn_1),
        .douta(blk_mem_gen_0_douta),
        .wea(we_1));
endmodule
