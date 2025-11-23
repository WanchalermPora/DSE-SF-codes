module tb_nor3;

    logic I0, I1, I2;
    logic dut_out;
    logic ref_out;

    // Instantiate DUT (behavioural description of inverted AND)
    inverted_and3 dut (
        .I0(I0), .I1(I1), .I2(I2),
        .O_NOR(dut_out)
    );

    // Instantiate reference model (structural description)
    nor U_ref (ref_out, I0, I1, I2);

    initial begin
        $display("Starting NOR3 testbench");
        for (int vec = 0; vec < 8; vec++) begin
            {I0, I1, I2} = vec[2:0];
            #10;
            if (dut_out !== ref_out) begin
                $display("Mismatch: I0 I1 I2 = %b%b%b  DUT = %b  REF = %b",
                         I0, I1, I2, dut_out, ref_out);
            end else begin
                $display("Match: I0 I1 I2 = %b%b%b  Output = %b",
                         I0, I1, I2, dut_out);
            end
        end
        $display("Testbench completed");
        $finish;
    end

endmodule
