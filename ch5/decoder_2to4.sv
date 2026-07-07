module decoder_2to4 (
    input  logic       E,
    input  logic [1:0] A,
    output logic [3:0] Y
);
    always_comb begin
        if (E) Y = 4'b0001 << A;
        else   Y = 4'b0000;
    end
endmodule