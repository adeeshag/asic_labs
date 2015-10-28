//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: XOR                                         
//  MODULE NAME: xor_design
//********************************************************************
 `timescale 10 ns / 1 ps

 module xor_design( clk,
					reset,
					a,
					b,
					y);
 input clk;
 input reset;
 input [3:0] a, b;
 output reg [3:0]  y;

 always @(posedge clk)
	begin
		if(!reset)
			begin
				y<=a^b;
			end
		else
			begin
				y<=0;
			end
	end
 endmodule
 
 
 
 

 
 
 
 
 
