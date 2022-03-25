module ringcounter_testbench;

reg clk;
reg reset; 
wire [3:0] count;

ring_counter G(.clk(clk), .override(reset), .count(count));

initial begin
    clk=0; 
    forever #10 clk=~clk;
end

initial begin
    $monitor ("clock %b, count = %b",clk,count);
    $dumpfile("TestBench.vcd");
    $dumpvars (0, ringcounter_testbench);

    reset <= 0; 
    #10;
    reset <=1;

    repeat (30)
    begin
        #10;
    end

    $finish;
end
endmodule