//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Test bench for ALU Execute (filename=xor_design.v)                                       
//  MODULE NAME: test_execute
//********************************************************************
 `timescale 10 ns / 1 ps
 module test_execute();
 logic clk=0;
 logic reset=0;
 logic enable;
 logic [7:0] opcode, inst_opcode;
 logic [31:0] operand1, inst_operand1;
 logic [31:0] operand2, inst_operand2;
 logic [31:0] result, result_gr;
 logic [32:0] result_int_reg=0;
 logic overflow, overflow_gr;
 logic done;
 
 int num_successful_tests=0;
 int num_failed_tests=0;
 int num_of_tests=0;
 int num_sims=100;
 int i,j;

 //class instruction; 
 class Instruction; 
	typedef struct packed {
			reg [7:0] 	opcode;
			reg [31:0]	operand1;
			reg [31:0]	operand2;
	}instruc;
   instruc inst; // create instance of instruction packet
   function new();
	   inst.opcode=$urandom_range(1,7);
	   inst.operand1=$random;
	   inst.operand2=$random;
   endfunction

	
endclass

//declare handle
Instruction inst_gen;


 always #5 clk=~clk;
 initial 
	begin
		resetfn();
		for(i=0;i<num_sims;i=i+1)
		  begin
			generate_instr();
			send();
			golden_ref();
			@clk;
			@clk;
			checkerfn();
		  end
		  $display($time,"[TEST][MAIN]Number of Tests=%d",num_sims);
		  $display($time,"[TEST][MAIN]Number of Successful tests=%d",num_successful_tests);
		  $display($time,"[TEST][MAIN]Number of Failed tests=%d",num_failed_tests);
		$finish;
	end

task resetfn();
	reset=1'b1;
	#10 reset=1'b0;
endtask

task generate_instr();
	inst_gen=new();
	//inst_opcode=$urandom_range(1,7);
	//inst_operand1=$random;
	//inst_operand2=$random;
	$display($time,"[TEST][GEN]Instruction[%d][%d][%d]",inst_gen.inst.opcode,inst_gen.inst.operand1,inst_gen.inst.operand2); 
endtask

task send();
	enable=1;
	opcode=inst_opcode;
	operand1=inst_operand1;
	operand2=inst_operand2;
	$display($time,"[TEST][SEND]Instruction[%d][%d][%d]",opcode,operand1,operand2);
endtask

task golden_ref();
		if((!reset)&&(enable==1))
			begin
				case(opcode)
				0: begin result_int_reg<=0; end
				1: begin result_int_reg<=operand1+operand2; end
				2: begin result_int_reg<=operand1-operand2; end
				3: begin result_int_reg<=operand1*operand2; end
				4: begin result_int_reg<=operand1^operand2; end
				5: begin result_int_reg<=operand1&operand2; end
				6: begin result_int_reg<=operand1||operand2; end
				7: begin result_int_reg<=~(operand1&operand2); end
				endcase		
			end
		result_gr=result_int_reg[31:0];
		overflow_gr= result_int_reg[32];
endtask

task checkerfn();
	if(result==result_gr)
		num_successful_tests=num_successful_tests+1;
	else
		begin
			num_failed_tests=num_failed_tests+1;
			$display("test failed");
			$display("");
		end
endtask

execute u0_execute( .clk(clk),
					.reset(reset),
					.enable(enable),
					.opcode(opcode),
					.operand1(operand1),
					.operand2(operand2),
					.result(result),
					.overflow(overflow),
					.done(done)
					);
 endmodule
