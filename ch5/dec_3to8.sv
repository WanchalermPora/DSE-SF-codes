// File: dec_3to8.sv
module dec_3to8 (
    input  logic       E,
    input  logic [2:0] W,
    output logic [7:0] Y
);
    logic e_high, e_low;

    // Generate cascading enable lines using the MSB (W[2])
    assign e_low  = E & ~W[2];
    assign e_high = E & W[2];

    // Instantiate lower module for outputs Y[3:0] matching W[2]=0
    dec_2to4 dec_lower (
        .E(e_low),
        .W(W[1:0]),
        .Y(Y[3:0])
    );

    // Instantiate upper module for outputs Y[7:4] matching W[2]=1
    dec_2to4 dec_upper (
        .E(e_high),
        .W(W[1:0]),
        .Y(Y[7:4])
    );
endmodule