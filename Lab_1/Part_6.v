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

module mux_3bit_5to1(
    input [2:0] s,
    input [2:0] u,
    input [2:0] v,
    input [2:0] w,
    input [2:0] x,
    input [2:0] y,
    output [2:0] m
);
    mux_5_1 mux2 (
		 .u(u[2]), 
		 .v(v[2]), 
		 .w(w[2]), 
		 .x(x[2]), 
		 .y(y[2]), 
		 .s(s), 
		 .m(m[2])
	 );
	 
	mux_5_1 mux1 (
		.u(u[1]), 
		.v(v[1]), 
		.w(w[1]), 
		.x(x[1]), 
		.y(y[1]), 
		.s(s), 
		.m(m[1])
	);
	
   mux_5_1 mux0 (
		.u(u[0]), 
		.v(v[0]), 
		.w(w[0]), 
		.x(x[0]), 
		.y(y[0]), 
		.s(s), 
		.m(m[0])
	);
	
endmodule


module dec_7seg(in, out);
   input [2:0] in;
   output reg [6:0] out;

	always @(*) begin
		case (in)
			3'b000: out = 7'b0001001;
			3'b001: out = 7'b0000110;
			3'b010: out = 7'b1000111;
			3'b011: out = 7'b1000000;
			default: out = 7'b1111111;
		endcase
	end
endmodule
	
module Part_6(
	input [9:0] SW,
	output [9:0] LEDR,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4
);
	wire [2:0] H;
	wire [2:0] E;
	wire [2:0] L;
	wire [2:0] O;

	assign H = SW[2:0];
	assign E = SW[5:3];
	assign L = SW[2:0];
	assign O = SW[5:3];

	wire [2:0] mux4;
	wire [2:0] mux3;
	wire [2:0] mux2;
	wire [2:0] mux1;
	wire [2:0] mux0;

	mux_3bit_5to1 MUX4 (
		SW[9:7],
		H,
		E,
		L,
		L,
		O,
		mux4
	);

	mux_3bit_5to1 MUX3 (
		SW[9:7],
		E,
		L,
		L,
		O,
		H,
		mux3
	);

	mux_3bit_5to1 MUX2 (
		SW[9:7],
		L,
		L,
		O,
		H,
		E,
		mux2
	);

	mux_3bit_5to1 MUX1 (
		SW[9:7],
		L,
		O,
		H,
		E,
		L,
		mux1
	);

	mux_3bit_5to1 MUX0 (
		SW[9:7],
		O,
		H,
		E,
		L,
		L,
		mux0
	);

	dec_7seg D4 (mux4, HEX4);
	dec_7seg D3 (mux3, HEX3);
	dec_7seg D2 (mux2, HEX2);
	dec_7seg D1 (mux1, HEX1);
	dec_7seg D0 (mux0, HEX0);

	assign LEDR = SW;

endmodule
