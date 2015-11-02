//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sat Oct 31 17:37:04 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target avgROM.bd
//Design      : avgROM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "avgROM,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=avgROM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "avgROM.hwdef" *) 
module avgROM
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

  wire [13:0]addra_1;
  wire [13:0]addrb_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire [7:0]blk_mem_gen_0_doutb;
  wire clk_1;
  wire [7:0]dina_1;
  wire [7:0]dinb_1;
  wire ena_1;
  wire wea_1;

  assign addra_1 = addra[13:0];
  assign addrb_1 = addrb[13:0];
  assign clk_1 = clk;
  assign dina_1 = dina[7:0];
  assign dinb_1 = dinb[7:0];
  assign douta[7:0] = blk_mem_gen_0_douta;
  assign doutb[7:0] = blk_mem_gen_0_doutb;
  assign ena_1 = ena;
  assign wea_1 = wea;
  avgROM_blk_mem_gen_0_0 blk_mem_gen_1
       (.addra(addra_1),
        .addrb(addrb_1),
        .clka(clk_1),
        .clkb(clk_1),
        .dina(dina_1),
        .dinb(dinb_1),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .ena(ena_1),
        .enb(ena_1),
        .wea(wea_1),
        .web(wea_1));
endmodule
