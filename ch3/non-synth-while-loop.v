// Verilog Code 3.2 Non-synthesizable code due to data-dependent loop
always @(*) begin
    temp = data_in;
    while (temp < 100) begin
        temp = temp + 1; // Loop has no clock
    end
    data_out = temp;
end