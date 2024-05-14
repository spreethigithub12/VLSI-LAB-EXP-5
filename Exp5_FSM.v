module fsm(clk, rst, x, z);
input clk, rst, x;
output z;
reg [2:1] present_state, NEXT_STATE;
parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
always@(x,present_state)
case(present_state)
S0: if(x)
NEXT_STATE=S1;
else
NEXT_STATE=S0;
S1: if(x)
NEXT_STATE=S1;
else
NEXT_STATE=S2;
S2: if(x)
NEXT_STATE=S3;
else
NEXT_STATE=S0;
S3: if(x)
NEXT_STATE=S1;
else
NEXT_STATE=S2;
endcase
always@(negedge rst, posedge clk)
if(rst)
present_state<=S0;
else
present_state<=NEXT_STATE;
assign z=(present_state==S3);
endmodule
