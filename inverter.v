// Verilog Code 3.4: A simple CMOS inverter.
// This is the most basic \gls{Verilog} module.
module inverter (
    input  I,
    output O
);

    // Logic description area:
    // Continuous assignment for NOT logic
    assign O = ~I;

endmodule