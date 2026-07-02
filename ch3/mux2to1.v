// Verilog Code 3.6: Synthesizable Combinational Mux
// The output 'O' MUST be declared as 'reg'
// because it is assigned inside a procedural block,
// but it will be synthesized as a wire.
//
module mux_2to1 (
    input  logic I0,
    input  logic I1,
    input  logic SEL,
    output reg  O  // <-- 'reg' is required here
);
    always @(*) begin
        if (SEL == 1'b0) begin
            O = I0; // select I0 when SEL is 0
        end
        else begin
            O = I1; // select I1 otherwise
        end
    end
endmodule
