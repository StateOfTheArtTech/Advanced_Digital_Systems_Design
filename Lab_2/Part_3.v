module Part_3(
	input 	[8:0] SW,
	output	[7:0] HEX0,
	output	[7:0] HEX1,
	output	[9:0] LEDR
);
	wire c_in = SW[8];
	wire s0,s1,s2,s3;
	wire c0,c1,c2,c3;
	assign LEDR[8:0] = SW[8:0];
	full_adder FA0(.a(SW[0]),.b(SW[4]), .c_i(c_in),.s(s0),.c_o(c0));
	full_adder FA1(.a(SW[1]),.b(SW[5]), .c_i(c0),.s(s1),.c_o(c1));
	full_adder FA2(.a(SW[2]),.b(SW[6]), .c_i(c1),.s(s2),.c_o(c2));
	full_adder FA3(.a(SW[3]),.b(SW[7]), .c_i(c2),.s(s3),.c_o(c3));
	assign LEDR[9] = c3;
	//Seg7_Decoder seg7(
	//	.m({s3,s2,s1,s0}), 
	//	.out(HEX0)
	//);
	
	//Used logic from part two to display output since no green LEDS
	Part_2 P2 (
		.SW({6'b0, s3, s2, s1, s0}),
		.LEDR(),
		.MAX10_CLK1_50(1'b0),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(),
		.HEX3(),
		.HEX4(),
		.HEX5()
	);
	
endmodule