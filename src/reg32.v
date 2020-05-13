module reg32 ( clr ,clk ,DOUT ,D , En); 
input wire clr ; 
input wire clk ; 
input wire En;
input wire [31:0] D ;  
output reg [31:0] DOUT ; 

always @ ( negedge clk or posedge clr) 
begin 
    if (clr==1)
			begin
			DOUT <= 0;
			end
    else 
		begin
		if(En)
			begin
			DOUT <= D ;
			end
		else
			;
		end
			
end 
endmodule
