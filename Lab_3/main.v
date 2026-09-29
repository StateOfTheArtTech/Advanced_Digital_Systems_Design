module main(
	input               MAX10_CLK1_50,
	input			 [9:0]  SW,
	output       [9:0]  LEDR,
	output       [7:0]  HEX0,
	output       [7:0]  HEX1,
	output       [7:0]  HEX2,
	output       [7:0]  HEX3,
	output       [7:0]  HEX4,
	output       [7:0]  HEX5,
	inout        [9:0]  GPIO
);

	// Your Code
	// assign LEDR[9:0] = SW[9:0];
//	Seg7_Decoder seg1(
//		.in(SW[7:0]),
//		.out(HEX0)
//	);
	
	RS_Latch rsl(.Clk(MAX10_CLK1_50), .R(SW[0]), .S(SW[1]), .Q(LEDR[0])); 
	
endmodule
