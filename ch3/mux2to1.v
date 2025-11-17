// Verilog Code 3.5: Synthesizable Combinational Mux
// The output 'O' MUST be declared as 'reg'
// because it is assigned inside a procedural block,
// but it will be synthesized as a wire.
//
module mux_2to1 (
    input  logic A,
    input  logic B,
    input  logic SEL,
    output reg  O  // <-- 'reg' is required here
);
    always @(*) begin
        if (SEL == 1'b0) begin
            O = A;
        end
        else begin
            O = B;
        end
    end
endmodule