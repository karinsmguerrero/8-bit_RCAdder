`timescale 1ns / 10ps

module FullAdder_tb();

	reg A;
	reg B;
	reg Cin;
    wire Cout;
	wire Y;

	FullAdder DUT (A,B,Cin,Y, Cout);
	initial begin
		A = 0; B = 0; Cin = 0;
		#10;
		A = 0; B = 0; Cin = 1;
		#10;
		A = 0; B = 1; Cin = 0;
		#10;
		A = 0; B = 1; Cin = 1;
		#10;
		A = 1; B = 0; Cin = 0;
		#10;
		A = 1; B = 0; Cin = 1;
		#10;
		A = 1; B = 1; Cin = 0;
		#10;
		A = 1; B = 1; Cin = 1;
		#10;
		$finish;
	end

	initial begin
		$display("A B Cin || Y Cout");
		$monitor("%b %b %b || %b %b",A,B,Cin,Y, Cout);
	end

endmodule
