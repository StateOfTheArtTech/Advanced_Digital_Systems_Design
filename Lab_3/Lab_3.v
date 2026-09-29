module Lab_3(
	input wire [9:0] SW,
	output wire [9:0] LEDR,
	output wire [7:0] HEX0,
	output wire [7:0] HEX1,
	output wire [7:0] HEX2,
	output wire [7:0] HEX3
);

	// Your Code
	// assign LEDR[9:0] = SW[9:0];
//	Seg7_Decoder seg1(
//		.in(SW[7:0]),
//		.out(HEX0)
//	);
	
	//RS_Latch rsl(.Clk(SW[2]), .R(SW[0]), .S(SW[1]), .Q(LEDR[0])); 
	//D_Latch dl(.Clk(SW[1]), .D(SW[0]), .Q(LEDR[0])); 
	//MS_D_Flop msdf(.Clk(SW[0]), .D(SW[1]), .Q(LEDR[0])); 
	//D3_Latch d3l(.Clk(SW[0]), .D(SW[1]), .Qa(LEDR[0]), .Qb(LEDR[1]), .Qc(LEDR[2])); 
	
	assign LEDR = SW;
	Part_5 part5_inst (
		.En(SW[9]),
		.SW0(SW[3:0]),
		.SW1(SW[7:4]),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3)
	);
	 
endmodule
