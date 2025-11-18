// Verilog Code 3.4: A simple inverter.
module inverter (
    input  wire I,
    output wire O
);
    // Logic description area:
    assign O = ~I;
endmodule
