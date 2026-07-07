// File: fpu_block.sv
module fpu_block (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        mode, // 0 for Add, 1 for Multiply
    input  logic [31:0] A,    // Raw 32-bit bit packet representing an IEEE 754 float
    input  logic [31:0] B,
    output logic [31:0] Result
);
    // For hardware synthesis targets, EDA tools map native floating-point operators 
    // to proprietary IP cores (such as Synopsys DesignWare blocks) automatically.
    shortreal real_A, real_B, real_Res;

    // Convert untyped bit streams to synthesizable real representations internally
    assign real_A = $bitstoreal(A);
    assign real_B = $bitstoreal(B);

    always_comb begin
        if (mode)
            real_Res = real_A * real_B;
        else
            real_Res = real_A + real_B;
    end

    // Convert the calculated floating-point value back to an untyped vector
    assign Result = $realtobits(real_Res);
endmodule