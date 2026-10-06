module Seg7_Char_Decoder (
   input  wire [2:0] char_code,
   output reg  [6:0] out
);

   always @(*) begin
      case (char_code)
         3'd0: out = 7'b000_1001;
         3'd1: out = 7'b000_0110;
         3'd2: out = 7'b100_0111;
         3'd3: out = 7'b100_0000;
         3'd4: out = 7'b111_1111;
         default: out = 7'b111_1111;
      endcase
   end

endmodule