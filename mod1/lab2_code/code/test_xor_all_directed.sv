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
 reg [4:0] i,j;
 reg [71:0] studentid=200066470;
 always #5 clk=~clk;

 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		for (i=0;i<16;i=i+1)
			begin
				B=i;
		   for (j=0;j<16;j=j+1)
         begin
            A=j;
				#5;
				#15;
				golden_ref_output=A^B;
            $display("Value of A: %b  B= %b  \n Y= %b Golden_ref=%b \n",A,B,Y,golden_ref_output);
           //if(golden_ref_output!=Y)
           if(Y[2]!=0)
           begin
            $display("Not Stuck at 0");
           end
			end //For j
      end //For i
	end

 xor_design u0_xordesign(.clk(clk),
						 .reset(reset),
						 .studentid(studentid),
						 .a(A),
						 .b(B),
						 .y(Y));
 endmodule
