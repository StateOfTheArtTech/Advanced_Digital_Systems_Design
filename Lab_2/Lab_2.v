module Lab_2 (
	input		[9:0] SW,
   output 	[9:0] LEDR,    
   input				MAX10_CLK1_50,
   output 	[7:0] HEX0,
   output 	[7:0] HEX1,
   output 	[7:0] HEX2,
   output 	[7:0] HEX3,
   output 	[7:0] HEX4,
   output 	[7:0] HEX5
);

//	Part_1 u_part1(
//		.SW(SW),
//      .LEDR(LEDR),
//		.HEX0(HEX0),
//      .HEX1(HEX1),
//	);

//	Part_2 u_part2(
//		.SW(SW),
//      .LEDR(LEDR),
//      .MAX10_CLK1_50(MAX10_CLK1_50),
//      .HEX0(HEX0),
//      .HEX1(HEX1),
//      .HEX2(HEX2),
//      .HEX3(HEX3),
//      .HEX4(HEX4),
//      .HEX5(HEX5)
//	);
	
//	Part_3 u_part3(
//		.SW(SW[8:0]),
//	   .HEX0(HEX0),
//		.HEX1(HEX1),
//		.LEDR(LEDR)
//	);
	
//	Part_4 u_part4 (
//		.SW(SW[8:0]),
//		.LEDR(LEDR[9:0]),
//		.HEX0(HEX0),
//		.HEX1(HEX1),
//		.HEX4(HEX4),
//		.HEX5(HEX5)
//	);

//	Part_5 u_part5 (
//		.SW(SW[7:0]),
//		.LEDR(LEDR[7:0]),
//		.HEX0(HEX0),
//		.HEX1(HEX1),
//		.HEX2(HEX2)
//	);

	Part_6 u_part6 (
		.SW(SW[7:0]),
		.LEDR(LEDR[7:0]),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2)
	);
	
//	Part_7 u_part7 (
//		.SW(SW[5:0]),
//		.LEDR(LEDR[7:0]),
//		.HEX0(HEX0),
//		.HEX1(HEX1)
//	);

endmodule




