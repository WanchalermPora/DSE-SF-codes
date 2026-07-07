// File: demux_generic.sv
module demux_generic #(
    parameter int M = 3 // Number of selection bits (defaults to a 1-to-8 distribution layout)
)(
    input  logic                 D,
    input  logic [M-1:0]         S,
    output logic [(2**M)-1:0]    Y
);
    always_comb begin
        // Clear all channels by default
        Y = '0;
        // Dynamically assign the incoming data stream to the selected index position
        Y[S] = D;
    end
endmodule