// File: demux_1to4.sv
module demux_1to4 (
    input  logic       D,
    input  logic [1:0] S,
    output logic [3:0] Y
);
    always_comb begin
        Y = 4'b0000;
        case (S)
            2'b00:   Y[0] = D;
            2'b01:   Y[1] = D;
            2'b10:   Y[2] = D;
            2'b11:   Y[3] = D;
            default: Y = 4'b0000;
        endcase
    end
endmodule