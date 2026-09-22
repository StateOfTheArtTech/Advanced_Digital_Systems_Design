module Part_1(	
	input		[9:0] SW,
	output 	[9:0] LEDR,
	output	[7:0]	HEX0,
	output	[7:0]	HEX1
);
	assign LEDR[9:0] = SW[9:0];
	
	Seg7_Decoder seg_0(
		.m(SW[3:0]), 
		.out(HEX0[7:0])
	);
	
	Seg7_Decoder seg_1(
		.m(SW[7:4]), 
		.out(HEX1[7:0])
	);
endmodule