module adder_4bit(
	input 	[3:0]A,
	input 	[3:0]B,
	input		C_in,
	output	[3:0]S,
	output	C_out
);
	wire c0,c1,c2;
	full_adder FA0(.a(A[0]),.b(B[0]), .c_i(C_in),.s(S[0]),.c_o(c0));
	full_adder FA1(.a(A[1]),.b(B[1]), .c_i(c0),.s(S[1]),.c_o(c1));
	full_adder FA2(.a(A[2]),.b(B[2]), .c_i(c1),.s(S[2]),.c_o(c2));
	full_adder FA3(.a(A[3]),.b(B[3]), .c_i(c2),.s(S[3]),.c_o(C_out));

endmodule