//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Test bench for XOR (filename=xor_design.v)                                       
//  MODULE NAME: test_xor
//********************************************************************
 `timescale 10 ns / 1 ps
 module test_xor();
 reg clk=0;
 reg reset=0;
 reg [3:0] A=0, B=0;
 reg [3:0] Y, golden_ref_output;
 reg [3:0] i;

 always #5 clk=~clk;

 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		#0 A=4'b0001;
		#0 B=4'b1001;
		#10 A=4'b0011;
		#0 B=4'b1010;
		#10 A=4'b0111;
		#0 B=4'b1011;
	end

 xor_design u0_xordesign(.clk(clk),
						 .reset(reset),
						 .a(A),
						 .b(B),
						 .y(Y));
 endmodule
