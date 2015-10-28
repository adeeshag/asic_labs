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
 logic [7:0] Addr, BitAddr;
 logic [1:0] ByteAddr;
 logic [31:0] WrBus;
 logic [31:0] RdBus;
 int num_successful_tests=0;
 int num_of_tests=0;
 int num_sims=0;
 int i,j;
 int StudentId=200066470;

 always #5 clk=~clk;
 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		for(i=0;i<=511;i=i+1)
		  begin
			WrEn=1;
			RdEn=0;
			Addr=i;
			WrBus=i;
			#10;
		  end
		  
		for(i=0;i<=255;i=i+1)
		  begin
			RdEn=1;
			WrEn=0;
			Addr=i;
			RdEn_Opcode=0;
			BitAddr=0;
			ByteAddr=3;
			//RdEn_Opcode=i[1:0];
			#20;
			$display($time,"ns Memory Output[%d]= %b",i,RdBus); 
         num_of_tests += 1;
		  end
		for(i=256;i<=511;i=i+1)
		  begin
			RdEn=1;
			WrEn=0;
			Addr=i;
			RdEn_Opcode=0;
			BitAddr=1;
			ByteAddr=2;
			//RdEn_Opcode=i[1:0];
			#20;
			$display($time,"ns Memory Output[%d]= %b",i,RdBus); 
         num_of_tests += 1;
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
