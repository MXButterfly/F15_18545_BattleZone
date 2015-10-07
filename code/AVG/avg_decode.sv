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
                  input  logic [31:0] inst);

    logic [2:0] dcd_op;
    assign dcd_op = inst[31:29];

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
            `OP_VCTR: begin
                dY = inst[28:16];
                dX = inst[12:0];
                vector = 1;
                if(inst[15:13] == 3'b000) blank = 1'b1;
                else if(inst[15:13] == 3'b001) useZReg = 1'b1;
                else zVal = (inst[15:13] << 1);
                pcOffset = 3'h2;
                instLength = 7;
            end 
            `OP_HALT: begin
                halt = 1'b1;
                pcOffset = 3'h1;
                instLength = 1;
            end

            `OP_SVEC: begin
                dY = inst[28:24];
                dX = inst[20:16];
                vector = 1;
                if(inst[23:21] == 3'b000) blank = 1'b1;
                else if(inst[23:21] == 3'b001) useZReg = 1'b1;
                else zVal = inst[23:21] << 1;
                pcOffset = 3'h1;
                instLength = 5;
            end

            `OP_STORE: begin
                pcOffset = 3'h1;
                case(inst[28]) 
                    1'b0: begin//STAT
                        zWrEn = 1'b1;
                        zVal = inst[23:16];
                        color = inst[26:24];
                        instLength = 6;
                    end
                    1'b1: begin //SCAL
                        linScale = inst[23:16];
                        binScale = inst[26:24];
                        scalWrEn = 1'b1;
                        instLength = 2;
                    end
                endcase
            end

            `OP_CNTR: begin
                center = 1'b1;
                pcOffset = 3'h1;
                instLength = 4;
            end

            `OP_JSR: begin
                jmp = 1'b1;
                jsr = 1'b1;
                jumpAddr = inst[28:16] << 1;;
                pcOffset = 3'h1;
                instLength = 4;
            end

            `OP_JMP: begin
                jmp = 1'b1;
                jumpAddr = inst[28:16] << 1;;
                pcOffset = 3'h1;
                instLength = 4;
            end

            `OP_RTS: begin
                ret = 1'b1;
                pcOffset = 3'h1;
                instLength = 3;
            end
        endcase
    end
endmodule
