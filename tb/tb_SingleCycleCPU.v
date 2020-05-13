`timescale 1 ns / 1 ns
module tb_SingleCycleCPU();
	
	reg clr;
	reg clk;
	
	//wire [31:0] a_pc;
	wire [31:0] IR;
	wire [31:0] reg_A;
	wire [31:0] reg_B;

SingleCycleCPU cpu(
		.clr(clr), 
		.clk(clk),
		
		.reg_A(reg_A),
		.reg_B(reg_B),
		.IR(IR)
		
		);
		
	initial
	begin
			clr <= 1;
			clk <= 0;
			# 5 
			clr <= 0;
			
	end
	
	always begin
		# 5 clk <= ~clk;
	end
		
endmodule
