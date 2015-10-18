//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Oct 16 16:46:19 2015
//Host        : crystal.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target blockRam.bd
//Design      : blockRam
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "blockRam,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=blockRam,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "blockRam.hwdef" *) 
module blockRam
   (addr_a,
    addr_b,
    clear_in,
    clk,
    color_in,
    color_out,
    color_out_b,
    en,
    en_b,
    write_en,
    write_en_b);
  input [18:0]addr_a;
  input [18:0]addr_b;
  input [3:0]clear_in;
  input clk;
  input [3:0]color_in;
  output [3:0]color_out;
  output [3:0]color_out_b;
  input en;
  input en_b;
  input write_en;
  input write_en_b;

  (* MARK_DEBUG *) wire [18:0]addr_a_1;
  wire [18:0]addr_b_1;
  (* MARK_DEBUG *) wire [3:0]blk_mem_gen_0_douta;
  wire [3:0]blk_mem_gen_0_doutb;
  wire [3:0]clear_in_1;
  wire clk_1;
  (* MARK_DEBUG *) wire [3:0]color_1;
  wire en_1;
  wire en_b_1;
  wire write_en_1;
  wire write_en_b_1;

  assign addr_a_1 = addr_a[18:0];
  assign addr_b_1 = addr_b[18:0];
  assign clear_in_1 = clear_in[3:0];
  assign clk_1 = clk;
  assign color_1 = color_in[3:0];
  assign color_out[3:0] = blk_mem_gen_0_douta;
  assign color_out_b[3:0] = blk_mem_gen_0_doutb;
  assign en_1 = en;
  assign en_b_1 = en_b;
  assign write_en_1 = write_en;
  assign write_en_b_1 = write_en_b;
  blockRam_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addr_a_1),
        .addrb(addr_b_1),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(color_1),
        .dinb(clear_in_1),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .ena(en_1),
        .enb(en_b_1),
        .wea(write_en_1),
        .web(write_en_b_1));
endmodule
