module tb_equivalence;

    // ---------------------------------------------------------
    // Select which DUTs to test by changing the module names.
    // ---------------------------------------------------------
    // Example 4.1:
    //   ex1_z_gold  vs ex1_z_dut
    //
    

    logic A, B, C, D;
    logic Y_gold, Y_dut;

    // Instantiate reference model (gold) and DUT
    ex2_y_gold u_gold (
        .A(A), .B(B), .C(C), .D(D),
        .Y(Y_gold)
    );

    ex2_y_dut u_dut (
        .A(A), .B(B), .C(C), .D(D),
        .Y(Y_dut)
    );

    integer vec;

    initial begin
        // Sweep all 16 input combinations
        for (vec = 0; vec < 16; vec++) begin
            {A, B, C, D} = vec[3:0];
            #1;

            assert (Y_gold === Y_dut)
            else $error("Mismatch: A=%0b B=%0b C=%0b D=%0b | gold=%0b dut=%0b",
                        A, B, C, D, Y_gold, Y_dut);
        end

        $display("All test vectors passed. gold and dut are equivalent.");
        $finish;
    end

endmodule
