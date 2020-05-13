module tb_regHeap();
	
reg clr;
reg clk;

reg [4:0] rs;
reg [4:0] rt;
wire [31:0] o_A;
wire [31:0] o_B;

reg [4:0] rd;
reg s_write; 
reg [31:0] W;

/*
wire [1023:0] S;
wire [31:0] RD;
*/
	
regHeap regheap(
		.clr(clr), 
		.clk(clk), 
		.rs(rs), 
		.rt(rt), 
		.o_A(o_A), 
		.o_B(o_B),
		.rd(rd), 
		.s_write(s_write), 
		
		.W(W)
);
		
	initial
	begin
		clr <= 0;
		# 2
			clr <= 1;
			clk <= 0;
			rs <= 0;
			rt <= 1;
			rd <= 0;
			s_write <= 0;
			W <= 32'd0;
			
			# 36 
			clr <= 0;
			
			# 6
			s_write <= 1'd1;
			# 5
			rd <= 5'd4;
			W <= 32'habcd;
			
			
			# 10
			s_write <= 1'd0;
			rs <= 5'd4;
			
			# 17
			rd <= 5'd4;
			
			
			
			
			
	end
	
	always begin
		# 5 clk <= ~clk;
	end
		
endmodule
