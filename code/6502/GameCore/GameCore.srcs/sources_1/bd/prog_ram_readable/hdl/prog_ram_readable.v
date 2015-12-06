//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Dec  4 01:30:34 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target prog_ram_readable.bd
//Design      : prog_ram_readable
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "prog_ram_readable,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=prog_ram_readable,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "prog_ram_readable.hwdef" *) 
module prog_ram_readable
   (address,
    clock,
    dataIn,
    dataOut,
    r_addr,
    r_data,
    r_en,
    we,
    web);
  input [9:0]address;
  input clock;
  input [7:0]dataIn;
  output [7:0]dataOut;
  input [9:0]r_addr;
  output [7:0]r_data;
  input r_en;
  input we;
  input web;

  wire GND_1;
  wire [9:0]address_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire [7:0]blk_mem_gen_0_doutb;
  wire clock_1;
  wire [7:0]dataIn_1;
  wire [9:0]r_addr_1;
  wire r_en_1;
  wire we_1;
  wire web_1;

  assign address_1 = address[9:0];
  assign clock_1 = clock;
  assign dataIn_1 = dataIn[7:0];
  assign dataOut[7:0] = blk_mem_gen_0_douta;
  assign r_addr_1 = r_addr[9:0];
  assign r_data[7:0] = blk_mem_gen_0_doutb;
  assign r_en_1 = r_en;
  assign we_1 = we;
  assign web_1 = web;
  GND GND
       (.G(GND_1));
  prog_ram_readable_blk_mem_gen_0_1 blk_mem_gen_0
       (.addra(address_1),
        .addrb(r_addr_1),
        .clka(clock_1),
        .clkb(clock_1),
        .dina(dataIn_1),
        .dinb({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .enb(r_en_1),
        .wea(we_1),
        .web(web_1));
endmodule
