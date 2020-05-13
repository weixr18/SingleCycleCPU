module Add32(A, B, S, cin, cout, s_overflow);

	input [31:0] A;
	input [31:0] B;
	input  cin;
	output [31:0] S;
	output cout;
	output s_overflow;

	wire c[8:0];
	
	assign c[0] = 1'b0;	// useless wire

	Add4 add0(
			.a(A[3:0]),
			.b(B[3:0]),
			.cin(cin),		//use input cin, not c[0]
			.cout(c[1]),
			.sum(S[3:0])
			);
	Add4 add1(
			.a(A[7:4]),
			.b(B[7:4]),
			.cin(c[1]),
			.cout(c[2]),
			.sum(S[7:4])
			);
	Add4 add2(
			.a(A[11:8]),
			.b(B[11:8]),
			.cin(c[2]),
			.cout(c[3]),
			.sum(S[11:8])
			);
	Add4 add3(
			.a(A[15:12]),
			.b(B[15:12]),
			.cin(c[3]),
			.cout(c[4]),
			.sum(S[15:12])
			);
	Add4 add4(
			.a(A[19:16]),
			.b(B[19:16]),
			.cin(c[4]),
			.cout(c[5]),
			.sum(S[19:16])
			);
	Add4 add5(
			.a(A[23:20]),
			.b(B[23:20]),
			.cin(c[5]),
			.cout(c[6]),
			.sum(S[23:20])
			);
	Add4 add6(
			.a(A[27:24]),
			.b(B[27:24]),
			.cin(c[6]),
			.cout(c[7]),
			.sum(S[27:24])
			);
	Add4 add7(
			.a(A[31:28]),
			.b(B[31:28]),
			.cin(c[7]),
			.cout(c[8]),
			.sum(S[31:28])
			);
			
	assign cout = c[8];
	assign s_overflow = (A[31] == B[31]) & (S[31] != A[31]);


endmodule
