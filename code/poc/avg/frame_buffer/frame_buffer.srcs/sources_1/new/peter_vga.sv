`timescale 1ns / 1ps
module vga
  (input logic CLOCK_50, reset,
   output logic HS, VS, blank,
   output logic [8:0] row,
   output logic [9:0] col);

   logic [10:0] hClockCount;
   logic       rolloverH, hdisp, colInc, hblank;

   logic [9:0] lines;
   logic       rolloverV, vdisp, vblank;
   
   counter #(11) clockCounterH(hClockCount,, CLOCK_50, reset | rolloverH,
			      1'b0, 1'b1, 1'b1);
   comparator #(11) hRolloverCheck(, rolloverH,, 11'd1599, hClockCount);
   offset_check #(11) hdispCheck(hClockCount, 11'd288, 11'd1279, hdisp);
   comparator #(11) hpulseCheck(,, HS, hClockCount, 11'd191);
   counter #(1) colIncTracker(colInc,, CLOCK_50, reset | rolloverH,
			      1'b0, hdisp, 1'b1);
   counter #(10) colTracker(col,, CLOCK_50, reset | rolloverH,
			    1'b0, colInc, 1'b1);

   counter #(10) lineCounter(lines,, CLOCK_50, reset | (rolloverH & rolloverV),
			     1'b0, rolloverH, 1'b1);
   comparator #(10) vRolloverCheck(, rolloverV,, 10'd520, lines);
   offset_check #(10) vdispCheck(lines, 10'd31, 10'd479, vdisp);
   comparator #(10) vpulseCheck(,, VS, lines, 10'd1);
   counter #(9) rowTracker(row,, CLOCK_50, reset | rolloverV,
			   1'b0, rolloverH & vdisp, 1'b1);

   assign blank = ~(hdisp & vdisp);
     
endmodule: vga

module range_check
  #(parameter WIDTH = 6)
   (input logic [WIDTH-1:0] val, low, high,
    output logic is_between);

   logic 	 smallEnough, largeEnough;
  
   comparator #(WIDTH) lc(,,largeEnough, low, val);
   comparator #(WIDTH) hc(,,smallEnough, val, high);

   assign is_between = ~smallEnough & ~largeEnough;
   
endmodule: range_check

module offset_check
  #(parameter WIDTH = 6)
   (input logic [WIDTH-1:0] val, low, delta,
    output logic is_between);

   logic 	 [WIDTH-1:0] high;
   
   adder #(WIDTH) add(high,, low, delta, 1'b0);
   range_check #(WIDTH) rc(.*);

endmodule: offset_check

module comparator
  #(parameter WIDTH = 6)
  (output logic AltB, AeqB, AgtB,
   input logic [WIDTH-1:0] A, B);

   assign AltB = (A < B);
   assign AeqB = (A == B);
   assign AgtB = (A > B);

endmodule: comparator

module adder
  #(parameter WIDTH = 6)
   (output logic [WIDTH-1:0] Sum,
    output logic Cout,
    input logic [WIDTH-1:0] A, B,
    input logic Cin);
   
   assign {Cout, Sum} = A + B + Cin;

endmodule: adder

module mux
  #(parameter WIDTH = 6)
   (output logic Y,
    input logic [WIDTH-1:0] I,
    input logic [$clog2(WIDTH)-1:0] Sel);

   assign Y = I[Sel];

endmodule: mux

module mux2to1
  #(parameter WIDTH = 6)
   (output logic [WIDTH-1:0] Y,
    input logic [WIDTH-1:0] I0, I1,
    input logic Sel);

   assign Y = (Sel ? I1 : I0);

endmodule: mux2to1

module decoder
  #(parameter WIDTH = 6)
   (output logic [(1 << WIDTH)-1:0] D,
    input logic [WIDTH-1:0] I,
    input logic en);

   assign D = en << I;

endmodule: decoder

module register
  #(parameter WIDTH = 6)
   (output logic [WIDTH-1:0] Q,
    input logic [WIDTH-1:0] D,
    input logic clr, en, clk);

   always_ff @(posedge clk)
      if(clr)
	Q <= 0;
      else if(en)
	Q <= D;
   
endmodule: register

module counter
  #(parameter WIDTH = 6)
   (output logic [WIDTH-1:0] Q,
    input logic [WIDTH-1:0] D,
    input logic clk, clr, load, en, up);

   always_ff @(posedge clk) begin
      if(clr)
	Q <= 0;
      else if(load)
	Q <= D;
      else if(en)
	Q <= (up ? Q + 1 : Q - 1);
      end
endmodule: counter

module shift_register
  #(parameter WIDTH = 6)
   (output logic [WIDTH-1:0] Q,
    input logic clk, en, left, s_in);

   always_ff @(posedge clk)
     if(en) begin
	if(left) begin
	   Q <= (Q << 1);
	   Q[0] <= s_in;
	end
	else begin
	   Q <= (Q >> 1);
	   Q[WIDTH-1] <= s_in;
	end
     end
endmodule: shift_register

