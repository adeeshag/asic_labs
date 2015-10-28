//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: XOR                                         
//  MODULE NAME: xor_design
//********************************************************************
 `timescale 10 ns / 1 ps

 module memory( clk,
					reset,
					WrEn,
					RdEn,
					RdEn_Opcode,
					RdBus,
					BitAddr,
					ByteAddr,
					Addr,
					WrBus,
					StudentId);
 input clk;
 input reset;
 input WrEn, RdEn;
 input [1:0] RdEn_Opcode;
 input [15:0] Addr;
 input [4:0] BitAddr;
 input [1:0] ByteAddr;
 input [31:0] WrBus;
 output reg [31:0] RdBus;
 reg [31:0] Mem [0:65535];
 reg [31:0] MemRdOut, MemWrIn;
 reg next_state=0;
 parameter S0=0, S1=1;
 input [31:0] StudentId;

  `pragma protect begin
 always @(posedge clk)
	begin
		if(!reset)
			begin
				case(next_state)
					S0: begin
							if(RdEn==1)
								begin
									MemRdOut<=Mem[Addr];
									next_state<=S1;
									RdBus<=0;
								end
							else if(WrEn==1)
								begin
									Mem[Addr]<={WrBus[31:5],1'b1,WrBus[2:0]};
									$display($time,"ns Mem[%d]=%b",Addr,WrBus);
									next_state<=S0;
								end
						end
					S1: begin
							case(RdEn_Opcode)
								0: begin RdBus<=MemRdOut; end
								1: begin RdBus<=MemRdOut[BitAddr]; end
								2: case(ByteAddr)
									0: RdBus<=MemRdOut[7:2];
									1: RdBus<=MemRdOut[15:8];
									2: RdBus<=MemRdOut[23:16];
									3: RdBus<=MemRdOut[31:24];
								   endcase  
                           default: begin RdBus<={MemRdOut[31:5],1'b1,MemRdOut[2:0]}; end
							endcase
							next_state<=S0;
						end
				endcase
			end
		else
			begin
				next_state<=0;
			end
	end
 endmodule
 `pragma protect end
 
 
 

 
 
 
 
 
