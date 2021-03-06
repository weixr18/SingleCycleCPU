module mux32_32(clr, A, D, DOUT);

input wire clr;
input wire [4:0] A;
input wire [1023:0] D;
output wire [31:0] DOUT;

assign DOUT =     D[31:0] & {32{(A==5'd0)}} |
    D[63:32] & {32{(A==5'd1)}} |
    D[95:64] & {32{(A==5'd2)}} |
    D[127:96] & {32{(A==5'd3)}} |
    D[159:128] & {32{(A==5'd4)}} |
    D[191:160] & {32{(A==5'd5)}} |
    D[223:192] & {32{(A==5'd6)}} |
    D[255:224] & {32{(A==5'd7)}} |
    D[287:256] & {32{(A==5'd8)}} |
    D[319:288] & {32{(A==5'd9)}} |
    D[351:320] & {32{(A==5'd10)}} |
    D[383:352] & {32{(A==5'd11)}} |
    D[415:384] & {32{(A==5'd12)}} |
    D[447:416] & {32{(A==5'd13)}} |
    D[479:448] & {32{(A==5'd14)}} |
    D[511:480] & {32{(A==5'd15)}} |
    D[543:512] & {32{(A==5'd16)}} |
    D[575:544] & {32{(A==5'd17)}} |
    D[607:576] & {32{(A==5'd18)}} |
    D[639:608] & {32{(A==5'd19)}} |
    D[671:640] & {32{(A==5'd20)}} |
    D[703:672] & {32{(A==5'd21)}} |
    D[735:704] & {32{(A==5'd22)}} |
    D[767:736] & {32{(A==5'd23)}} |
    D[799:768] & {32{(A==5'd24)}} |
    D[831:800] & {32{(A==5'd25)}} |
    D[863:832] & {32{(A==5'd26)}} |
    D[895:864] & {32{(A==5'd27)}} |
    D[927:896] & {32{(A==5'd28)}} |
    D[959:928] & {32{(A==5'd29)}} |
    D[991:960] & {32{(A==5'd30)}} |
    D[1023:992] & {32{(A==5'd31)}};

endmodule

