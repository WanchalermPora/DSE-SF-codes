module d_ff (
    input  logic clk,
    input  logic d,
    output logic q,
    output logic q_bar
);

    always_ff @(posedge clk) begin
        q <= d;
    end

    assign q_bar = ~q;

endmodule