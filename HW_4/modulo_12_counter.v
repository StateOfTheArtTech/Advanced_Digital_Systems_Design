module modulo_12_counter (
    input clk,
    input reset,
    input ena,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0000;
        end else if (ena) begin
            if (q == 4'b1011)
                q <= 4'b0000;
            else
                q <= q + 4'b0001;
        end
    end

endmodule