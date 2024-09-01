module sequ_tb();
reg clk,rst,ins;
wire outs;
reg [15:0]d;
integer i;

sequ u1(clk,rst,ins,outs);
initial clk=1;
always #5 clk=~clk;
initial
begin
    d=16'b0001100010110111;
    i=0;
end
initial
begin
    rst=1; #10;
    rst=0;
    #500 $finish;
end
always @(posedge clk)
begin
    ins<=d>>i;
    $display(ins,"--",outs);
    i=i+1;
end

endmodule