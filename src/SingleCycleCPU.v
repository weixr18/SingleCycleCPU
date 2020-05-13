module SingleCycleCPU(clr, clk
							//, reg_A, reg_B
							//,IR
							);

input wire clk;
input wire clr;

/******************  Get Instruction ******************/

wire [31:0] a_pc;
wire [31:0] a_pc_plus;
wire [31:0] a_pc_in;
wire [1:0] s_PC_src;

reg32 PC( 
	.clr(clr),
	.clk(~clk),
	.DOUT(a_pc),
	.D(a_pc_in), 
	.En(1'b1)); 
	
Add32 pcadd(
	.A(a_pc), 
	.B(32'd1), 
	.S(a_pc_plus), 
	.cin(1'b0), 
	.cout(), 
	.s_overflow()
	);
		
wire [31:0] a_pc_branch;
wire [31:0] a_pc_j;
wire s_Equal;

mux4_32 a_pc_src(
		.A({s_PC_src[1]&s_Equal, s_PC_src[0]}), 
		.D0(a_pc_plus), 
		.D1(a_pc_j), 
		.D2(a_pc_branch), 
		.D3(a_pc_branch), 
		.DOUT(a_pc_in));
		
// output wire [31:0] IR;
wire [31:0] IR;
		
insrtROM rom(
	.address(a_pc[7:0]),
	.clken(1'b1),
	.clock(clk),
	.q(IR));
	
/************************ Register access ***********************/	

//output wire [31:0] reg_A;
//output wire [31:0] reg_B;
wire [31:0] reg_A;
wire [31:0] reg_B;
wire [31:0] reg_W;

wire s_write_reg;
wire s_reg_wb_dst;

regHeap regheap(
		.clr(clr), 
		.clk(clk), 
		.rs(IR[25:21]), 
		.rt(IR[20:16]), 
		.o_A(reg_A), 
		.o_B(reg_B),
		.rd(IR[15:11]), 
		.s_write(s_write_reg), 
		.W(reg_W),
		.s_reg_wb_dst(s_reg_wb_dst)
);

wire [2:0] AluCtrl;
wire s_Imext;
wire s_write_mem;

wire s_A_src;
wire s_B_src;
wire s_reg_wb_src;


Control control(
		.opcode(IR[31:26]), 
		.AluCtrl(AluCtrl), 
		.s_Imext(s_Imext), 
		.s_A_src(s_A_src), 
		.s_B_src(s_B_src), 
		.s_PC_src(s_PC_src), 
		.s_write_reg(s_write_reg), 
		.s_reg_wb_src(s_reg_wb_src),
		.s_reg_wb_dst(s_reg_wb_dst),
		.s_write_mem(s_write_mem)
);

wire [3:0] AluOp;

AluControl alucontrol(
		.AluCtrl(AluCtrl), 
		.funct(IR[5:0]), 
		.AluOp(AluOp)
); 

wire [31:0] ext_imm;

ImExt imext(
		.D(IR[15:0]), 
		.DOUT(ext_imm), 
		.s_Imext(s_Imext));

assign a_pc_j = {{a_pc_plus[31:26]}, {IR[25:0]}};
		
		
/******************** ALU operations ************************/
wire [31:0] A_in;
wire [31:0] B_in;

mux2_32 A_src(
		.A(s_A_src),
		.D0(reg_A),
		.D1(32'b0),
		.DOUT(A_in)
);

mux2_32 B_src(
		.A(s_B_src),
		.D0(reg_B),
		.D1(ext_imm),
		.DOUT(B_in)
);

wire [31:0] ALU_res;



wire s_overflow;


ALU32 alu(
		.A(A_in), 
		.B(B_in), 
		.S(ALU_res), 
		.AluOp(AluOp), 
		.s_Equal(s_Equal), 
		.s_Overflow(s_overflow),
		.cout()
		);
/*
wire [31:0] sft_ext_imm;
assign sft_ext_imm = {{ext_imm[29:0]},{2'b0}};
PC只加一，不需要移位！！！
*/

Add32 add32(
		.A(a_pc_plus), 
		.B(ext_imm), 
		.S(a_pc_branch), 
		.cin(1'b0), 
		.cout(), 
		.s_overflow()
);		

/********************** Data Memory Access ********************/
wire [31:0] Mem_out;

mux2_32 reg_wb_src(
		.A(s_reg_wb_src),
		.D0(ALU_res),
		.D1(Mem_out),
		.DOUT(reg_W)
);

dataRAM RAM(
	.address(ALU_res[5:0]),
	.clken(1'b1),
	.clock(clk),
	.data(reg_B),
	.wren(s_write_mem),
	.q(Mem_out));
		
		
endmodule
