module LSB_Two_AproximateRCAdder(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Cout);

  wire cout1,cout2,cout3, cout4, cout5, cout6, cout7;

  FullAdder fa0 (A[0], B[0], Cin, S[0], cout1);
  FullAdder fa1 (A[1], B[1], cout1, S[1], cout2);
  FullAdder fa2 (A[2], B[2], cout2, S[2], cout3);
  FullAdder fa3 (A[3], B[3], cout3, S[3], cout4);
  FullAdder fa4 (A[4], B[4], cout4, S[4], cout5);
  FullAdder fa5 (A[5], B[5], cout5, S[5], cout6);
  AproximateAdder fa6 (A[6], B[6], cout6, S[6], cout7);
  AproximateAdder fa7 (A[7], B[7], cout7, S[7], Cout);

endmodule
