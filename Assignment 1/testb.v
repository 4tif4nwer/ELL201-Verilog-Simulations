module tb;

reg A,B,C,D;
wire F;
integer i;

Combination Circuit(.A(A),.B(B),.C(C),.D(D),.F(F));

initial begin
$dumpfile("tb.vcd");
$dumpvars(0,tb); 
    A<=0;
    B<=0;
    C<=0;
    D<=0;

    $monitor("A = %0b B = %0b C = %0b D = %0b   F = %0b",A,B,C,D,F);
    for (i =0 ;i<16 ;i = i+1 ) begin
        {A,B,C,D} = i;
        #10;
    end
end
endmodule