
`default_nettype none

module Lab_6(
	// Board I/Os
	input		MAX10_CLK1_50,
	input 	[9:0]		SW,
	input		[0:0]		KEY0,
	output	[9:0]		LEDR,
	inout		[35:0]	GPIO,
	output 	[7:0]		HEX0,
	output 	[7:0]		HEX1,
	output 	[7:0]		HEX2,
	output 	[7:0]		HEX3,
	output 	[7:0]		HEX4,
	output 	[7:0]		HEX5
	//inout		[15:0]	ARDUINO_IO
);

	
	wire w_clk = MAX10_CLK1_50;
	wire blink;

	
	wire RxD_data_ready;
	wire [7:0] RxD_data;
	reg [7:0] GPout;

	async_receiver RX(
		.clk(w_clk), 
		.RxD(GPIO[35]), 
		.RxD_data_ready(RxD_data_ready), 
		.RxD_data(RxD_data)
	);
	
	always @(posedge w_clk) 
		if(RxD_data_ready) 
			GPout <= RxD_data;

	async_transmitter TX(
		.clk(w_clk), 
		.TxD(GPIO[33]), 
		.TxD_start(RxD_data_ready), 
		.TxD_data(RxD_data)
	);
	
	assign LEDR[7:0] = GPout;
	
	char2seg Display(
		.char(GPout),
		.HEX0(HEX0)
	);
	
	hello_FSM h_fsm(
		.clk(w_clk),
		.Resetn(KEY0),
		.enable(RxD_data_ready),
		.in(RxD_data),
		.out(blink)
	);
	
	hello_blinker h_blinker(
		.ena(blink),
		.clk(w_clk),
		.HEX({HEX5,HEX4,HEX3,HEX2,HEX1})
	);
	
endmodule

`default_nettype wire
