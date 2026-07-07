// File: pri_enc_4to2.sv
module pri_enc_4to2 (
    input  logic       E,
    input  logic [3:0] D,
    output logic       V,
    output logic [1:0] Y
);
    always_comb begin
        Y = 2'b00;
        V = 1'b0;
        
        if (E) begin
            if (D[3])      begin Y = 2'b11; V = 1'b1; end
            else if (D[2]) begin Y = 2'b10; V = 1'b1; end
            else if (D[1]) begin Y = 2'b01; V = 1'b1; end
            else if (D[0]) begin Y = 2'b00; V = 1'b1; end
            else           begin V = 1'b0;  end
        end
    end
endmodule