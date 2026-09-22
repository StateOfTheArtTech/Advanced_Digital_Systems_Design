module mux_4bit_2_1(
    input        s,
    input  [3:0] x,
    input  [3:0] y,
    output [3:0] m
);
    mux_2_1 mux0(.s(s), .x(x[0]), .y(y[0]), .m(m[0]));
    mux_2_1 mux1(.s(s), .x(x[1]), .y(y[1]), .m(m[1]));
    mux_2_1 mux2(.s(s), .x(x[2]), .y(y[2]), .m(m[2]));
    mux_2_1 mux3(.s(s), .x(x[3]), .y(y[3]), .m(m[3]));
endmodule