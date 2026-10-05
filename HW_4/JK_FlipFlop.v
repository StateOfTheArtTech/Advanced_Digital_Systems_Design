module JK_FlipFlop(
    input clk,
    input clr,
    input J,
    input K,
    output reg Q
);
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            Q <= 1'b0;
        end else begin
            if (J & K) 
                Q <= ~Q;
            if (J & ~K)
                Q <= 1'b1;
            if (~J & K)
                Q <= 1'b0;
            if (~J & ~K)
                Q <= Q;
        end
    end

endmodule