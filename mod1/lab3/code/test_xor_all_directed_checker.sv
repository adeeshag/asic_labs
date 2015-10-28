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
 int num_successful_tests=0;
 int num_of_tests=0;

 always #5 clk=~clk;

 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		for (i=0;i<16;i=i+1)
			begin
				for(j=0;j<16;j=j+1)
					begin
						A=i;
						B=j;
						golden_ref_output=A^B;
						#10;

                  if(Y[3]==0)
                  begin
                     $dsiplay("Ade\n");
                  end

                  if(golden_ref_output==Y)
                  begin
						   num_successful_tests=num_successful_tests+1;
                  end
                  else
                  begin
                     $display("A: %b  B:  %b  \n Y:  %b   Golden:  %b \n",A,B,Y,golden_ref_output);
                  end
						num_of_tests=num_of_tests+1;
					end
			end
			$display($time,"Number of Tests=%d",num_of_tests);
			$display($time,"Number of Successful Tests=%d",num_successful_tests);
	end

 xor_design u0_xordesign(.clk(clk),
						 .reset(reset),
						 .a(A),
						 .b(B),
						 .y(Y));
 endmodule
