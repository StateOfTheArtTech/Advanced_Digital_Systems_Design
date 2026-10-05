module T_FlipFlop(
	input T,
	input Clk,
	input Clear,
	output Qt
);
	wire d;
	reg q;
	always @ (posedge Clk) begin
		if(Clear)
			q <= 0;
		else
			q <= d;
	end
	
	assign d = (q & ~T) | (T & ~q);
	assign Qt = q;
	
endmodule