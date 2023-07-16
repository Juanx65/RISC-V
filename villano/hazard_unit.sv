module hazard_unit(
    input logic [4:0] rs1D, rs2D, 
    input logic [4:0] rs1E, rs2E, rdE,
    input logic PC_srcE, result_srcE0,
    input logic [4:0] rdM, 
    input logic reg_wrM, reg_wrW,
    input logic [4:0] rdW,
    output logic stallF, stallD,
    output logic flushD, flushE,
    output logic [1:0] fwdAE, fwdBE
    );
    
always_comb
begin
    if((rs1E==rdM) && reg_wrM && (rs1E != 0))
        fwdAE = 2'b10;
    else if((rs1E==rdW) && reg_wrW && (rs1E != 0) )
        fwdAE = 2'b01;
    else
        fwdAE = 2'b00;
end

always_comb
begin
    if((rs2E==rdM) && reg_wrM && (rs2E != 0))
        fwdBE = 2'b10;
    else if((rs2E==rdW) && reg_wrW && (rs2E != 0) )
        fwdBE = 2'b01;
    else
        fwdBE = 2'b00;
end

logic lw_stall;
assign lw_stall = result_srcE0 && ((rs1D==rdE)||(rs2D==rdE));
assign stallF = lw_stall;
assign stallD = lw_stall;

assign flushD = PC_srcE;
assign flushE = lw_stall || PC_srcE;
endmodule
