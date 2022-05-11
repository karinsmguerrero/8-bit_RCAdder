module FullAdder(input A, B, Cin, output Y, Cout);

  assign Y = A ^ B ^ Cin;
  assign Cout = (B & Cin ) | (A & Cin) | (A & B);

endmodule
