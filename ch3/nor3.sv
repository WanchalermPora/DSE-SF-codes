// (System)Verilog Code 3.7: 3-input NOR using always_comb
module nor3_sv (
    input  logic I0
    input  logic I1,
    input  logic I2,
    output logic O_NOR  // logic replaces reg and wire 
);
    always_comb begin  // always_comb replaces always
        O_NOR = ~(I0 | I1 | I2);
    end
endmodule