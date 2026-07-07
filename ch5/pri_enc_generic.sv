// File: pri_enc_generic.sv
module pri_enc_generic #(
    parameter int N = 3 // Number of encoded output bits (defaults to 8-to-3)
)(
    input  logic                 E,
    input  logic [(2**N)-1:0]    D,
    output logic                 V,
    output logic [N-1:0]         Y
);
    always_comb begin
        Y = '0;
        V = 1'b0;
        
        if (E) begin
            // Loops from highest priority index down to zero
            // The first active bit encountered overrides lower indices
            for (int i = (2**N)-1; i >= 0; i--) begin
                if (D[i]) begin
                    Y = N'(i);
                    V = 1'b1;
                    break; // Terminate loop evaluation immediately upon priority match
                end
            end
        end
    end
endmodule