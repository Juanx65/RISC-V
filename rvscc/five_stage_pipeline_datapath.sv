`include "timescale.sv"

module five_stage_pipeline_datapath (
    input logic clk,
    input logic rst,
    instr_memory_if.datapath instr_mem_if,
    data_memory_if.datapath data_mem_if
);
  logic [31:0] fetch_pc, fetch_pc_next;
  logic [4:0] writeback_rd;

  logic [31:0] fetch_pc_plus_4, execute_pc_target;
  logic execute_pc_src;
  always_comb begin
    fetch_pc_plus_4 = fetch_pc + 'd4;
    case (execute_pc_src)
      'd0: fetch_pc_next = fetch_pc_plus_4;
      'd1: fetch_pc_next = execute_pc_target;
      default: fetch_pc_next = 'dx;
    endcase
  end

  logic fetch_stall;
  always_ff @(posedge clk) begin
    if (rst) fetch_pc <= 'b0;
    else if (!fetch_stall) fetch_pc <= fetch_pc_next;
  end

  logic [31:0] fetch_instr;
  assign instr_mem_if.addr = instr_mem_if.AddrSize'(fetch_pc);
  assign fetch_instr = instr_mem_if.instr;

  logic decode_stall, decode_flush;
  logic [31:0] decode_instr, decode_pc, decode_pc_plus_4;
  always_ff @(posedge clk) begin
    if (decode_flush) begin
      decode_instr <= 'd0;
      decode_pc <= 'd0;
      decode_pc_plus_4 <= 'd0;
    end else if (!decode_stall) begin
      decode_instr <= fetch_instr;
      decode_pc <= fetch_pc;
      decode_pc_plus_4 <= fetch_pc_plus_4;
    end
  end

  logic [4:0] decode_rs_1, decode_rs_2, decode_rd;
  assign decode_rs_1 = decode_instr[19:15];
  assign decode_rs_2 = decode_instr[24:20];
  assign decode_rd   = decode_instr[11:7];

  logic writeback_reg_write;
  logic [31:0] decode_read_data_1, decode_read_data_2;
  logic [31:0] result, writeback_result;
  register_file register_file (
      .clk(!clk),
      .rst(rst),
      .addr_1(decode_instr[19:15]),
      .addr_2(decode_instr[24:20]),
      .addr_3(writeback_rd),
      .write_enable_3(writeback_reg_write),
      .write_data_3(writeback_result),
      .read_data_1(decode_read_data_1),
      .read_data_2(decode_read_data_2)
  );

  logic [1:0] decode_result_src;
  logic [1:0] decode_imm_src;
  logic [2:0] decode_alu_ctrl;
  logic decode_reg_write;
  logic decode_mem_write;
  logic decode_jump;
  logic decode_branch;
  logic decode_alu_src;
  logic decode_branch_alu_neg;
  control_unit control_unit (
      .opcode(decode_instr[6:0]),
      .funct_3(decode_instr[14:12]),
      .funct_7(decode_instr[31:25]),
      .reg_write(decode_reg_write),
      .result_src(decode_result_src),
      .mem_write(decode_mem_write),
      .jump(decode_jump),
      .branch(decode_branch),
      .alu_ctrl(decode_alu_ctrl),
      .alu_src(decode_alu_src),
      .imm_src(decode_imm_src),
      .branch_alu_neg(decode_branch_alu_neg)
  );

  logic [31:0] decode_imm_ext;
  imm_extend imm_extend (
      .imm_src(decode_imm_src[1:0]),
      .instr  (decode_instr[31:7]),
      .imm_ext(decode_imm_ext[31:0])
  );

  logic execute_reg_write;
  logic execute_mem_write;
  logic execute_jump;
  logic execute_branch;
  logic execute_branch_alu_neg;
  logic execute_alu_src;
  logic execute_flush;
  logic [1:0] execute_result_src;
  logic [2:0] execute_alu_ctrl;
  logic [4:0] execute_rs_1, execute_rs_2, execute_rd;
  logic [31:0] execute_pc;
  logic [31:0] execute_pc_plus_4;
  logic [31:0] execute_read_data_1;
  logic [31:0] execute_read_data_2;
  logic [31:0] execute_imm_ext;
  always_ff @(posedge clk) begin
    if (execute_flush) begin
      execute_reg_write <= 'd0;
      execute_result_src <= 'd0;
      execute_mem_write <= 'd0;
      execute_jump <= 'd0;
      execute_branch <= 'd0;
      execute_alu_ctrl <= 'd0;
      execute_alu_src <= 'd0;
      execute_read_data_1 <= 'd0;
      execute_read_data_2 <= 'd0;
      execute_pc <= 'd0;
      execute_rs_1 <= 'd0;
      execute_rs_2 <= 'd0;
      execute_rd <= 'd0;
      execute_imm_ext <= 'd0;
      execute_pc_plus_4 <= 'd0;
    end else if (!decode_stall) begin
      execute_reg_write <= decode_reg_write;
      execute_result_src <= decode_result_src;
      execute_mem_write <= decode_mem_write;
      execute_jump <= decode_jump;
      execute_branch <= decode_branch;
      execute_branch_alu_neg <= decode_branch_alu_neg;
      execute_alu_ctrl <= decode_alu_ctrl;
      execute_alu_src <= decode_alu_src;
      execute_read_data_1 <= decode_read_data_1;
      execute_read_data_2 <= decode_read_data_2;
      execute_pc <= decode_pc;
      execute_rs_1 <= decode_rs_1;
      execute_rs_2 <= decode_rs_2;
      execute_rd <= decode_rd;
      execute_imm_ext <= decode_imm_ext;
      execute_pc_plus_4 <= decode_pc_plus_4;
    end
  end

  logic execute_zero;
  jump_control jump_control (
      .jump(execute_jump),
      .branch(execute_branch),
      .branch_alu_neg(execute_branch_alu_neg),
      .zero(execute_zero),
      .pc_src(execute_pc_src)
  );

  logic [31:0] execute_src_a, memory_alu_result;
  logic [1:0] execute_forward_a;
  always_comb begin
    case (execute_forward_a)
      'b00: execute_src_a = execute_read_data_1;
      'b01: execute_src_a = writeback_result;
      'b10: execute_src_a = memory_alu_result;
      'b11: execute_src_a = 'dx;
      default: execute_src_a = 'dx;
    endcase
  end

  logic [31:0] execute_write_data;
  logic [ 1:0] execute_forward_b;
  always_comb begin
    case (execute_forward_b)
      'b00: execute_write_data = execute_read_data_2;
      'b01: execute_write_data = writeback_result;
      'b10: execute_write_data = memory_alu_result;
      'b11: execute_write_data = 'dx;
      default: execute_write_data = 'dx;
    endcase
  end

  logic [31:0] execute_src_b;
  always_comb begin
    case (execute_alu_src)
      'd0: execute_src_b = execute_write_data;
      'd1: execute_src_b = execute_imm_ext;
      default: execute_src_b = 'dx;
    endcase
  end

  logic [31:0] execute_alu_result;
  logic [ 3:0] execute_alu_status;
  assign execute_zero = execute_alu_status[2];
  alu alu (
      .a(execute_src_a),
      .b(execute_src_b),
      .operation(execute_alu_ctrl),
      .result(execute_alu_result),
      .status(execute_alu_status)
  );

  assign execute_pc_target = execute_pc + execute_imm_ext;

  logic memory_reg_write, memory_mem_write;
  logic [1:0] memory_result_src;
  logic [4:0] memory_rd;
  logic [31:0] memory_pc_plus_4, memory_write_data;
  always_ff @(posedge clk) begin
    memory_reg_write <= execute_reg_write;
    memory_result_src <= execute_result_src;
    memory_mem_write <= execute_mem_write;
    memory_alu_result <= execute_alu_result;
    memory_write_data <= execute_write_data;
    memory_rd <= execute_rd;
    memory_pc_plus_4 <= execute_pc_plus_4;
  end

  logic [31:0] memory_read_data;
  always_comb begin
    data_mem_if.addr = memory_alu_result;
    data_mem_if.write_enable = memory_mem_write;
    data_mem_if.write_data = memory_write_data;
    memory_read_data = data_mem_if.read_data;
  end

  logic [1:0] writeback_result_src;
  //logic [4:0] writeback_rd;
  logic [31:0] writeback_pc_plus_4, writeback_alu_result, writeback_read_data;
  always_ff @(posedge clk) begin
    writeback_reg_write <= memory_reg_write;
    writeback_result_src <= memory_result_src;
    writeback_alu_result <= memory_alu_result;
    writeback_read_data <= memory_read_data;
    writeback_rd <= memory_rd;
    writeback_pc_plus_4 <= memory_pc_plus_4;
  end

  always_comb begin
    case (writeback_result_src)
      'b00: writeback_result = writeback_alu_result;
      'b01: writeback_result = writeback_read_data;
      'b10: writeback_result = writeback_pc_plus_4;
      default: writeback_result = 'dx;
    endcase
  end

  hazard_unit hazard_unit (
      .rst(rst),
      .execute_pc_src(execute_pc_src),
      .execute_result_src_0(execute_result_src[0]),
      .memory_reg_write(memory_reg_write),
      .writeback_reg_write(writeback_reg_write),
      .decode_rs_1(decode_rs_1),
      .decode_rs_2(decode_rs_2),
      .execute_rs_1(execute_rs_1),
      .execute_rs_2(execute_rs_2),
      .execute_rd(execute_rd),
      .memory_rd(memory_rd),
      .writeback_rd(writeback_rd),
      .fetch_stall(fetch_stall),
      .decode_stall(decode_stall),
      .decode_flush(decode_flush),
      .execute_flush(execute_flush),
      .execute_forward_a(execute_forward_a),
      .execute_forward_b(execute_forward_b)
  );
endmodule
