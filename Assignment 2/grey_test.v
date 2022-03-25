module greycode_testbench;

reg clk;
reg reset; 
wire [3:0] count;

grey_counter G(.clk(clk), .reset(reset), .count(count));

initial begin
    clk=0; 
    forever #10 clk=~clk;
end

initial begin

    $monitor ("clock %b, count = %b",clk,count);
    $dumpfile("TestBench.vcd");
    $dumpvars (0, greycode_testbench);

    reset <= 0; 
    #10;
    reset <= 1;

    repeat (32)
    begin
        #10;
    end

    $finish;
end
endmodule