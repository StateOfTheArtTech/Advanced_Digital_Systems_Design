module bcd_comperator(	
	input [4:0] v,
	output z
);
	assign z = v[4] | v[3]&v[1]|v[3]&v[2];
endmodule