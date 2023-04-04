`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2023 17:12:33
// Design Name: 
// Module Name: adder_tree_comb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_tree_fp#(
    parameter N = 4,
    parameter L = $clog2(N),
    parameter max_stage = L
    //parameter N_bits = 9*2**(1+max_stage)-10-max_stage
    )(
    input logic clk,
    input logic rst,
    input logic [7:0] stage_zero [N-1:0],
    output logic [7+max_stage:0] result
    );

    function int accum_bits
        (input int max_stage_temp);
        int stage;
        int out;
        begin
            out = 0;
            for(stage=0; stage <= max_stage_temp; stage++)
            begin
                out += 2**(max_stage-stage)*(8+stage);
            end
            return out;
        end
    endfunction
    
    function int index
      (input int stage, pos);
        return accum_bits(stage-1)+(8+stage)*pos;
    endfunction
    
    localparam N_bits = accum_bits(max_stage);
    logic [N_bits-1:8*N] tree;
    assign result = tree[N_bits-1 -: 8+max_stage];
    
    generate  
        for(genvar stage=1; stage<=max_stage; stage++)
        begin
            for(genvar pos=0; pos<2**(max_stage-stage); pos++)
            begin
                always_ff @(posedge clk)
                begin
                    if(stage==1)  tree[index(stage, pos) +: (8+stage)] <= stage_zero[2*pos] + stage_zero[2*pos+1];
                    else tree[index(stage, pos) +: (8+stage)] <= tree[index(stage-1, 2*pos) +: (7+stage)] + tree[index(stage-1, 2*pos+1) +: (7+stage)];
                end
            end
        end
    endgenerate
endmodule
