//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Test bench for Arbiter (filename=xor_design.v)                                       
//  MODULE NAME: test_arbiter
//********************************************************************
 `timescale 10 ns / 1 ps
 module test_arbiter(clk,
					 reset,
					 grant,
					 request);
					 
 input clk;
 output reg reset;
 input [1:0] grant;
 output reg [1:0] request;
 logic [1:0] tb_grant=2'b0;
 int test_passed=0;
 int test_failed=0;
 int total_test=0;
 initial 
	begin
		$display($time,"ns [TB] Start Testing");
		@(posedge clk);
		tb_grant=2'b0;
		request=2'b0;
		reset=1'b1;
		$display($time,"ns [TB][RESET] Asserting Reset: %b",clk);
		repeat (5) @(posedge clk);
		$display($time,"ns [TB][RESET] Clearing Reset: %b",clk);
		reset=1'b0;
		@(posedge clk);
		repeat(40)
			begin
            //request=$urandom_range(0,3);
            //request = request + 2'd1 ;
            request = 2'd2 ;
				$display($time,"ns------------------------------------------------------");
				$display($time,"ns [TB][DRIVER] Drove Request: %b",request);
				golden_ref();
				repeat (2) @(posedge clk);
				if(grant==tb_grant)
					begin
						$display($time,"[TB][CHECKER] Test Passed. Grant: %b", grant);
						test_passed=test_passed+1;
					end
				else
					begin
						$display($time,"[TB][CHECKER] Test Failed. Grant: %b", grant);
						$display($time,"[TB][CHECKER] Test Failed. TB_Grant: %b", tb_grant);
						test_failed=test_failed+1;
					end
				total_test=total_test+1;
			end
			$display($time,"----------[TB][FINAL] TEST STATS---------");
			$display($time,"TEST PASSED: %d",test_passed);
			$display($time,"TEST FAILED: %d",test_failed);
			$display($time,"TEST TOTAL: %d",total_test);
		$finish;
	end

	task golden_ref();
		case(request)
				 2'b00: begin tb_grant=2'b00; end
				 2'b01: begin tb_grant=2'b01; end
				 2'b10: begin tb_grant=2'b10; end
				 2'b11: begin tb_grant=2'b11; end
		endcase
		$display($time,"ns [TB][GOLD REF] Request: %b| Grant: %b",request,tb_grant);	
	endtask
 endmodule
