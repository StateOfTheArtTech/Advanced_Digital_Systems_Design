module Part_6(
   input wire [7:0] SW,
   output wire [7:0] LEDR,
   output wire [7:0] HEX0,
   output wire [7:0] HEX1,
   output wire [7:0] HEX2
);
	// Again, they have to share 
   wire [3:0] A0 = SW[3:0];
   wire [3:0] A1 = SW[3:0];
   wire [3:0] B0 = SW[7:4];
   wire [3:0] B1 = SW[7:4];

   assign LEDR[7:0] = SW[7:0];

   reg [4:0] T0;
	reg [4:0] T1;
	reg c1;
	reg c2;
	
	reg [3:0] S0;
   reg [3:0] S1;
   reg [3:0] S2;


   always @(*) begin
      T0 = A0 + B0;
      if (T0 > 9) begin
         c1 = 1'b1;
         S0 = T0 + 4'd6;
      end else begin
         c1 = 1'b0;
         S0 = T0[3:0];
      end

      T1 = A1 + B1 + c1;
      if (T1 > 9) begin
         c2 = 1'b1;
         S1 = T1 + 4'd6;
      end else begin
         c2 = 1'b0;
         S1 = T1[3:0];
      end

      S2 = {3'b000, c2};
   end

   Seg7_Decoder dec_s0(.m(S0), .out(HEX0));
   Seg7_Decoder dec_s1(.m(S1), .out(HEX1));
   Seg7_Decoder dec_s2(.m(S2), .out(HEX2));
endmodule