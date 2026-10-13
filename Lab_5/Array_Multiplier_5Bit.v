module Array_Multiplier_5Bit(
   input [4:0]A,
   input [4:0]B,
   input clk,
   output reg [9:0]P
);
   reg [4:0]reg_A;
   reg [4:0]reg_B;
   wire [4:0]p [4:0];
   wire [9:0]mult_p;

   assign p[0] = reg_A & {5{reg_B[0]}};
   assign p[1] = reg_A & {5{reg_B[1]}};
   assign p[2] = reg_A & {5{reg_B[2]}};
   assign p[3] = reg_A & {5{reg_B[3]}};
   assign p[4] = reg_A & {5{reg_B[4]}};

   assign mult_p = p[0] + (p[1] << 1) + (p[2] << 2) + (p[3] << 3) + (p[4] << 4);

	always @(posedge clk) begin
		reg_A <= A;
		reg_B <= B;
		P <= mult_p;
end
endmodule