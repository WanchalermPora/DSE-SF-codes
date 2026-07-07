// File: adder_4b.sv
module adder_4b (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic       C_0,
    output logic [3:0] S,
    output logic       C_4
);
    logic [3:1] C; // Internal intermediate carry routing wires

    // Structural cascade instantiation of four independent full-adder modules
    full_adder_1b fa0 (.A(A[0]), .B(B[0]), .C_in(C_0),  .S(S[0]), .C_out(C[1]));
    full_adder_1b fa1 (.A(A[1]), .B(B[1]), .C_in(C[1]), .S(S[1]), .C_out(C[2]));
    full_adder_1b fa2 (.A(A[2]), .B(B[2]), .C_in(C[2]), .S(S[2]), .C_out(C[3]));
    full_adder_1b fa3 (.A(A[3]), .B(B[3]), .C_in(C[3]), .S(S[3]), .C_out(C_4));
endmodule