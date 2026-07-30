module gray_counter_smart #(
    parameter int WIDTH = 4
)(
    input  logic             clk,   // Global clock rail
    input  logic             rst_n, // Active-low asynchronous reset
    output logic [WIDTH-1:0] q_gray // Scalable Gray code state vector
);
    logic [WIDTH-1:0] binary_val;
    logic [WIDTH-1:0] binary_next;
    logic [WIDTH-1:0] gray_next;

    // 1. Convert currently registered Gray code back to positional binary
    always_comb begin
        binary_val[WIDTH-1] = q_gray[WIDTH-1];
        for (int i = WIDTH - 2; i >= 0; i = i - 1) begin
            binary_val[i] = binary_val[i+1] ^ q_gray[i];
        end
    end

    // 2. Increment recovered binary value via standard addition
    assign binary_next = binary_val + 1'b1;

    // 3. Convert next binary state vector back into an optimized Gray token
    assign gray_next = binary_next ^ (binary_next >> 1);

    // Sequential register allocation stage
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q_gray <= {WIDTH{1'b0}};
        end else begin
            q_gray <= gray_next;
        end
    end
endmodule