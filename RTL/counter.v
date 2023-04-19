module counter(clk, rst_n,cnt1,cnt2,cnt3);

parameter WIDTH = 800;

	input clk;
	input rst_n;
	output [WIDTH-1:0] cnt1,cnt2,cnt3;

	reg [WIDTH-1:0] cnt,cnt1,cnt2,cnt3;

	always @(posedge clk or negedge rst_n)
	begin
	  if (~rst_n) 
	    cnt <= 0;		
	  else 
	    cnt <= cnt +1;  //cnt <= cnt +1;
	end
	
	always @(posedge clk or negedge rst_n)
	begin
	  if (~rst_n) 
	    cnt1 <= 0;		
	  else 
	    cnt1 <= cnt ;  //cnt <= cnt +1;
	end
	
	always @(posedge clk or negedge rst_n)
	begin
	  if (~rst_n) 
	    cnt2 <= 0;		
	  else 
	    cnt2 <= cnt %3 ;  //cnt <= cnt +1;
	end
	
	always @(posedge clk or negedge rst_n)
	begin
	  if (~rst_n) 
	    cnt3 <= 0;		
	  else 
	    cnt3 <= cnt %7;  //cnt <= cnt +1;
	end
	
endmodule
