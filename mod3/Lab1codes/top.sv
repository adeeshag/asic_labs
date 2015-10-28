module top();

logic clk=0,reset;

logic [1:0] grnt,req;

always #5 clk=~clk;


test_arbiter t1(.clk(clk),.reset(reset),.grant(grnt), .request(req));

arbiter a1(.clk(clk),.reset(reset),.grant(grnt), .request(req));

endmodule
