module Array_Multiplier_4Bit (
   input [3:0] A,
   input [3:0] B,
   output [7:0] P
);
   wire [3:0] p[3:0];
   
   assign p[0] = A & {4{B[0]}};
   assign p[1] = A & {4{B[1]}};
   assign p[2] = A & {4{B[2]}};
   assign p[3] = A & {4{B[3]}};

   assign P = p[0] + (p[1] << 1) + (p[2] << 2) + (p[3] << 3);
endmodule


