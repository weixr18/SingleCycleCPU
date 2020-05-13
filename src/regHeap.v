module regHeap(clr, clk, 
					rs, rt, o_A, o_B,
					rd, s_write, W,
					s_reg_wb_dst
					//,S, RD
					);

					
input wire clr;
input wire clk;

input wire [4:0] rs;
input wire [4:0] rt;
output wire [31:0] o_A;
output wire [31:0] o_B;

input wire [4:0] rd;
input wire s_write; 
input wire s_reg_wb_dst;
input wire [31:0] W;

wire [31:0] RD;
wire [31:0] RT;

Decoder5_32 decoder(
		.D(rd), 
		.DOUT(RD));

Decoder5_32 decoder2(
		.D(rt), 
		.DOUT(RT));

wire [31:0] Wr_Ch;
assign Wr_Ch = ({32{s_reg_wb_dst}} & RT | {32{~s_reg_wb_dst}} & RD);
		
wire [1023:0] S;
		
reg32 reg_0(
    .clr(1'b1),
    .clk(clk),
    .En(s_write & Wr_Ch[0]),
    .DOUT(S[31:0]),
    .D(W)
);
reg32 reg_1(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[1]),
    .DOUT(S[63:32]),
    .D(W)
);
reg32 reg_2(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[2]),
    .DOUT(S[95:64]),
    .D(W)
);
reg32 reg_3(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[3]),
    .DOUT(S[127:96]),
    .D(W)
);
reg32 reg_4(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[4]),
    .DOUT(S[159:128]),
    .D(W)
);
reg32 reg_5(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[5]),
    .DOUT(S[191:160]),
    .D(W)
);
reg32 reg_6(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[6]),
    .DOUT(S[223:192]),
    .D(W)
);
reg32 reg_7(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[7]),
    .DOUT(S[255:224]),
    .D(W)
);
reg32 reg_8(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[8]),
    .DOUT(S[287:256]),
    .D(W)
);
reg32 reg_9(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[9]),
    .DOUT(S[319:288]),
    .D(W)
);
reg32 reg_10(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[10]),
    .DOUT(S[351:320]),
    .D(W)
);
reg32 reg_11(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[11]),
    .DOUT(S[383:352]),
    .D(W)
);
reg32 reg_12(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[12]),
    .DOUT(S[415:384]),
    .D(W)
);
reg32 reg_13(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[13]),
    .DOUT(S[447:416]),
    .D(W)
);
reg32 reg_14(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[14]),
    .DOUT(S[479:448]),
    .D(W)
);
reg32 reg_15(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[15]),
    .DOUT(S[511:480]),
    .D(W)
);
reg32 reg_16(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[16]),
    .DOUT(S[543:512]),
    .D(W)
);
reg32 reg_17(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[17]),
    .DOUT(S[575:544]),
    .D(W)
);
reg32 reg_18(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[18]),
    .DOUT(S[607:576]),
    .D(W)
);
reg32 reg_19(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[19]),
    .DOUT(S[639:608]),
    .D(W)
);
reg32 reg_20(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[20]),
    .DOUT(S[671:640]),
    .D(W)
);
reg32 reg_21(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[21]),
    .DOUT(S[703:672]),
    .D(W)
);
reg32 reg_22(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[22]),
    .DOUT(S[735:704]),
    .D(W)
);
reg32 reg_23(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[23]),
    .DOUT(S[767:736]),
    .D(W)
);
reg32 reg_24(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[24]),
    .DOUT(S[799:768]),
    .D(W)
);
reg32 reg_25(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[25]),
    .DOUT(S[831:800]),
    .D(W)
);
reg32 reg_26(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[26]),
    .DOUT(S[863:832]),
    .D(W)
);
reg32 reg_27(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[27]),
    .DOUT(S[895:864]),
    .D(W)
);
reg32 reg_28(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[28]),
    .DOUT(S[927:896]),
    .D(W)
);
reg32 reg_29(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[29]),
    .DOUT(S[959:928]),
    .D(W)
);
reg32 reg_30(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[30]),
    .DOUT(S[991:960]),
    .D(W)
);
reg32 reg_31(
    .clr(clr),
    .clk(clk),
    .En(s_write & Wr_Ch[31]),
    .DOUT(S[1023:992]),
    .D(W)
);
/*
"reg32 reg_" + str(x) + "(\n" +\
"    .clr(clr),\n" +\
"    .clk(clk),\n" +\
"    .En(s_write & Wr_Ch[" + str(x) + "]),\n" +\
"    .DOUT(S[" + str(31+32*x) + ":" + str(32*x) +"]),\n" +\
"    .D(W)\n" +\
");"
*/
		





mux32_32 mux_rs(
	.clr(clr),
	.A(rs),
	.D(S),
	.DOUT(o_A)
);

mux32_32 mux_rt(
	.clr(clr),
	.A(rt),
	.D(S),
	.DOUT(o_B)
);


endmodule

