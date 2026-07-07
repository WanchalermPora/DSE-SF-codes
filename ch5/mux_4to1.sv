// File: mux_4to1.sv
module mux_4to1 (
    input  logic       E,
    input  logic [3:0] D,
    input  logic [1:0] S,
    output logic       Y
);
    always_comb begin
        Y = 1'b0;
        if (E) begin
            case (S)
                2'b00:   Y = D[0];
                2'b01:   Y = D[1];
                2'b10:   Y = D[2];
                2'b11:   Y = D[3];
                default: Y = 1'b0;
            endcase
        end
    end
endmodule