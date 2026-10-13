module Add_Sub_Accumulator (
   input [7:0]A,
   input clk,
   input sub,
   output reg [7:0]S,
   output reg overflow
);
   reg [7:0]in;
   wire [8:0]out;
   wire [7:0]modified_A;

   assign modified_A = A ^ {8{sub}};
   assign out = {sub, in} + S;

   always @(posedge clk) begin
      S <= out[7:0];
      in <= modified_A;
      overflow <= out[8];
   end

endmodule