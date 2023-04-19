module top (clk, rst_n, OUT_N, OUT_D);

parameter WIDTH = 4;

	input wire clk, rst_n;
	output wire [WIDTH*2-1:0] OUT_N, OUT_D;
	
	wire [WIDTH-1:0] cnt_temp1, cnt_temp2, cnt_temp3;

	
counter #(.WIDTH(WIDTH)) cnt_inst1 (.clk(clk), .rst_n(rst_n), .cnt1(cnt_temp1), .cnt2(cnt_temp2), .cnt3(cnt_temp3));


RSA_IP #(.WIDTH(WIDTH)) RSA_IP1 (.IN_P(cnt_temp1), .IN_Q(cnt_temp2), .IN_E(cnt_temp3), .OUT_N(OUT_N), .OUT_D(OUT_D));


endmodule

