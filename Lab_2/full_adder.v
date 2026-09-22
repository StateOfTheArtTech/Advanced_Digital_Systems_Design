module full_adder(
	input a, b, c_i,
	output s, c_o
);
	wire x;
	
	xor (x, a, b);
	xor (s, x, c_i);
	mux_2_1 mux2 (
        .s(x),
        .x(b),    
        .y(c_i),   
        .m(c_o)
    );
	
endmodule