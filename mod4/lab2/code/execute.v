//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: XOR                                         
//  MODULE NAME: xor_design
//********************************************************************
 `timescale 10 ns / 1 ps

 module execute    ( clk,
					reset,
					enable,
					opcode,
					operand1,
					operand2,
					result,
					overflow,
					done
					);
 input clk;
 input reset;
 input enable;
 input [7:0] opcode;
 input [31:0] operand1;
 input [31:0] operand2;
 output wire [31:0] result;
 output wire overflow;
 output reg done;
 reg [32:0] result_int_reg;

 
 `pragma protect begin
 assign result=result_int_reg[31:0];
 assign overflow= result_int_reg[32];
 always @(posedge clk)
	begin
		if((!reset)&&(enable==1))
			begin
				case(opcode)
				0: begin result_int_reg<=0; done<=0; end
				1: begin result_int_reg<=operand1+operand2; done<=1; end
				2: begin result_int_reg<=operand1-operand2; done<=1; end
				3: begin result_int_reg<=operand1*operand2; done<=1; end
				4: begin result_int_reg<=operand1^operand2; done<=1; end
				5: begin result_int_reg<=operand1&operand2; done<=1; end
				6: begin result_int_reg<=operand1||operand2; done<=1; end
				7: begin result_int_reg<=~(operand1&operand2); done<=1; end
				endcase		
			end
		else
			begin
				result_int_reg<=0;
			end
	end
 endmodule
 `pragma protect end
 
 
 

 
 
 
 
 