module HW_4(
    input [1:0] KEY,
    input [2:0]SW,
    output [7:5] LEDR
);
//    JK_FlipFlop jkff0(
//        .clk(~KEY[0]),  
//        .clr(~KEY[1]),  
//        .J(SW[0]),
//        .K(SW[1]),
//        .Q(LEDR[0])
//    );

	lfsr lfsr0(.Clock(~KEY[0]), .R(SW[2:0]), .L(SW[0]), .Q(LEDR[7:5]));
endmodule