module lfsr_n (R, L, Clock, Q);
    input [0:2] R;
    input L, Clock;
    output [0:2] Q;
    reg [0:2] Q;

    always @(posedge Clock)
        if (L)
            Q <= R;
        else
        begin
            Q[0] = Q[2];
            Q[1] = Q[0] ^ Q[2];
            Q[2] = Q[1];
        end

endmodule