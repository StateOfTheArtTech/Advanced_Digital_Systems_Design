module Part_7(
   input wire [5:0] SW,
   output wire [5:0] LEDR,
   output wire [7:0] HEX0,
   output wire [7:0] HEX1
);
   assign LEDR[5:0] = SW[5:0];

   wire [3:0] tens = SW / 4'd10;
   wire [3:0] units = SW % 4'd10;

   Seg7_Decoder seg0(
      .m(units),
      .out(HEX0)
   );

   Seg7_Decoder seg1(
      .m(tens),
      .out(HEX1)
   );
endmodule