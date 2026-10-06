module Lab_4 (
	input  wire MAX10_CLK1_50,
   input  wire [0:0] KEY,
   output wire [6:0] HEX0,
   output wire [6:0] HEX1,
   output wire [6:0] HEX2,
   output wire [6:0] HEX3,
   output wire [6:0] HEX4,
   output wire [6:0] HEX5
);

	wire clr = ~KEY[0];
   wire one_sec;
   reg [2:0]offset;

   LPM_Counter_50MHz Counter_50MHz (
      .clock  (MAX10_CLK1_50),
      .cnt_en (1'b1),
      .sclr (clr),
      .cout (one_sec)
   );

   always @(posedge MAX10_CLK1_50 or posedge clr) begin
      if (clr) begin
         offset <= 3'd0;
      end else if (one_sec) begin
         if (offset == 3'd5) begin
            offset <= 3'd0;
         end else begin
            offset <= offset + 1'b1;
         end
      end
   end

   function [2:0] get_char;
      input [2:0] pos;
      begin
         case (pos % 6)
				3'd0: get_char = 3'd0;
				3'd1: get_char = 3'd1;
				3'd2: get_char = 3'd2;
				3'd3: get_char = 3'd2;
				3'd4: get_char = 3'd3;
				3'd5: get_char = 3'd4;
				default: get_char = 3'd4;
				endcase
      end
   endfunction

   Seg7_Char_Decoder dec5(
		.char_code(get_char(offset + 3'd0)), 
		.out(HEX5)
	);
   Seg7_Char_Decoder dec4(
		.char_code(get_char(offset + 3'd1)), 
		.out(HEX4)
	);
   Seg7_Char_Decoder dec3(
		.char_code(get_char(offset + 3'd2)), 
		.out(HEX3)
	);
   Seg7_Char_Decoder dec2(
		.char_code(get_char(offset + 3'd3)), 
		.out(HEX2)
	);
   Seg7_Char_Decoder dec1(
		.char_code(get_char(offset + 3'd4)),
		.out(HEX1)
	);
   Seg7_Char_Decoder dec0(
		.char_code(get_char(offset + 3'd5)),
		.out(HEX0)
	);

endmodule