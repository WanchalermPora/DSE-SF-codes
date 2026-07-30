module ripple_counter #(
    parameter int WIDTH = 4
)(
    input  logic             clk,
    input  logic             rst_n,
    output logic [WIDTH-1:0] q
);
    logic [WIDTH-1:0] q_bar;
    logic [WIDTH-1:0] clk_line;

    assign clk_line[0] = clk;
    assign clk_line[WIDTH-1:1] = q_bar[WIDTH-2:0];

    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_stages
            always_ff @(posedge clk_line[i] or negedge rst_n) begin
                if (!rst_n) begin
                    q[i]     <= 1'b0;
                    q_bar[i] <= 1'b1;
                end else begin
                    q[i]     <= ~q[i];
                    q_bar[i] <= ~q_bar[i];
                end
            end
        end
    endgenerate
endmodule