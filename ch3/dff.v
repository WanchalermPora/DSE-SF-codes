// Verilog Code 3.6: Synthesizable D-Flip-Flop
// This infers a register (a flip-flop).
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