// D Flip-flop
module d_flipflop (input clk, input d, output q);
  reg q; // Declare q as a register
  always @(posedge clk) begin
    q <= d; // Assign d to q on the positive edge of clk
  end
endmodule