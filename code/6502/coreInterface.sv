`include "coreInterface.vh"
module memStoreQueue(output logic [7:0]  Q, 
                     output logic [15:0] writeAddr, 
                     output logic        writeOut, 
                     input  logic [7:0]  D, 
                     input  logic [15:0] addr,
                     input  logic        canWrite, we, clk_3KHz, clk, rst);
    
    parameter DEPTH = 32; //must be power of 2

    logic [DEPTH-1:0] [7:0] queue;
    logic [DEPTH-1:0] [15:0] addrQueue;
    logic [DEPTH-1:0] valid;

    logic [$clog2(DEPTH)-1:0] wrIndex, reIndex;
    logic [$clog2(DEPTH):0] numFilled;

    logic lastWrite;

    always_ff @(posedge clk) begin
        if(rst) begin
            valid <= 0;
            wrIndex <= 0;
            reIndex <= 0;
            numFilled <= 0;
            lastWrite <= 1'b0;
        end else begin
            lastWrite <= we;
            if(!empty && canWrite && we && !lastWrite) begin
                queue[wrIndex] <= D;
                addrQueue[wrIndex] <= addr;
                wrIndex <= wrIndex + 1;
                valid[reIndex] <= 0;
                reIndex <= reIndex + 1;
            end else if(canWrite && !empty) begin
                valid[reIndex] <= 1'b0;
                reIndex <= reIndex + 1;
                numFilled <= numFilled - 1;
            end else if(we && !lastWrite && !full) begin
                queue[wrIndex] <= D;
                wrIndex <= wrIndex + 1;
                valid[wrIndex] <= 1'b1;
                numFilled <= numFilled + 1;
                addrQueue[wrIndex] <= addr;
            end
        end
    end

    assign full = (numFilled == DEPTH);
    assign empty = (numFilled == 0);
    assign writeOut = canWrite && (!empty);

    assign Q = queue[reIndex];
    assign writeAddr = addrQueue[reIndex];

endmodule

module addrDecoder(output logic  [7:0] dataToCore, 
                   output logic  [2:0] [15:0] addrToBram, 
                   output logic  [2:0] [7:0] dataToBram,
                   output logic  [2:0] weEnBram,
                   output logic        vggo, vgrst, 
                   
                   input  logic  [7:0] dataFromCore,
                   input  logic [15:0] addr,
                   input  logic  [2:0] [7:0] dataFromBram,
                   input  logic        we, halt, clk_3KHz, clk);

    logic [1:0] bramNum, outBramNum;

    logic [15:0] outBramAddr;

    always_ff @(posedge clk) begin
        outBramNum <= bramNum;
        outBramAddr <= addr;
    end

    assign vggo = (addr == 16'h1200) && we;
    assign vgrst = (addr == 16'h1600) && we;

    always_comb begin
        if(addr < 16'h0400) bramNum = `BRAM_PROG_RAM;
        else if(16'h2000 <= addr && addr < 16'h3000) bramNum = `BRAM_VECTOR;
        else if(16'h5000 <= addr && addr < 16'h8000) bramNum = `BRAM_PROG_ROM;   
        else bramNum = 3; //error code
    end

    always_comb begin
        addrToBram = 0;
        dataToBram = 0;
        
        //dataToCore = dataFromBram[outBramNum];
        weEnBram = (we << bramNum);
        dataToBram[bramNum] = dataFromCore;
        addrToBram[bramNum] = addr;
    
        if(outBramNum < 3) begin
            dataToCore = dataFromBram[outBramNum];
        end
        else begin
            case(outBramAddr)
                16'h800: dataToCore = {clk_3KHz, halt, 6'b11_1111};
                16'ha00: dataToCore = 8'b0001_0101;
                16'hc00: dataToCore = 8'b0000_0011;
                //16'h1800: dataToCore = 8'b11111111;
                default: dataToCore = 8'd0;
            endcase
        end
    
    end

endmodule

module NMICounter(output logic NMI, 
                  input  logic clk, rst);
    
    logic [3:0] count;
    
    always_ff @(posedge clk) begin
        if(rst) count <= 0;
        else begin
            if(count == 13) count <= 0;
            else count <= count + 1;
        end
    end

    assign NMI = (count == 13);
endmodule








