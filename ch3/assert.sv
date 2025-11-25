for (vec = 0; vec < 8; vec++) begin
    {I0, I1, I2} = vec[2:0];   // Apply input pattern
    #10;                      // 10 ns delay
    assert (Y_dut === Y_ref)
        else $error("Mismatch: I=%b%b%b  DUT=%b  REF=%b",
                        I0, I1, I2, Y_dut, Y_ref);  // assertion
end