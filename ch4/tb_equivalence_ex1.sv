module tb_equivalence_ex1;

    logic A, B, C;
    logic Z_gold, Z_dut;

    // Gold model: Step 3 equation
    ex1_z_gold u_gold (
        .A(A), .B(B), .C(C),
        .Z(Z_gold)
    );

    // DUT: Step 4 optimised equation
    ex1_z_dut u_dut (
        .A(A), .B(B), .C(C),
        .Z(Z_dut)
    );

    integer vec;

    initial begin
        for (vec = 0; vec < 8; vec++) begin
            {A, B, C} = vec[2:0];
            #1;

            assert (Z_gold === Z_dut)
            else $error("Mismatch: A=%0b B=%0b C=%0b | gold=%0b dut=%0b",
                        A, B, C, Z_gold, Z_dut);
        end

        $display("All test vectors passed. ex1_z_gold and ex1_z_dut are equivalent.");
        $finish;
    end

endmodule
