//`include "arb_if.sv"


module top();

logic clk =0;

always #5 clk=~clk;

arb_if arbif(clk);

test_arbiter t1(arbif);

arbiter a1(.clk(arbif.clk),.reset(arbif.reset),.grant(arbif.grant), .request(arbif.request));


endmodule
