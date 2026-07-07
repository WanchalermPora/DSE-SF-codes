module decoder_3to8 (
    input  logic       E,
    input  logic [2:0] A,
    output logic [7:0] Y
);
    logic E_lower, E_upper;

    assign E_lower = E & ~A[2];
    assign E_upper = E &  A[2];

    decoder_2to4 lower_half (
        .E(E_lower), .A(A[1:0]), .Y(Y[3:0])
    );
    
    decoder_2to4 upper_half (
        .E(E_upper), .A(A[1:0]), .Y(Y[7:4])
    );
endmodule
