module p420(
	input [3:0]w,
	output reg [1:0]f
);
	always @(w) begin
		case (w)
			4'b0001: f = 2'b00;
			4'b0010: f = 2'b01;
			4'b0100: f = 2'b10;
			4'b1000: f = 2'b11;
			default: f = 2'b00;
		endcase
	end
endmodule