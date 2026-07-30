module ring_counter_para #(
    parameter int WIDTH = 4
)(
    input  logic             clk,   // Global clock rail
    input  logic             rst_n, // Active-low asynchronous reset
    output logic [WIDTH-1:0] q      // Self-correcting state output
);
    logic [WIDTH-1:0] q_next;

    // Fault-tolerant feedback path excluding the final stage bit
    always_comb begin
        q_next[WIDTH-1:1] = q[WIDTH-2:0];
        q_next[0]         = ~|q[WIDTH-2:0]; // D_0 = NOR(Q_n-2, ..., Q_0)
    end

    // Sequential register mapping with explicit isolated token initialization
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Force safe power-on baseline: [0, 0, ..., 1]
            q <= {{WIDTH-1{1'b0}}, 1'b1};
        end else begin
            q <= q_next;
        end
    end
endmodule