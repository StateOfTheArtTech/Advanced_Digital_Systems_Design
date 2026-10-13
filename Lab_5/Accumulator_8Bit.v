module Accumulator_8Bit (
   input [7:0]A,
   input clk,
   input cin,
   output reg [7:0]S,
   output reg overflow
);
   reg [7:0]in;
   wire [8:0]out;

   assign out = {cin, in} + S;

   always @(posedge clk) begin
      S <= out[7:0];
      in <= A;
      overflow <= out[8];
   end

endmodule