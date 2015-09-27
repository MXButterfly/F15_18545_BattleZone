`timescale 1ns / 1ps
/*
 * Currently does not signal pixels with x>=640 or y>=480 as being bad pixels
 * If this is a problem, fix ASAP
 */




`define HALF_WIDTH 10'd320
`define HALF_HEIGHT 9'd240


module rasterizer
  (input logic [10:0]  startX, endX,
   input logic [10:0]  startY, endY,
   input logic [3:0] lineColor,
   input logic 	       clk, rst, readyIn,
   output logic [18:0] addressOut,
   output logic [10:0] pixelX, pixelY,
   output logic [3:0] pixelColor,
   output logic        goodPixel, done, rastReady);

   logic 	       inc, xZone, bZone, yZone;
   logic 	       xNeg, yNeg, cntNet;
   logic 	       loopEn;
   
   logic [10:0]        adjStartX, adjEndX;
   logic [10:0]        adjStartY, adjEndY;

   logic [10:0]        absDeltaX, absDeltaY, numerator, denominator;

   logic [10:0]        majCnt, minCnt;

   logic [10:0]        leftX, topY;

   m_register #(4) colorBank(pixelColor, lineColor, rst, readyIn, clk);
       
   
   m_register #(11) startXBank(adjStartX, startX + `HALF_WIDTH, rst, readyIn, clk);
   m_register #(11) endXBank(adjEndX, endX + `HALF_WIDTH, rst, readyIn, clk);
   m_register #(11) startYBank(adjStartY, startY + `HALF_HEIGHT, rst, readyIn, clk);
   m_register #(11) endYBank(adjEndY, endY + `HALF_HEIGHT, rst, readyIn, clk);
   

   absSubtractor #(11) xSub(.A(adjEndX), .B(adjStartX), .absDiff(absDeltaX));
   absSubtractor #(11) ySub(.A(adjEndY), .B(adjStartY), .absDiff(absDeltaY));
   
   m_comparator #(11) slopePicker(.A(absDeltaX), .B(absDeltaY), .AgtB(xZone), .AeqB(bZone), .AltB(yZone));

   m_comparator #(11) xDirCmp(.A(adjStartX), .B(adjEndX), .AltB(xNeg));
   m_comparator #(11) yDirCmp(.A(adjStartY), .B(adjEndY), .AltB(yNeg));
   xor xorNeg(cntNeg, xNeg, yNeg);
   
   
   switchMux #(11) recipSwitch(.U(numerator), .V(denominator), .Sel(yZone), .A(absDeltaY), .B(absDeltaX));

   m_counter #(11) majorCounter(.Q(majCnt), .D(11'd0), .clk(clk), .clr(rst|readyIn), .load(1'b0), .up(1'b1), .en(loopEn));
   m_counter #(11) minorCounter(.Q(minCnt), .D(11'd0), .clk(clk), .clr(rst|readyIn), .load(1'b0), .up(cntNeg), .en(inc));


   bresenhamCore rasterCore(.numerator(numerator), .denominator(denominator), .clk(clk), .rst(rst|readyIn), .en(loopEn), .inc(inc));

   rasterFSM rasterControl(.readyIn(readyIn), .denominator(denominator), .majCnt(majCnt), .clk(clk), .rst(rst), .loopEn(loopEn), .done(done), .good(goodPixel), .rastReady(rastReady));


   m_mux2to1 #(11) leftXMux(.Y(leftX), .Sel(xZone ? xNeg : yNeg), .I0(adjEndX), .I1(adjStartX));
   m_mux2to1 #(11) topYMux(.Y(topY), .Sel(yZone ? yNeg : xNeg), .I0(adjEndY), .I1(adjStartY));
   

   assign pixelX = leftX + (xZone ? majCnt : minCnt);
   assign pixelY = topY + (yZone ? majCnt : minCnt);
   
   coordinateIndexer addresser(.x(pixelX[9:0]), .y(pixelY[8:0]), .index(addressOut));
   
   
   
endmodule: rasterizer



module coordinateIndexer
  (input logic [9:0] x,
   input logic [8:0] y,
   output logic [18:0] index
   );
   
   assign index = ({{9{1'b0}},{x}}) + ({{1'b0},{y},{9{1'b0}}}) + ({{3{1'b0}},{y},{7{1'b0}}});
   

endmodule: coordinateIndexer

module rasterFSM
  (input logic readyIn,
   input logic [10:0] denominator, majCnt,
   input logic 	clk, rst,
   output logic loopEn, good, done, rastReady
   );

   typedef enum {IDLE, ITER, DONE} state;

   state next, current;
   
   assign rastReady = (current == IDLE);
   
   always_ff @(posedge clk)
     begin
	if(rst)
	  current <= IDLE;
	else
	  current <= next;
	
     end


   always_comb
     begin
	case(current)
	  IDLE:
	    begin
	       if(readyIn)
		 next = ITER;
  	       else 
		 next = IDLE;
	       done = 1'b0;
	       loopEn = 1'b0;
	       good = 1'b0;
	       
	    end
	  ITER:
	    begin
	       if(denominator == majCnt)begin
		  next = DONE;
		  loopEn = 1'b0;
		  good = 1'b0;
		  
	       end
	       else begin
		  next = ITER;
		  loopEn = 1'b1;
		  good = 1'b1;
		  
	       end
	       
	       done = 1'b0;
	       
	       
	    end
	  DONE:
	    begin
	       next = IDLE;
	       
	       done = 1'b1;
	       loopEn = 1'b0;
	       good = 1'b0;
	       
	    end
	endcase // case (current)
     end
   
   

   

endmodule: rasterFSM


module switchMux
  #(parameter BUSWIDTH = 11)
   (output logic [BUSWIDTH-1:0] U, V,
    input logic [BUSWIDTH-1:0] A, B,
    input logic 	       Sel
    );
   

   m_mux2to1 #(BUSWIDTH) uMux(.Y(U), .I0(A), .I1(B), .Sel(Sel));
   m_mux2to1 #(BUSWIDTH) vMux(.Y(V), .I0(B), .I1(A), .Sel(Sel));
   
   

endmodule: switchMux

module absSubtractor
  #(parameter BUSWIDTH = 11)
   (input logic [BUSWIDTH-1:0] A, B,
    output logic [BUSWIDTH-1:0] absDiff
    );

   logic [BUSWIDTH-1:0] 	negB, diff;
   
   
   negator #(BUSWIDTH) bNegator(.valIn(B), .valOut(negB));
   m_adder #(BUSWIDTH) subtraction(diff,, A, negB, 1'b0);
   absVal #(BUSWIDTH) magnitude(.valIn(diff), .valOut(absDiff));
   


endmodule: absSubtractor



module bresenhamCore
  (input logic [10:0] numerator, denominator,
   input logic 	clk, rst, en,
   output logic inc
   );

   logic [10:0] errSum, errDiff, errCurr, absErr, subtrahend, negDenom;

   negator #(11) denomNegator(.valIn(denominator), .valOut(negDenom));
   

   m_register #(11) errBank(.Q(errCurr), .D(errDiff), .clr(rst), .clk(clk), .en(en));
   
   absVal #(11) errMagnitude(.valIn(errSum), .valOut(absErr));

   m_mux2to1 #(11) subSelect(.Y(subtrahend), .I0(11'd0), .I1(negDenom), .Sel(inc));
   
   m_comparator #(11) comp   (,, inc, absErr, {{1'b0}, {denominator[10:1]}});

   m_adder #(11) errAdder(errSum,, errCurr, numerator, 1'b0);

   m_adder #(11) errSubtract(errDiff,, errSum, subtrahend, 1'b0);
   


endmodule: bresenhamCore


module negator
  #(parameter BUSWIDTH = 11)
   (input logic [BUSWIDTH-1:0] valIn,
    output logic [BUSWIDTH-1:0] valOut
    );

   assign valOut = 1'b1 + ~valIn;
   


endmodule: negator


module absVal
  #(parameter BUSWIDTH = 11)
   (input logic [BUSWIDTH-1:0] valIn,
    output logic [BUSWIDTH-1:0] valOut
    );

   logic [BUSWIDTH-1:0] 	valMid;
   
   
   always_comb
     begin
	if(valIn[BUSWIDTH-1])
	  valMid = ~valIn;
	else
	  valMid = valIn;
	
     end
   
   
   assign valOut = valMid + valIn[BUSWIDTH-1];
   
   

endmodule: absVal	  

module sanityBench();

   logic [10:0]  startX, endX;
   logic [10:0]  startY, endY;
   logic 	 clk, rst, readyIn;
   logic [18:0]  addressOut;
   logic [10:0]  pixelX, pixelY;
   
   logic 	 goodPixel, done;


   logic [2:0] 	 valIn, valOut;


   logic [10:0]  numerator, denominator;
   logic 	 inc;
   
   
   logic 	 en;
   
   

   rasterizer testee(.*);


   absVal #(3) testee2(.*);
   

   bresenhamCore testee3(.*);
   
   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end

   
   initial begin

      $monitor("%d: (%d, %d) - %b", $time, pixelX, pixelY, goodPixel);
 
      startY = 11'd50;
      endY = 11'd250;
      startX = -11'd25;
      endX = 11'd75;
      readyIn = 0;
      rst = 1;
      @(posedge clk);

      rst = 0;
      @(posedge clk);
      
      readyIn = 1;
      @(posedge clk);
      readyIn = 0;
      
      $display("Denominator: %d", testee.denominator);
      
      
      do begin
	 @(posedge clk);
	 
      end while(!done);
      
      
      $finish;
      
      
      
   end
   

   

   
endmodule: sanityBench




