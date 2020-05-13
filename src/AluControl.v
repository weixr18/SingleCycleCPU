module AluControl(AluCtrl, funct, AluOp);

input wire [2:0] AluCtrl;
input wire [5:0] funct;

output wire [3:0] AluOp;


wire R_format = (AluCtrl == 3'd7);

wire is_add = (AluCtrl == 3'd2) | R_format & (funct == 6'h20);
wire is_sub =  R_format & (funct == 6'h22);

wire is_and = (AluCtrl == 3'd0) | R_format & (funct == 6'h24);
wire is_or = (AluCtrl == 3'd1) | R_format & (funct == 6'h25);
wire is_nor = R_format & (funct == 6'h27);

wire is_sll = R_format & (funct == 6'h0);
wire is_srl = R_format & (funct == 6'h2);
wire is_sra = R_format & (funct == 6'h3);

wire is_slt = (AluCtrl == 3'd3) | R_format & (funct == 6'h2a);
wire is_sltu = (AluCtrl == 3'd4) | R_format & (funct == 6'h2b);

wire is_beq = (AluCtrl == 3'd5); 
wire is_bne = (AluCtrl == 3'd6);


assign AluOp =  {4{is_and}} & 4'b0000 |
						{4{is_or}} & 4'b0001 |
						{4{is_nor}} & 4'b1100 |
						
						{4{is_add}} & 4'b0010 |
						{4{is_sub}} & 4'b0110 |
						
						{4{is_sll}} & 4'b1001 |						
						{4{is_srl}} & 4'b1010 |
						{4{is_sra}} & 4'b1011 |
						
						{4{is_slt}} & 4'b0111 |
						{4{is_sltu}} & 4'b0011 |
						
						{4{is_beq}} & 4'b0100 |
						{4{is_bne}} & 4'b0101 ;
						


endmodule

