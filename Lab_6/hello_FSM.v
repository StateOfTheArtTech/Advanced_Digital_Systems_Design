module hello_FSM (
   input clk,
   input Resetn,
   input enable,
   input [7:0] in,
   output reg out
);
   reg [2:0] y, Y;
   parameter A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4;

   always @(in, y) begin
      case (y)
         A: begin
            out = 1'b0;
            if (in == 8'd104)
               Y = B;
            else
               Y = A;
         end
         B: begin
            out = 1'b0;
            if (in == 8'd101)
               Y = C;
            else if (in == 8'd104)
               Y = B;
            else
               Y = A;
         end
         C: begin
            out = 1'b0;
            if (in == 8'd108)
               Y = D;
            else
               Y = A;
         end
         D: begin
            out = 1'b0;
            if (in == 8'd108)
               Y = E;
            else
               Y = A;
         end
         E: begin
            if (in == 8'd111) begin
               out = 1'b1;
               Y = A;
            end
            else begin
               out = 1'b0;
               Y = A;
            end
         end
      endcase
   end

   always @(posedge clk, negedge Resetn) begin
      if (Resetn == 0)
         y <= A;
      else if (enable)
         y <= Y;
   end
endmodule