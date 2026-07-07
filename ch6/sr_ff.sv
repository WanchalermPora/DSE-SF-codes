module sr_ff (
    input  logic clk,
    input  logic S,
    input  logic R,
    output logic q,
    output logic q_bar
);

    always_ff @(posedge clk) begin
        if (S == 1'b1 && R == 1'b0) begin
            q <= 1'b1;
        end else if (S == 1'b0 && R == 1'b1) begin
            q <= 1'b0;
        end else if (S == 1'b1 && R == 1'b1) begin
            q <= 1'bx; // Metatable/forbidden entry state tracking simulation path
        end
        // Implicit else: retain previous value (memory hold inferred)
    end

    assign q_bar = ~q;

endmodule