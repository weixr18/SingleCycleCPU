module mux4_32(A, D0, D1, D2, D3, DOUT);

input wire [1:0] A;
input wire [31:0] D0;
input wire [31:0] D1;
input wire [31:0] D2;
input wire [31:0] D3;
output wire [31:0] DOUT;

assign DOUT = D0 & {32{(A==2'd0)}} |   D1 & {32{(A==2'd1)}}|
				  D2 & {32{(A==2'd2)}} |   D3 & {32{(A==2'd3)}};

endmodule

