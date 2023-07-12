`include "timescale.sv"

module cache_memory #(
    parameter int ADDR_SIZE  = 32,
    parameter int NUM_SETS   = 16,
    parameter int NUM_WAYS   = 4,
    parameter int BLOCK_SIZE = 32
) (
    input logic clk,
    input logic rst,
    input logic [$clog2(NUM_WAYS) - 1:0] write_way,
    input logic [$clog2(NUM_SETS) - 1:0] set,
    input logic [ADDR_SIZE - $clog2(NUM_SETS) - $clog2(BLOCK_SIZE / 4) - 1:0] tag,
    input logic write_enable,
    input logic [BLOCK_SIZE - 1:0] write_data,
    output logic [BLOCK_SIZE - 1:0] read_data,
    output logic [$clog2(NUM_WAYS) - 1:0] populate_way,
    output logic populated,
    output logic hit
);
  localparam int NumBlockBytes = BLOCK_SIZE / 4;
  localparam int ByteOffsetSize = $clog2(NumBlockBytes);
  localparam int WaySize = $clog2(NUM_WAYS);
  localparam int SetSize = $clog2(NUM_SETS);
  localparam int TagSize = ADDR_SIZE - SetSize - ByteOffsetSize;

  logic [NUM_WAYS - 1:0] hits;
  logic [WaySize-1:0] way;
  logic [WaySize-1:0] read_way;
  priority_encoder #(
      .N(WaySize)
  ) read_way_encoder (
      .data_in(hits),
      .data_out(read_way),
      .valid(hit)
  );

  always_comb begin
    if (write_enable) way = write_way;
    else way = read_way;
  end

  typedef struct packed {
    logic [BLOCK_SIZE - 1:0] data;
    logic [TagSize - 1:0] tag;
    logic valid;
  } cache_line_t;

  typedef cache_line_t [NUM_SETS - 1:0] cache_way;
  cache_way [NUM_WAYS - 1:0] ways;

  assign read_data = ways[way][set].data;

  always_ff @(posedge clk) begin
    if (rst) begin
      // Reset valid flags
      for (int i = 0; i < NUM_WAYS; i++) begin
        for (int j = 0; j < NUM_SETS; j++) begin
          ways[i][j].data  <= BLOCK_SIZE'('dx);
          ways[i][j].tag   <= TagSize'('dx);
          ways[i][j].valid <= 0;
        end
      end
    end else if (write_enable) begin
      ways[way][set].data  <= write_data;
      ways[way][set].tag   <= tag;
      ways[way][set].valid <= 1;
    end
  end

  logic [NUM_WAYS - 1:0] valid_flags;
  always_comb begin
    for (int i = 0; i < NUM_WAYS; i++) begin
      valid_flags[i] = ways[i][set].valid;
      hits[i] = ways[i][set].valid && (tag == ways[i][set].tag);
    end
  end

  logic valid_flags_index_valid;
  logic[WaySize-1:0] valid_flags_index;

  priority_encoder #(
      .N(WaySize)
  ) populate_way_encoder (
      .data_in(valid_flags),
      .data_out(valid_flags_index),
      .valid(valid_flags_index_valid)
  );
  /*
  generate
    if (WaySize > 1)
        always_comb populated &= populate_way;
    else
        assign populated = populate_way;
  endgenerate*/
  
  always_comb begin
    if(valid_flags_index_valid)
        {populated, populate_way} = valid_flags_index + 'd1;
    else
        {populated, populate_way} = 'd0;
  end
endmodule
