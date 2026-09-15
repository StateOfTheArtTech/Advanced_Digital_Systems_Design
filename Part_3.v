module mux_2_1(s, x, y, m);
    input s;
    input x;
    input y;
    output m;
    
    assign m = (~s & x) | (s & y);
endmodule

module mux_5_1(u, v, w, x, y, s, m);
	input u;
	input v;
	input w;
	input x;
	input y;
	input [2:0]s;
	output m;
	wire m0;
	wire m1;
	wire m2;
	wire m3;
	
	mux_2_1 mux0(
		.s(s[0]),
		.x(u),
		.y(v),
		.m(m0)
	);
	mux_2_1 mux1(
		.s(s[0]),
		.x(w),
		.y(x),
		.m(m1)
	);
	
	mux_2_1 mux2(
		.s(s[1]),
		.x(m0),
		.y(m1),
		.m(m2)
	);
	
	mux_2_1 mux3(
		.s(s[2]),
		.x(m2),
		.y(y),
		.m(m3)
	);
	
	assign m = m3;

endmodule

module Part_3(SW, LEDR);
	input [9:0]SW;
	output [9:0]LEDR;
	
	mux_5_1 mux5(
	.u(SW[0]), 
	.v(SW[1]), 
	.w(SW[2]), 
	.x(SW[3]), 
	.y(SW[4]), 
	.s(SW[7:5]), 
	.m(LEDR[9])
	);
	
	assign LEDR[7:0] = SW[7:0];
	
endmodule