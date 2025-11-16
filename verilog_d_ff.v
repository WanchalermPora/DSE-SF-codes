// Verilog Code 3.X: Synthesizable D-Flip-Flop
//
// This uses a sequential 'always' block.
// The sensitivity list @(posedge clk) tells the
// synthesizer to only run this block on the
// rising edge of the clock.
//
// This infers a register (a flip-flop).
//
module d_ff (
    input  logic clk,
    input  logic reset,
    input  logic D,
    output reg  Q    // <-- 'reg' is required here
);

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            Q <= 1'b0;
        end
        else begin
            Q <= D;
        end
    end

endmodule