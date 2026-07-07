// File: add_sub_param.sv
module add_sub_param #(
    parameter int WIDTH = 8 // Reusable word sizing bit parameter
)(
    input  logic                 Add_Sub, // Mode selector: 0 for Add, 1 for Sub
    input  logic [WIDTH-1:0]     A,
    input  logic [WIDTH-1:0]     B,
    output logic [WIDTH-1:0]     Result,
    output logic                 Carry_Out
);
    // Algorithmic behavioural architecture handles sign conversions automatically
    always_comb begin
        if (Add_Sub)
            {Carry_Out, Result} = A - B;
        else
            {Carry_Out, Result} = A + B;
    end
endmodule