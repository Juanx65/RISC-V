module control_unit(
    input logic [6:0] op,
    input logic [2:0] funct3,
    input logic funct7b5,
    output logic reg_wrD,
    output logic [1:0] result_srcD,
    output logic mem_wrD,
    output logic jumpD,
    output logic branchD,
    output logic [2:0] ALU_ctrlD,
    output logic ALU_srcD,
    output logic [1:0] imm_srcD
    );
    
logic [1:0] ALUOp;
logic Branch;

maindec md(op, result_srcD, mem_wrD, branchD,
    ALU_srcD, reg_wrD, jumpD, imm_srcD, ALUOp);

aludec ad(op[5], funct3, funct7b5, ALUOp, ALU_ctrlD);
endmodule