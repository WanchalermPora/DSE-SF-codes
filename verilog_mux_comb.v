// Verilog Code 3.X: Synthesizable Combinational Mux
//
// This uses a combinational 'always' block.
// The sensitivity list @(*) tells the synthesizer
// to re-evaluate if ANY signal on the right-hand
// side changes (A, B, or SEL).
//
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