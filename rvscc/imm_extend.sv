`include "timescale.sv"

module imm_extend (
    input  logic [ 1:0] imm_src,
    input  logic [31:7] instr,
    output logic [31:0] imm_ext
);
  always_comb begin
    case (imm_src)
      'd0: imm_ext = {{20{instr[31]}}, instr[31:20]};  // Type I
      'd1: imm_ext = {{20{instr[31]}}, instr[31:25], instr[11:7]};  // Type S
      'd2: imm_ext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};  // Type B
      'd3: imm_ext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};  // Type J
      default: imm_ext = 'dx;
    endcase
  end
endmodule
