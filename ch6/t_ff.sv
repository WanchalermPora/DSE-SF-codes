module t_ff (
    input  logic clk,
    input  logic t,
    output logic q,
    output logic q_bar
);

    always_ff @(posedge clk) begin
        if (t == 1'b1) begin
            q <= ~q;
        end
        // Implicit else: preserve previous value (memory hold inferred)
    end

    assign q_bar = ~q;

endmodule