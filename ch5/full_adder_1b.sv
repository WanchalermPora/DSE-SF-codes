// File: full_adder_1b.sv
module full_adder_1b (
    input  logic A,
    input  logic B,
    input  logic C_in,
    output logic S,
    output logic C_out
);
    // Concurrent dataflow optimization mapping single-bit arithmetic equations
    assign S     = A ^ B ^ C_in;
    assign C_out = (A & B) | (C_in & (A ^ B));
endmodule