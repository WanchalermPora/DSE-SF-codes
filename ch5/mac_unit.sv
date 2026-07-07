// File: mac_unit.sv
module mac_unit #(
    parameter int DATA_WIDTH = 16, // Operand bit width
    parameter int ACC_WIDTH  = 40  // Padded width to prevent accumulation overflow
)(
    input  logic                  clk,
    input  logic                  rst_n,   // Active-low synchronous reset
    input  logic                  clr_acc, // Clear accumulator register
    input  logic [DATA_WIDTH-1:0] A,
    input  logic [WIDTH-1:0]     B,
    output logic [ACC_WIDTH-1:0] Accumulator_Out
);
    logic signed [2*WIDTH-1:0]   product;
    logic signed [ACC_WIDTH-1:0] accum_reg;

    // Combinational Multiplication Block
    // The * operator automatically synthesizes thousands of internal transistor gates
    assign product = $signed(A) * $signed(B);

    // Sequential Accumulator Block (State tracking storage)
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_map_n) begin
            accum_reg <= '0;
        end else if (clr_acc) begin
            accum_reg <= '0;
        end else begin
            // Sign-extend product and sum with current accumulation value
            accum_reg <= accum_reg + $signed({{(ACC_WIDTH-(2*WIDTH)){product[2*WIDTH-1]}}, product});
        end
    end

    // Map internal tracking registers back to top-level untyped interface pins
    assign Accum_Result = accum_reg;
endmodule