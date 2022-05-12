`timescale 1ns / 10ps

module RippleCarryAdder_tb();

	reg [7:0] a;
	reg [7:0] b;
	reg cin;
	wire [7:0] s;
	wire cout;

	integer i,j;
	integer file;

	RippleCarryAdder DUT (.A(a),.B(b),.Cin(cin),.S(s),.Cout(cout));

	initial begin
		$display("--- Beginning simulation ---");

		file = $fopen("output_RippleCarryAdder.txt","w");

		a = 0; b = 0; cin = 0;
		#10;
		
		for (i = 0; i < 256; i = i + 1) begin
			for (j = 0; j < 256; j = j + 1) begin
				a = i;
				b = j;
				#10
				$fwrite(file,"%d\n",{cout,s});
			end
		end
		
		$fclose(file);
		$display("-- Ending simulation --");
		$finish;
	end

endmodule
