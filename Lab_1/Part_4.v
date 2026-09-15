module Part_4(SW, HEX0);
    input [2:0] SW;
    output reg [6:0] HEX0;

    always @(*) begin
        case (SW)
            3'b000: HEX0 = 7'b0001001;
            3'b001: HEX0 = 7'b0000110;
            3'b010: HEX0 = 7'b1000111;
            3'b011: HEX0 = 7'b1000000;
            default: HEX0 = 7'b1111111;
        endcase
    end
endmodule

	
