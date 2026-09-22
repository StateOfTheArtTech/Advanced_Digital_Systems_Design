module Part_5(
   input wire [7:0] SW,
   output wire [7:0] LEDR,
   output wire [7:0] HEX0,
   output wire [7:0] HEX1,
   output wire [7:0] HEX2
);
   // Less switches so unfortunately they have to share
   wire [3:0] A0 = {SW[3], SW[2], SW[1], SW[0]};
   wire [3:0] A1 = {SW[3], SW[2], SW[1], SW[0]};

   wire [3:0] B0 = {SW[7], SW[6], SW[5], SW[4]};
   wire [3:0] B1 = {SW[7], SW[6], SW[5], SW[4]};

   assign LEDR[7:0] = SW[7:0];

   wire [3:0] S0;
	wire [3:0] S1;
   wire c0;
	wire c1;
	
	
   bcd_4bit_adder bcd_adder0(
      .A(A0),
      .B(B0),
      .c_in(1'b0),
      .S(S0),
      .c_out(c0)
   );


   bcd_4bit_adder bcd_adder1(
      .A(A1),
      .B(B1),
      .c_in(c0),
      .S(S1),
      .c_out(c1)
   );

   wire [3:0] S2 = {3'b000, c1};

   Seg7_Decoder dec_s0(.m(S0), .out(HEX0));
   Seg7_Decoder dec_s1(.m(S1), .out(HEX1));
   Seg7_Decoder dec_s2(.m(S2), .out(HEX2));
	
endmodule