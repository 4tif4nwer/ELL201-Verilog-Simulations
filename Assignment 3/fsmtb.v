module FSM_testbench;

reg clk;
reg x;
reg reset; 
wire y;
wire[2:0] State;
fsm G(.clk(clk), .override(reset),.x(x), .y(y), .State(State));

initial begin
    clk = 0; 
    forever #4 clk=~clk;
end

initial begin
    $monitor ("clock = %b, x = %b, y = %b",clk,x,y);
    $dumpfile("TestBench.vcd");
    $dumpvars (0, FSM_testbench);

    reset <= 0;
    x<=0;
    #10;
    reset <=1;
    #6
    x<=1;

    repeat (13)
    begin
        #10;
    end
    x<=0;
    repeat (3)
    begin
        #10;
    end

    $finish;
end
endmodule