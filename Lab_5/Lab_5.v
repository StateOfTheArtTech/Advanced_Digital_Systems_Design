module Lab_5 (
   input[9:0]SW,
   input[1:0]KEY,
   output[7:0]HEX0,
   output[7:0]HEX1,
   output[7:0]HEX2
);
   wire[9:0]P;

   Array_Multiplier_5Bit mult(
      .A(SW[9:5]),
      .B(SW[4:0]),
      .clk(~KEY[0]),
      .P(P)
   );

   Seg7_Decoder seg0(.in(P[3:0]),.out(HEX0));
   Seg7_Decoder seg1(.in(P[7:4]),.out(HEX1));
   Seg7_Decoder seg2(.in({2'b0,P[9:8]}),.out(HEX2));



//P3
//   wire [3:0] A = SW[7:4];
//   wire [3:0] B = SW[3:0];
//   wire [7:0] P;
//
//   Array_Multiplier_4Bit mult (
//      .A(A),
//      .B(B),
//      .P(P)
//   );
//
//   Seg7_Decoder seg_p0 (.in(P[3:0]), .out(HEX0));
//   Seg7_Decoder seg_p1 (.in(P[7:4]), .out(HEX1));
//   Seg7_Decoder seg_b  (.in(B), .out(HEX4));
//   Seg7_Decoder seg_a  (.in(A), .out(HEX5));
	
//P2
//   Add_Sub_Accumulator accum (
//      .A(SW[9:2]),
//      .clk(~KEY[1]), 
//      .sub(SW[0]),
//      .S(LEDR[9:2]),
//      .overflow(LEDR[1])
//   );

endmodule