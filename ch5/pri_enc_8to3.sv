// File: pri_enc_8to3.sv
module pri_enc_8to3 (
    input  logic       E,
    input  logic [7:0] D,
    output logic       V,
    output logic [2:0] Y
);
    logic v_high, v_low;
    logic [1:0] y_high, y_low;

    // Instantiate higher-priority encoder for upper nibble (D[7:4])
    pri_enc_4to2 enc_high (
        .E(E),
        .D(D[7:4]),
        .V(v_high),
        .Y(y_high)
    );

    // Instantiate lower-priority encoder for lower nibble (D[3:0])
    // Enabled only if global E is high and upper block is inactive
    pri_enc_4to2 enc_low (
        .E(E & ~v_high),
        .D(D[3:0]),
        .V(v_low),
        .Y(y_low)
    );

    // Global structural output composition
    assign Y[2] = v_high;
    assign Y[1] = y_high[1] | y_low[1];
    assign Y[0] = y_high[0] | y_low[0];
    assign V    = v_high | v_low;

endmodule