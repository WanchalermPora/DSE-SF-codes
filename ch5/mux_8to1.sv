// File: mux_8to1.sv
module mux_8to1 (
    input  logic       E,
    input  logic [7:0] D,
    input  logic [2:0] S,
    output logic       Y
);
    logic y_high, y_low;

    // Instantiate lower 4-to-1 mux for data channels D[3:0]
    mux_4to1 mux_lower (
        .E(E),
        .D(D[3:0]),
        .S(S[1:0]),
        .Y(y_low)
    );

    // Instantiate upper 4-to-1 mux for data channels D[7:4]
    mux_4to1 mux_upper (
        .E(E),
        .D(D[7:4]),
        .S(S[1:0]),
        .Y(y_high)
    );

    // Final structural 2-to-1 routing stage using select MSB (S[2])
    assign Y = S[2] ? y_high : y_low;
endmodule