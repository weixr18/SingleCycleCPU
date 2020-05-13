module ImExt(D, DOUT, s_Imext);

input wire [15:0] D;
input wire s_Imext;
output wire [31:0] DOUT;

wire [31:0] D1;
wire [31:0] D2;

assign D1 = {{16'b0}, {D}} & {32{~s_Imext}} ;
assign D2 = {{16{D[15]}}, {D}} & {32{s_Imext}};
assign DOUT = D1 | D2;

endmodule

