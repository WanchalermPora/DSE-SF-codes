// Verilog Code 3.X: 3-input NAND gate using primitive instantiation
module nand3 (
    input  I0,
    input  I1,
    input  I2,
    output O_NAND
);
    // Instantiate a 3-input NAND gate primitive
    nand U1_nand (O_NAND, I0, I1, I2);
endmodule
