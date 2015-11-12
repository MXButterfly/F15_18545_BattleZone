//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Nov 12 17:11:51 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target bramDualPort.bd
//Design      : bramDualPort
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bramDualPort,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bramDualPort,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "bramDualPort.hwdef" *) 
module bramDualPort
   (addra,
    addrb,
    clk,
    color_in,
    color_out,
    en_a,
    en_b,
    wen_a,
    wen_b);
  input [18:0]addra;
  input [18:0]addrb;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  input en_a;
  input en_b;
  input wen_a;
  input wen_b;

  wire GND_1;
  wire [18:0]addra_1;
  wire [18:0]addrb_1;
  wire [3:0]blk_mem_gen_0_doutb;
  wire clk_1;
  wire [3:0]color_in_1;
  wire en_a_1;
  wire en_b_1;
  wire we_a_1;
  wire we_b_1;

  assign addra_1 = addra[18:0];
  assign addrb_1 = addrb[18:0];
  assign clk_1 = clk;
  assign color_in_1 = color_in[3:0];
  assign color_out[3:0] = blk_mem_gen_0_doutb;
  assign en_a_1 = en_a;
  assign en_b_1 = en_b;
  assign we_a_1 = wen_a;
  assign we_b_1 = wen_b;
  GND GND
       (.G(GND_1));
  bramDualPort_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addra_1),
        .addrb(addrb_1),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(color_in_1),
        .dinb({GND_1,GND_1,GND_1,GND_1}),
        .doutb(blk_mem_gen_0_doutb),
        .ena(en_a_1),
        .enb(en_b_1),
        .wea(we_a_1),
        .web(we_b_1));
endmodule
