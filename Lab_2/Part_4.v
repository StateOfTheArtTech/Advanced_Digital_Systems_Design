module Part_4(
  input wire [8:0] SW,
  output wire [9:0] LEDR,
  output wire [7:0] HEX0,
  output wire [7:0] HEX1,
  output wire [7:0] HEX4,
  output wire [7:0] HEX5
);
  wire [3:0] A = SW[7:4];
  wire [3:0] B = SW[3:0];
  wire c_in = SW[8];

  assign LEDR[7:0] = SW[7:0];
  assign LEDR[8] = c_in;

  wire err_A = A[3] & (A[2] | A[1]);
  wire err_B = B[3] & (B[2] | B[1]);
  assign LEDR[9] = err_A | err_B;

  wire [3:0] s0;
  wire C_out;
  adder_4bit adder_0(
    .A(A),
    .B(B),
    .C_in(c_in),
    .S(s0),
    .C_out(C_out)
  );

  wire z;
  bcd_comperator COMP(
    .v({C_out, s0}),
    .z(z)
  );

  wire [3:0] s1;
  wire c_out_dummy;
  adder_4bit adder_1(
    .A(s0),
    .B(4'b0110),
    .C_in(1'b0),
    .S(s1),
    .C_out(c_out_dummy)
  );

  wire [7:0] S;
  mux_4bit_2_1 MUX(
    .s(z),
    .x(s0),
    .y(s1),
    .m(S[3:0])
  );
  assign S[7:4] = {3'b000, z};

  Seg7_Decoder dec_a(.m(A), .out(HEX5));
  Seg7_Decoder dec_b(.m(B), .out(HEX4));

  Seg7_Decoder dec_s0(.m(S[3:0]), .out(HEX0));
  Seg7_Decoder dec_s1(.m(S[7:4]), .out(HEX1));
endmodule