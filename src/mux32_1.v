module mux32_1(clr, A, D, DOUT);

input wire [4:0] A;
input wire [31:0] D;
input wire clr;
output wire DOUT;

assign DOUT = D[0] & (A==5'd0) |
    D[1] & (A==5'd1) |
    D[2] & (A==5'd2) |
    D[3] & (A==5'd3) |
    D[4] & (A==5'd4) |
    D[5] & (A==5'd5) |
    D[6] & (A==5'd6) |
    D[7] & (A==5'd7) |
    D[8] & (A==5'd8) |
    D[9] & (A==5'd9) |
    D[10] & (A==5'd10) |
    D[11] & (A==5'd11) |
    D[12] & (A==5'd12) |
    D[13] & (A==5'd13) |
    D[14] & (A==5'd14) |
    D[15] & (A==5'd15) |
    D[16] & (A==5'd16) |
    D[17] & (A==5'd17) |
    D[18] & (A==5'd18) |
    D[19] & (A==5'd19) |
    D[20] & (A==5'd20) |
    D[21] & (A==5'd21) |
    D[22] & (A==5'd22) |
    D[23] & (A==5'd23) |
    D[24] & (A==5'd24) |
    D[25] & (A==5'd25) |
    D[26] & (A==5'd26) |
    D[27] & (A==5'd27) |
    D[28] & (A==5'd28) |
    D[29] & (A==5'd29) |
    D[30] & (A==5'd30) |
    D[31] & (A==5'd31);

endmodule

