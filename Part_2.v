module Part_2 (SW, LEDR);
	input [9:0] SW; // toggle switches
	output [9:0] LEDR;
	wire s;
	wire [2:0] x;
	wire [2:0] y;
	wire [2:0] m;
	assign x = SW[2:0];
	assign y = SW[5:3];
	assign s = SW[9];
	assign m[0] = (~s & x[0]) | (s & y[0]);
	assign m[1] = (~s & x[1]) | (s & y[1]);
	assign m[2] = (~s & x[2]) | (s & y[2]);
	assign LEDR[5:0] = SW[5:0];
	assign LEDR[8:6] = m;
	assign LEDR[9] = s;
endmodule