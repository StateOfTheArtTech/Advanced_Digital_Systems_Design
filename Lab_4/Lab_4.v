module Lab_4(
    input [1:0] SW,
    input [0:0] KEY,
    output [7:0] HEX0,
	 output [7:0] HEX1
);
	wire [7:0] Qt;
    T_FlipFlop_8Bits my_counter (
        .T0(SW[0]),
        .Clk(~KEY[0]),
        .Clear(SW[1]),
        .Qt(Qt)
    );
	 
	 Seg7_Decoder(
		.in(Qt[3:0]),
		.out(HEX0)
	 );
	 
	 Seg7_Decoder(
		.in(Qt[7:4]),
		.out(HEX1)
	 );

endmodule
