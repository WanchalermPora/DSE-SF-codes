module johnson_counter_ft #(
    parameter int WIDTH = 4 // Scalable width parameter
)(
    input  logic             clk,   // Global synchronous clock rail
    input  logic             rst_n, // Active-low asynchronous reset
    output logic [WIDTH-1:0] q      // Parameterised fault-tolerant output
);
    logic [WIDTH-1:0] q_next;

    // Inductive self-correcting decoding path for arbitrary widths
    always_comb begin
        logic intermediate_zeroes;
        
        q_next[WIDTH-1:1] = q[WIDTH-2:0];
        
        // Evaluate if all bits between stage 1 and n-2 are entirely zero
        intermediate_zeroes = 1'b1;
        for (int i = 1; i <= WIDTH-2; i++) begin
            if (q[i] != 1'b0) begin
                intermediate_zeroes = 1'b0;
            end
        end
        
        // D_0 = Q_n-1' + (Q_n-2' ... Q_1' * Q_0)
        q_next[0] = !q[WIDTH-1] || (intermediate_zeroes && q[0]);
    end

    // Sequential register allocation clearing to all-zeros baseline
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= {WIDTH{1'b0}}; // Safe deterministic power-on vector
        end else begin
            q <= q_next;
        end
    end
endmodule