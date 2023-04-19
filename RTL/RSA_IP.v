//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   File Name   : RSA_IP.v
//   Module Name : RSA_IP
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module RSA_IP #(parameter WIDTH = 3) (
    // Input signals
    IN_P, IN_Q, IN_E,
    // Output signals
    OUT_N, OUT_D
);

// ===============================================================
// Declaration
// ===============================================================
input  [WIDTH-1:0]   IN_P, IN_Q;
input  [WIDTH*2-1:0] IN_E;
output [WIDTH*2-1:0] OUT_N, OUT_D;

// ===============================================================
// Soft IP DESIGN
// ===============================================================
reg [WIDTH*2-1:0] N;
reg [WIDTH*2-1:0] Euler;
reg signed [WIDTH*2-1:0] r[0:8];
reg signed [WIDTH*2-1:0] t[0:8];

reg signed [WIDTH*2-1:0] q[0:7];
reg signed [WIDTH*2-1:0] ans;


/*assign N = IN_P*IN_Q;
assign Euler = (IN_P-1)*(IN_Q-1);
assign r[0] = Euler;
assign r[1] = IN_E;
assign t[0] = 0;
assign t[1] = 1;
assign s[0] = 1;
assign s[1] = 0;*/


always@(*)begin
N = IN_P*IN_Q;
Euler = (N-IN_P)-(IN_Q-1);
//Euler = (IN_P-1)*(IN_Q-1);
r[0] = Euler;
r[1] = IN_E;
t[0] = 0;
t[1] = 1;
//s[0] = 1;
//s[1] = 0;

end


genvar i;
generate

	for(i=2;i<9;i=i+1)begin
		always@(*) begin

				q[i-2] = r[i-2]/r[i-1];
				r[i]   = r[i-2]%r[i-1];

				t[i]   = t[i-2]-q[i-2]*t[i-1];
		
		end

	end

endgenerate


always@(*)begin

	if(r[2]==0) ans = t[1];
	else if(r[3]==0) ans = t[2];
	else if(r[4]==0) ans = t[3];
	else if(r[5]==0) ans = t[4];
	else if(r[6]==0) ans = t[5];
	else if(r[7]==0) ans = t[6];
	else  ans = t[7];
	
	

end



//assign OUT_D = (ans<0)? ans+Euler:ans;
assign OUT_D = (ans<0)? ans+Euler:(ans>Euler)? ans-Euler:ans;
assign OUT_N = N;


endmodule