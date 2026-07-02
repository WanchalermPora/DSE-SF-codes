module ex1_z_gold (
    input  logic A,
    input  logic B,
    input  logic C,
    output logic Z
);
    // Step 3 equation: Z = (AB + C) xor C
    assign Z = ((A & B) | C) ^ C;
endmodule

module ex1_z_dut (
    input  logic A,
    input  logic B,
    input  logic C,
    output logic Z
);
    // Step 4 optimised equation: Z = AB~C
    assign Z = (A & B) & (~C);
endmodule
