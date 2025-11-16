// AND Gate
module and_gate (input a, input b, output out);
  assign out = a & b;
endmodule

// OR Gate
module or_gate (input a, input b, output out);
  assign out = a | b;
endmodule

// NOT Gate
module not_gate (input a, output out);
  assign out = ~a;
endmodule