module HW_2(
	input b2,b1,b0,
	output s1,s0
);
	exc_321(.b2(b2),.b1(b1),.b0(b0),.s1(s1), .s0(s0));
endmodule

module exc_261 (
	input  x3, x2, x1,
	output f
);

	wire not_x1, not_x2, not_x3;
	wire t1, t2, t3, t4;

	not (not_x1, x1);
	not (not_x2, x2);
	not (not_x3, x3);

	or (t1,     x1,     x2,     x3);
	or (t2, not_x1, not_x2,     x3);
	or (t3, not_x1,     x2, not_x3);
	or (t4,     x1, not_x2, not_x3);

	and (f, t1, t2, t3, t4);

endmodule

module exc_262 (
	input x1,x2,x3,
	output f
); 
	wire not_x1, not_x2, not_x3;
	wire t1, t2;
	not (not_x1, x1);
	not (not_x2, x2);
	not (not_x3, x3);
	
	or (t1,x1,x2,x3);
	or (t2,not_x1,not_x2,not_x3);
	and (f, t1,t2);

endmodule

module exc_263 (
	input x1,x2,x3,
	output f
); 
	
	assign f = (~x1+~x2+~x3)&(x1+~x2+x3); 

endmodule

module exc_321 (
  input b2, b1, b0,
  output s1, s0
);

  wire t1, t2, t3;

  xor (s0, b2, b1, b0);

  and (t1, b2, b1);
  and (t2, b2, b0);
  and (t3, b1, b0);
  
  or  (s1, t1, t2, t3);

endmodule
