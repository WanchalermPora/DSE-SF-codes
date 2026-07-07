// File: mux_generic.sv
module mux_generic #(
    parameter int M = 3 // Number of selection bits (defaults to an 8-to-1 layout)
)(
    input  logic                 E,
    input  logic [(2**M)-1:0]    D,
    input  logic [M-1:0]         S,
    output logic                 Y
);
    // Continuous index assignment mapping directly into the data array
    assign Y = E ? D[S] : 1'b0;
endmodule