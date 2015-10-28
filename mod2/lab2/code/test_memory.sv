//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Test bench for XOR (filename=xor_design.v)                                       
//  MODULE NAME: test_xor
//********************************************************************
 `timescale 10 ns / 1 ps
 module test_memory();
 reg clk=0;
 reg reset=0;
 logic WrEn, RdEn;
 logic [1:0] RdEn_Opcode;
 logic [15:0] Addr;
 logic [4:0] BitAddr;
 logic [1:0] ByteAddr;
 logic [31:0] WrBus;
 logic [31:0] RdBus;
 int num_successful_tests=0;
 int num_of_tests=0;
 int num_sims=0;
 int i,j;
 int StudentId=200066470;
 bit [3:0][7:0] golden_ref [*];
 int idx = 1;


 always #5 clk=~clk;
 initial 
	begin
      repeat((2**16)-1)
      begin
      golden_ref[idx] = idx;
      idx <<= 1;
      end

   //golden_ref[64537] = 32'hf1f2f3f4;
   //$display("%h\n", golden_ref[64537][0][2]);

		reset=1'b1;
		#10 reset=1'b0;
		for(i=0;i<=65535;i=i+1)
		  begin
			WrEn=1;
			RdEn=0;
			Addr=i;
			WrBus=i;
         golden_ref[i] = i;
			#10;
		  end

        for(i=0;i<=65535;i=i+1)
        begin
         RdEn=1;
         WrEn=0;
         Addr=i;
         RdEn_Opcode=0;
         BitAddr=16'd7;
         ByteAddr=0;
         //RdEn_Opcode=i[1:0];
         #20;
         //$display($time,"ns Memory Output[%d]= %b",i,RdBus); 
         if( RdBus == golden_ref[i][0][7])
         begin
            num_successful_tests += 1;
         end
         else
         begin
            $display($time,"ns Memory Output[%d]= %b",i,RdBus); 
         end
        end


		  
        $display(" Number of tests: %d \n Number of \
              Successful Tests: %d\n", num_of_tests, num_successful_tests);
		$finish;
	end


memory u0_memory(   .clk(clk),
					.reset(reset),
					.WrEn(WrEn),
					.RdEn(RdEn),
					.RdEn_Opcode(RdEn_Opcode),
					.RdBus(RdBus),
					.BitAddr(BitAddr),
					.ByteAddr(ByteAddr),
					.Addr(Addr),
					.WrBus(WrBus),
					.StudentId(StudentId));
 endmodule
