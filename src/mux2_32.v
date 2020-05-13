module mux2_32(A, D0, D1, DOUT);

input wire  A;
input wire [31:0] D0;
input wire [31:0] D1;
output wire [31:0] DOUT;

assign DOUT = D0 & {32{(A==1'd0)}} |   D1 & {32{(A==1'd1)}};

endmodule

