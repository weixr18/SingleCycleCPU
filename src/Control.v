module Control(opcode, AluCtrl, s_Imext, 
				s_A_src, s_B_src, s_PC_src, 
				s_write_mem, s_write_reg,  
				s_reg_wb_src, s_reg_wb_dst);

input wire [5:0] opcode;

output wire [2:0] AluCtrl;
output wire s_Imext;
output wire s_A_src;
output wire s_B_src;
output wire [1:0] s_PC_src;
output wire s_write_reg;
output wire s_reg_wb_src;
output wire s_write_mem;
output wire s_reg_wb_dst;

wire R_format = (opcode == 6'b0);

wire is_add = (opcode == 6'h8) | 
			  (opcode == 6'h23) | 
			  (opcode == 6'h2b);
			  
wire is_and = (opcode == 6'hc);
wire is_or = (opcode == 6'hd);
wire is_slt = (opcode == 6'ha);
wire is_sltu = (opcode == 6'hb);

wire is_beq = (opcode == 6'h4); 
wire is_bne = (opcode == 6'h5);
wire is_J = (opcode == 6'h2);

wire is_lw = (opcode == 6'h23); 
wire is_sw = (opcode == 6'h2b);
wire is_lwsw = is_lw | is_sw;
wire is_lui = (opcode == 6'hf);


assign AluCtrl =  {3{is_and}} & 3'd0 |
						{3{is_or}} & 3'd1 |
						{3{is_add}} & 3'd2 |
						{3{is_slt}} & 3'd3 |
						{3{is_sltu}} & 3'd4 |
						{3{is_beq}} & 3'd5 |
						{3{is_bne}} & 3'd6 |
						{3{R_format}} & 3'd7 ;
						
assign s_Imext = is_and | is_or;

assign s_A_src = is_beq | is_bne;

assign s_B_src = ~R_format;

assign s_PC_src = {2{is_J}} & 2'b01 | {2{is_beq | is_bne}} & 2'b10;

assign s_write_reg = ~(is_sw | is_beq | is_bne | is_J);

assign s_reg_wb_src = is_lw;

assign s_reg_wb_dst = ~R_format;

assign s_write_mem = is_sw;

endmodule

