//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Dec  4 14:53:58 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target program_readable.bd
//Design      : program_readable
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "program_readable,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=program_readable,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "program_readable.hwdef" *) 
module program_readable
   (address,
    address_b,
    clock,
    dataIn,
    dataIn_b,
    dataOut,
    dataOut_b,
    we,
    web);
  input [9:0]address;
  input [9:0]address_b;
  input clock;
  input [7:0]dataIn;
  input [7:0]dataIn_b;
  output [7:0]dataOut;
  output [7:0]dataOut_b;
  input we;
  input web;

  wire [9:0]address1_1;
  wire [9:0]address_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire [7:0]blk_mem_gen_0_doutb;
  wire clock_1;
  wire [7:0]dataIn1_1;
  wire [7:0]dataIn_1;
  wire we1_1;
  wire we_1;

  assign address1_1 = address_b[9:0];
  assign address_1 = address[9:0];
  assign clock_1 = clock;
  assign dataIn1_1 = dataIn_b[7:0];
  assign dataIn_1 = dataIn[7:0];
  assign dataOut[7:0] = blk_mem_gen_0_douta;
  assign dataOut_b[7:0] = blk_mem_gen_0_doutb;
  assign we1_1 = web;
  assign we_1 = we;
  program_readable_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(address_1),
        .addrb(address1_1),
        .clka(clock_1),
        .clkb(clock_1),
        .dina(dataIn_1),
        .dinb(dataIn1_1),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .wea(we_1),
        .web(we1_1));
endmodule
