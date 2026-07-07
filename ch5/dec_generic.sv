// File: dec_generic.sv
module dec_generic #(
    parameter int N = 3 // Number of input address lines (defaults to 3-to-8)
)(
    input  logic                 E,
    input  logic [N-1:0]         W,
    output logic [(2**N)-1:0]    Y
);
    // Directly shift a single active bit to the left based on input index value W
    // If E is low, the conditional operator forces the entire vector to zero
    assign Y = E ? (((2**N)'(1)) << W) : '0;
endmodule