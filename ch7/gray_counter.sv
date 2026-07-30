module gray_counter (
    input  logic       clk,   // Clock
    input  logic       rst_n, // Reset
    output logic [2:0] q      // State vector
);
    logic [2:0] q_next;

    // Next-state decoding matrix
    always_comb begin
        case (q)
            3'b000:  q_next = 3'b001;
            3'b001:  q_next = 3'b011;
            3'b011:  q_next = 3'b010;
            3'b010:  q_next = 3'b110;
            3'b110:  q_next = 3'b111;
            3'b111:  q_next = 3'b101;
            3'b101:  q_next = 3'b100;
            3'b100:  q_next = 3'b000;
            default: q_next = 3'b000;
        endcase
    end

    // Sequential state registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) q <= 3'b000;
        else        q <= q_next;
    end
endmodule