`include "avg_defines.vh"
module avg_decode(output logic        zWrEn, scalWrEn, center, jmp, jsr, ret, 
                  output logic        useZReg, blank, halt, vector,  
                  output logic [15:0] jumpAddr, 
                  output logic  [2:0] pcOffset, 
                  output logic [12:0] dX, dY, 
                  output logic  [3:0] zVal,
                  output logic  [7:0] linScale, 
                  output logic  [2:0] binScale, 
                  output logic  [2:0] color,
                  output logic  [2:0] instLength,  
                  input  logic [16:0] inst, 
                  input  logic  [3:0] instType);

    logic [2:0] dcd_op;
    assign dcd_op = inst[23:21];

    always_comb begin
        zWrEn = 1'b0;
        scalWrEn = 1'b0;
        center = 1'b0;
        jmp = 1'b0;
        jsr = 1'b0;
        ret = 1'b0;
        useZReg = 1'b0;
        blank = 1'b0;
        halt = 1'b0;
        vector = 1'b0;
        jumpAddr = 16'h0;
        pcOffset = 3'h0;
        dX = 0; dY = 0;
        linScale = 0; binScale = 0;
        color = 3'b010;
        instLength = 0;
        case(dcd_op) 
            `TYPE_VECTOR1: begin
                dY = {inst[20:16], inst[31:24]};
                dX = {inst[4:0], inst[15:8]};
                vector = 1;
                if(inst[7:5] == 3'b000) blank = 1'b1;
                else if(inst[7:5] == 3'b001) useZReg = 1'b1;
                else zVal = (inst[7:5] << 1);
                pcOffset = 3'h4;
                instLength = 7;
            end 
            `TYPE_HALT: begin
                halt = 1'b1;
                pcOffset = 3'h2;
                instLength = 1;
            end

            `TYPE_SVEC: begin
                dY = inst[20:16];
                dX = inst[28:24];
                vector = 1;
                if(inst[31:29] == 3'b000) blank = 1'b1;
                else if(inst[31:29] == 3'b001) useZReg = 1'b1;
                else zVal = inst[31:29] << 1;
                pcOffset = 3'h2;
                instLength = 5;
            end

            `TYPE_STAT: begin
                pcOffset = 3'h2;
                zWrEn = 1'b1;
                zVal = inst[31:27];
                color = inst[19:16];
                instLength = 6;
            end
            `TYPE_SCAL: begin
                pcOffset = 3'h2;
                linScale = inst[31:24];
                binScale = inst[18:16];
                scalWrEn = 1'b1;
                instLength = 2;
            end

            `TYPE_CNTR: begin
                center = 1'b1;
                pcOffset = 3'h2;
                instLength = 4;
            end

            `TYPE_JSR: begin
                jmp = 1'b1;
                jsr = 1'b1;
                jumpAddr = {inst[19:16], inst[31:24]} << 1;
                pcOffset = 3'h2;
                instLength = 4;
            end

            `TYPE_JMP: begin
                jmp = 1'b1;
                jumpAddr = {inst[19:16], inst[31:24]} << 1;
                pcOffset = 3'h2;
                instLength = 4;
            end

            `TYPE_RTS: begin
                ret = 1'b1;
                pcOffset = 3'h2;
                instLength = 3;
            end
        endcase
    end
endmodule
