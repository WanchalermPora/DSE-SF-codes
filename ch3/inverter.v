// Verilog Code 3.4: A simple inverter.
module inverter (
    input  I,
    output O
);
    // Logic description area:
    assign O = ~I;
endmodule