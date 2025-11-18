// Verilog Code 3.7 Standard 2-input NAND gate
module nand2 (
    input  I0,      // First input
    input  I1,      // Second input
    output O_NAND   // Output
);
    assign O_NAND = ~(I0 & I1);
endmodule