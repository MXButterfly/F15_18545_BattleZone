//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Dec  4 23:52:40 2015
//Host        : columbus.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.2 (Maipo)
//Command     : generate_target prog_RAM.bd
//Design      : prog_RAM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "prog_RAM,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=prog_RAM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "prog_RAM.hwdef" *) 
module prog_RAM
   (address,
    clock,
    dataIn,
    dataOut,
    we);
  input [9:0]address;
  input clock;
  input [7:0]dataIn;
  output [7:0]dataOut;
  input we;

  wire [9:0]address_1;
  wire [7:0]blk_mem_gen_0_douta;
  wire clock_1;
  wire [7:0]dataIn_1;
  wire we_1;

  assign address_1 = address[9:0];
  assign clock_1 = clock;
  assign dataIn_1 = dataIn[7:0];
  assign dataOut[7:0] = blk_mem_gen_0_douta;
  assign we_1 = we;
  prog_RAM_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(address_1),
        .clka(clock_1),
        .dina(dataIn_1),
        .douta(blk_mem_gen_0_douta),
        .wea(we_1));
endmodule
