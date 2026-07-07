// File: demux_1to8.sv
module demux_1to8 (
    input  logic       D,
    input  logic [2:0] S,
    output logic [7:0] Y
);
    logic d_low, d_high;

    // Direct the data stream based on the most significant select bit S[2]
    assign d_low  = D & ~S[2];
    assign d_high = D & S[2];

    // Instantiate lower module for channels Y[3:0] matching select codes 0xx
    demux_1to4 demux_lower (
        .D(d_low),
        .S(S[1:0]),
        .Y(Y[3:0])
    );

    // Instantiate upper module for channels Y[7:4] matching select codes 1xx
    demux_1to4 demux_upper (
        .D(d_high),
        .S(S[1:0]),
        .Y(Y[7:4])
    );
endmodule