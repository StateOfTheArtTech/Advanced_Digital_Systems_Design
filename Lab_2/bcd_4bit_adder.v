module bcd_4bit_adder(
	input wire [3:0] A,
	input wire [3:0] B,
	input wire c_in,
	output wire [3:0] S,
	output wire c_out
);
	wire [3:0] s0;
	wire c0;
	wire [3:0] s1;
	wire c1;
	
	adder_4bit adder_0(
		.A(A),
		.B(B),
		.C_in(c_in),
		.S(s0),
		.C_out(c0)
	);

	bcd_comperator COMP(
		.v({c0, s0}),
		.z(c_out)
	);


	adder_4bit adder_1(
		.A(s0),
		.B(4'b0110),
		.C_in(1'b0),
		.S(s1),
		.C_out(c1)
	);

	mux_4bit_2_1 MUX(
		.s(c_out),
		.x(s0),
		.y(s1),
		.m(S)
	);
endmodule