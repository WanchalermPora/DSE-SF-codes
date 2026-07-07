module d_latch_behavioral (
    input  logic E,
    input  logic D,
    output logic Q,
    output logic Q_bar
);

    always_comb begin
        if (E == 1'b1) begin
            Q     = D;
            Q_bar = ~D;
        end
        // Omission of else path informs synthesis engine to preserve previous states when E is low
    end

endmodule