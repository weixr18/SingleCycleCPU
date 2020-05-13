module tb_Decoder5_32();
	
reg [4:0] D;
wire [31:0] DOUT;

	
Decoder5_32 decoder(
		.D(D), 
		.DOUT(DOUT)
);
		
initial
	begin
		D <= 5'd0;
		# 5
		D <= 5'd1;
		# 5
		D <= 5'd2;
		# 5
		D <= 5'd3;
		# 5
		D <= 5'd4;
		# 5
		D <= 5'd5;
		# 5
		D <= 5'd6;
		# 5
		D <= 5'd7;
		# 5
		D <= 5'd8;
		# 5
		D <= 5'd9;
		# 5
		D <= 5'd10;
		# 5
		D <= 5'd11;
		# 5
		D <= 5'd12;
		# 5
		D <= 5'd13;
		# 5
		D <= 5'd14;
		# 5
		D <= 5'd15;
			
			
			
	end
	
endmodule
