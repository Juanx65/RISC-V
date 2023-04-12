module alu (
    input logic [31:0] SrcA,
    input logic [31:0] SrcB,
    input logic [2:0] ALUControl,
    output logic [31:0] ALUResult,
    output logic Zero
);

always_comb begin
    case (ALUControl)
        3'b000: ALUResult = SrcA + SrcB; // ADD
        3'b001: ALUResult = SrcA - SrcB; // SUB
        3'b010: ALUResult = SrcA & SrcB; // AND
        3'b011: ALUResult = SrcA | SrcB; // OR
        3'b100: ALUResult = SrcA ^ SrcB; // XOR
        3'b101: ALUResult = SrcA << SrcB[4:0]; // SLL (Shift Left Logical)
        3'b110: ALUResult = SrcA >> SrcB[4:0]; // SRL (Shift Right Logical)
        3'b111: ALUResult = $signed(SrcA) >>> SrcB[4:0]; // SRA (Shift Right Arithmetic)
        default: ALUResult = 32'b0;
    endcase

    Zero = (ALUResult == 0) ? 1 : 0;
end

endmodule