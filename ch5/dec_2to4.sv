// File: dec_2to4.sv
module dec_2to4 (
    input  logic       E,
    input  logic [1:0] W,
    output logic [3:0] Y
);
    always_comb begin
        Y = 4'b0000;
        if (E) begin
            case (W)
                2'b00:   Y = 4'b0001;
                2'b01:   Y = 4'b0010;
                2'b10:   Y = 4'b0100;
                2'b11:   Y = 4'b1000;
                default: Y = 4'b0000;
            endcase
        end
    end
endmodule