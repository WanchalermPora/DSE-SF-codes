module jk_ff (
    input  logic clk,
    input  logic j,
    input  logic k,
    output logic q,
    output logic q_bar
);

    always_ff @(posedge clk) begin
        case ({j, k})
            2'b00:   q <= q;       // Memory hold
            2'b01:   q <= 1'b0;    // Reset synchronous
            2'b10:   q <= 1'b1;    // Set synchronous
            2'b11:   q <= ~q;      // Controlled state toggle
            default: q <= q;
        endcase
    end

    assign q_bar = ~q;

endmodule