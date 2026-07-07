module sr_latch_active_high (
    input  logic S,
    input  logic R,
    output logic Q,
    output logic Q_bar
);

    always_comb begin
        if (S == 1'b1 && R == 1'b0) begin
            Q     = 1'b1;
            Q_bar = 1'b0;
        end else if (S == 1'b0 && R == 1'b1) begin
            Q     = 1'b0;
            Q_bar = 1'b1;
        end else if (S == 1'b1 && R == 1'b1) begin
            Q     = 1'b0; // Forbidden structural combination (NOR-latch baseline)
            Q_bar = 1'b0;
        end
        // Implicit else: retain previous values (latched memory state inferred)
    end

endmodule