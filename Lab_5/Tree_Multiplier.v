module Half_Adder(
   input A,
   input B,
   output S,
   output C
);
   assign S = A ^ B;
   assign C = A & B;
endmodule

module Full_Adder(
   input A,
   input B,
   input Cin,
   output S,
   output Cout
);
   assign S = A ^ B ^ Cin;
   assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module Tree_Multiplier(
   input clk,
   input [4:0] A,
   input [4:0] B,
   output reg [9:0] P
);

   reg [4:0] A_reg, B_reg;
   always @(posedge clk) begin
      A_reg <= A;
      B_reg <= B;
   end

   wire [4:0] p [4:0];
   genvar i, j;
   generate
      for (i = 0; i < 5; i = i + 1) begin : gen_row
         for (j = 0; j < 5; j = j + 1) begin : gen_col
            assign p[i][j] = A_reg[j] & B_reg[i];
         end
      end
   endgenerate

   wire s1_1, c1_1;
   wire s1_2, c1_2;
   wire s1_3a, c1_3a, s1_3, c3_2;
   wire s1_4a, c1_4a, s1_4, c4_2;
   wire s1_5a, c1_5a, s1_5, c5_2;
   wire s1_6, c1_6;
   wire s1_7, c1_7;
   wire s1_8;

   Half_Adder ha1_1 (.A(p[0][1]), .B(p[1][0]), .S(s1_1), .C(c1_1));

   Full_Adder fa1_2 (.A(p[0][2]), .B(p[1][1]), .Cin(p[2][0]), .S(s1_2), .Cout(c1_2));

   Full_Adder fa1_3a (.A(p[0][3]), .B(p[1][2]), .Cin(p[2][1]), .S(s1_3a), .Cout(c1_3a));
   Half_Adder ha1_3b (.A(p[3][0]), .B(s1_3a), .S(s1_3), .C(c3_2));

   Full_Adder fa1_4a (.A(p[0][4]), .B(p[1][3]), .Cin(p[2][2]), .S(s1_4a), .Cout(c1_4a));
   Full_Adder fa1_4b (.A(p[3][1]), .B(p[4][0]), .Cin(s1_4a), .S(s1_4), .Cout(c4_2));

   Full_Adder fa1_5a (.A(p[1][4]), .B(p[2][3]), .Cin(p[3][2]), .S(s1_5a), .Cout(c1_5a));
   Half_Adder ha1_5b (.A(p[4][1]), .B(s1_5a), .S(s1_5), .C(c5_2));

   Full_Adder fa1_6 (.A(p[2][4]), .B(p[3][3]), .Cin(p[4][2]), .S(s1_6), .Cout(c1_6));

   Half_Adder ha1_7 (.A(p[3][4]), .B(p[4][3]), .S(s1_7), .C(c1_7));

   assign s1_8 = p[4][4];

   wire s2_2, c2_2;
   wire s2_3, c2_3;
   wire s2_4, c2_4;
   wire s2_5, c2_5;
   wire t6_1, c6_1, s2_6, c6_2;
   wire t7_1, c7_1, s2_7, c7_2;
   wire s2_8, c2_8;

   Half_Adder ha2_2 (.A(s1_2), .B(c1_1), .S(s2_2), .C(c2_2));

   Half_Adder ha2_3 (.A(s1_3), .B(c1_2), .S(s2_3), .C(c2_3));

   Full_Adder fa2_4 (.A(s1_4), .B(c1_3a), .Cin(c3_2), .S(s2_4), .Cout(c2_4));

   Full_Adder fa2_5 (.A(s1_5), .B(c1_4a), .Cin(c4_2), .S(s2_5), .Cout(c2_5));

   Full_Adder fa2_6a (.A(s1_6), .B(c1_5a), .Cin(c5_2), .S(t6_1), .Cout(c6_1));
   Half_Adder ha2_6b (.A(c1_6), .B(t6_1), .S(s2_6), .C(c6_2));

   Full_Adder fa2_7a (.A(s1_7), .B(c1_7), .Cin(c6_1), .S(t7_1), .Cout(c7_1));
   Half_Adder ha2_7b (.A(c6_2), .B(t7_1), .S(s2_7), .C(c7_2));

   Full_Adder fa2_8 (.A(s1_8), .B(c7_1), .Cin(c7_2), .S(s2_8), .Cout(c2_8));

   reg [9:0] product_next;
   always @(*) begin
      product_next[0] = p[0][0];
      product_next[1] = s1_1;
      product_next[2] = s2_2;
      product_next[3] = s2_3;
      product_next[4] = s2_4;
      product_next[5] = s2_5;
      product_next[6] = s2_6;
      product_next[7] = s2_7;
      product_next[8] = s2_8;
      product_next[9] = c2_8;
   end

   always @(posedge clk) begin
      P <= product_next;
   end

endmodule

