module second_counter (
	input  wire clk,
   input  wire clr,
   output reg  [3:0] Q
);

   wire one_sec;

   LPM_Counter_50MHz Counter_50MHz (
      .clock  (clk),
      .cnt_en (1'b1),
      .sclr   (clr),
      .cout   (one_sec)
   );

   always @(posedge clk or posedge clr) begin
      if (clr) begin
         Q <= 4'd0;
      end else if (one_sec) begin
         if (Q == 4'd9) begin
            Q <= 4'd0;
         end else begin
            Q <= Q + 1'b1;
         end
      end
   end

endmodule