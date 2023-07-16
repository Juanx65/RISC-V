module Wrback(
    //input logic reg_wrW, //en Decode
    input logic [1:0] result_srcW,
    
    input logic [31:0] ALU_resultW, rd_dataW, PCp4W,
    //input logic [4:0] rdW, //en Decode
    
    output logic [31:0] resultW
    );
    
mux3 #(32) datamux(ALU_resultW, rd_dataW, PCp4W, result_srcW, resultW); 
endmodule