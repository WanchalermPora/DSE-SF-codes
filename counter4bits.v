// 4-bit Up Counter
module counter_4bit (input clk, input reset, output reg [3:0] count);
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 4'b0000; // Reset to 0
    end else begin
      count <= count + 1; // Increment the count
    end
  end
endmodule