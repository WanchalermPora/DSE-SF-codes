// Verilog Code 3.6: Synthesizable Combinational 3-input NOR
module nor3 (
    input  wire I0,
    input  wire I1,
    input  wire I2,
    output reg O_NOR // <--- 'reg' is required here
);
    // Procedural block for combinational logic
    always @(*) begin
        O_NOR = ~(I0 | I1 | I2);
    end
endmodule
