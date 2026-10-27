module hello_blinker (
   input ena,
   input clk,
   output reg [39:0] HEX
);
   wire tick;
   reg blinking = 0;
   reg blink_state = 0;
   reg [18:0] total_tick_count = 0;
   reg [15:0] half_sec_count = 0;

   BaudTickGen tick_gen (
      .clk(clk),
      .enable(blinking),
      .tick(tick)
   );

   always @(posedge clk) begin
      if (ena && !blinking) begin
         blinking <= 1'b1;
         total_tick_count <= 19'd0;
         half_sec_count <= 16'd0;
         blink_state <= 1'b1;
      end else if (blinking) begin
         if (tick) begin
            total_tick_count <= total_tick_count + 1;
            half_sec_count <= half_sec_count + 1;

            if (half_sec_count >= 16'd57599) begin
               half_sec_count <= 16'd0;
               blink_state <= ~blink_state;
            end

            if (total_tick_count >= 19'd345599) begin
               blinking <= 1'b0;
               blink_state <= 1'b0;
            end
         end
      end
   end

   always @(*) begin
      if (blink_state)
         HEX = {8'b10001001, 8'b10000110, 8'b11000111, 8'b11000111, 8'b10100011};
      else
         HEX = {8'b11111111, 8'b11111111, 8'b11111111, 8'b11111111, 8'b11111111};
   end
endmodule