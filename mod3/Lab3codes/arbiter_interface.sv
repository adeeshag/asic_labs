//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Arbiter Interface                                        
//  MODULE NAME: arb_if
//********************************************************************
 `timescale 10 ns / 1 ps

 interface arb_if(input bit clk);
	logic [1:0] grant, request;
	logic reset;


   //clokcing block
   clocking cb @(posedge clk);
      default output #2 ;
      //input    clk;
      output   reset;
      input    grant;
      output   request;
   endclocking:  cb

   modport TEST(clocking cb,input clk);


 endinterface

