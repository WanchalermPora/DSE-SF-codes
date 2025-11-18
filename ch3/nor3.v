// Verilog Code 3.6: Synthesizable Combinational 3-input NOR
// The output 'Y' MUST be declared as 'reg' because it is
// assigned inside a procedural block (always), even though
// it represents combinational logic.
module nor3 (
    input  A,
    input  B,
    input  C,
    output reg Y // <--- 'reg' is required here
);
    // Procedural block for combinational logic
    always @(*) begin
        Y = ~(A | B | C);
    end
endmodule