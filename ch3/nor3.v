// Verilog Code 3.6: Synthesizable Combinational 3-input NOR
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