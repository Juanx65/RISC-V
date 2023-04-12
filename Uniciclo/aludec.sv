module aludec(input logic opb5,
input logic [2:0] funct3,
input logic funct7b5,
input logic [1:0] ALUOp,
output logic [2:0] ALUControl);

logic RtypeSub;
assign RtypeSub = funct7b5 & opb5; // TRUE for R–type subtract

always_comb
case(ALUOp)
    2'b00: ALUControl = 3'b000; // addition
    2'b01: ALUControl = 3'b001; // subtraction
    default:
        case(funct3) // R–type or I–type ALU
            3'b000: if (RtypeSub)
                        ALUControl = 3'b001; // sub
                    else
                        ALUControl = 3'b000; // add, addi
                        3'b010: ALUControl = 3'b101; // slt, slti
                        3'b110: ALUControl = 3'b011; // or, ori
                        3'b111: ALUControl = 3'b010; // and, andi
            default: ALUControl = 3'bxxx; // ???
        endcase
    endcase
endmodule