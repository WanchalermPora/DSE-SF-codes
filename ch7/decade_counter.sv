module decade_counter #(
    parameter int WIDTH = 4 // Baseline bit-width for BCD encoding
)(
    input  logic             clk,   // Global synchronous clock rail
    input  logic             rst_n, // Active-low asynchronous reset
    output logic [WIDTH-1:0] q      // 4-bit synchronous state output
);
    // Algorithmic decade progression loop with synchronous clearing
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin // Asynchronous reset
            q <= {WIDTH{1'b0}};
        end else begin
            // Explicit conditional boundary acting as a synchronous reset mux
            if (q >= 4'd9) begin
                q <= {WIDTH{1'b0}}; // Sync reset if q>=9 
            end else begin
                q <= q + 1'b1;     // Standard incremental progression step
            end
        end
    end
endmodule