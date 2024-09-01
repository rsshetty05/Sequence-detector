module sequ(clk,rst,ins,outs);
input clk,rst,ins;
output reg outs;
reg [1:0]state,nxtstate;
parameter i=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
always@(posedge clk)
begin
    if(rst)
    state<=i;
    else
    state<=nxtstate;
end
always@(*)
begin
    case(state)
        i:nxtstate=(ins==0)?s1:i;
        s1:nxtstate=(ins)?s2:s1;
         s2:nxtstate=(ins)?s3:s1;
          s3:nxtstate=(ins)?i:s1;
  endcase
  end
  always@(*)
  begin
      if(state==s3)
      outs=1;
      else
      outs=0;
  end
  endmodule