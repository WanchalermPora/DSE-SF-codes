module sync_up_counter #(
    parameter int WIDTH = 4
)(
    input  logic             clk,   // Global clock rail
    input  logic             rst_n, // Active-low async reset
    output logic [WIDTH-1:0] q      // Synchronous state vector
);
    // Algorithmic register addition loop
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= {WIDTH{1'b0}};
        end else begin
            q <= q + 1'b1; // Synchronous addition execution path
        end
    end
endmodule