module T_FlipFlop_8Bits(
	input T0,
	input Clk,
	input Clear,
	output [7:0] Qt
);
	wire T1, T2, T3, T4, T5, T6, T7;
	
	T_FlipFlop TFF0(	
		.T(T0),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[0])
	);
	
	and and0 (T1, Qt[0], T0);
	
	T_FlipFlop TFF1(	
		.T(T1),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[1])
	);
	
	and and1 (T2, Qt[1], T1);
	
	T_FlipFlop TFF2(	
		.T(T2),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[2])
	);
	
	and and2 (T3, Qt[2], T2);
	
	T_FlipFlop TFF3(	
		.T(T3),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[3])
	);
	
	and and3 (T4, Qt[3], T3);
	
	T_FlipFlop TFF4(	
		.T(T4),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[4])
	);
	
	and and4 (T5, Qt[4], T4);
	
	T_FlipFlop TFF5(	
		.T(T5),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[5])
	);
	
	and and5 (T6, Qt[5], T5);
	
	T_FlipFlop TFF6(	
		.T(T6),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[6])
	);
	
	and and6 (T7, Qt[6], T6);
	
	T_FlipFlop TFF7(	
		.T(T7),
		.Clk(Clk),
		.Clear(Clear),
		.Qt(Qt[7])
	);

	
endmodule