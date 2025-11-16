// Verilog Code 3.X Non-synthesizable code due to initial and precise-delay assignment. 
initial begin
    clk = 0;
    reset = 1;
    forever #5 clk = ~clk;
    #20 reset = 0;
end
