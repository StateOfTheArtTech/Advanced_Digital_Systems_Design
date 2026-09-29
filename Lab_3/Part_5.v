module Part_5(
	input wire En,
	input wire [3:0] SW0,
	input wire [3:0] SW1,
	output wire [7:0] HEX0,
	output wire [7:0] HEX1,
	output wire [7:0] HEX2,
	output wire [7:0] HEX3
);
	wire [3:0]seg0, seg1, seg2, seg3;
	
	Latch_4Bits Ls0(.En(En), .in(SW0), .out(seg0));
	Latch_4Bits Ls1(.En(En), .in(SW1), .out(seg1));
	Latch_4Bits Ls2(.En(~En), .in(SW0), .out(seg2));
	Latch_4Bits Ls3(.En(~En), .in(SW1), .out(seg3));
	
	Seg7_Decoder S0(.in(seg0), .out(HEX0));
	Seg7_Decoder S1(.in(seg1), .out(HEX1));
	Seg7_Decoder S2(.in(seg2), .out(HEX2));
	Seg7_Decoder S3(.in(seg3), .out(HEX3));
endmodule