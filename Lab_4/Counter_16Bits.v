module Counter_16Bits(
	input En,
	input Clk,
	input Clear,
	output reg [15:0] Q
);
	always @ (posedge Clk ) begin
		if(Clear)
			Q <= 0;
		else
			if(En)
				Q <= Q + 1;
	end
endmodule