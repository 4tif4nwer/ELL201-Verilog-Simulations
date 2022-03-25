module grey_counter (clk,reset,count);

    input clk,reset;
    output[3:0] count;
    
    wire[3:0] S,R;
    wire[3:0] Q,Qbar;

    assign S[0] =   ((~Q[3]) & (~Q[2]) & (~Q[1])) 
                    | ((~Q[3]) & (Q[2]) & (Q[1])) 
                    | ((Q[3]) & (Q[2]) & (~Q[1])) 
                    | ((Q[3]) & (~Q[2]) & (Q[1]));
                    
    assign R[0] =   ((~Q[3]) & (~Q[2]) & (Q[1])) 
                    | ((~Q[3]) & (Q[2]) & (~Q[1])) 
                    | ((Q[3]) & (Q[2]) & (Q[1])) 
                    | ((Q[3]) & (~Q[2]) & (~Q[1]));

    assign S[1] =   ((~Q[3]) & (~Q[2]) & (Q[0])) 
                    | ((Q[3]) & (Q[2]) & (Q[0]));
    assign R[1] =   ((~Q[3]) & (Q[2]) & (Q[0])) 
                    | ((Q[3]) & (~Q[2]) & (Q[0]));

    assign S[2] =   ((~Q[3]) & (Q[1]) & (~Q[0]));
    assign R[2] =   ((Q[3]) & (Q[1]) & (~Q[0]));
    assign S[3] =   ((Q[2]) & (~Q[1]) & (~Q[0]));
    assign R[3] =   ((~Q[2]) & (~Q[1]) & (~Q[0]));

    sr_flip_flop FF1(.s(S[0]),.r(R[0]),.clk(clk),.reset(reset),
                    .q(Q[0]),.qbar(Qbar[0]));

    sr_flip_flop FF2(.s(S[1]),.r(R[1]),.clk(clk),.reset(reset),
                    .q(Q[1]),.qbar(Qbar[1]));

    sr_flip_flop FF3(.s(S[2]),.r(R[2]),.clk(clk),.reset(reset),
                    .q(Q[2]),.qbar(Qbar[2]));
                    
    sr_flip_flop FF4(.s(S[3]),.r(R[3]),.clk(clk),.reset(reset),
                    .q(Q[3]),.qbar(Qbar[3]));

    assign count = Q;
   
endmodule

module sr_flip_flop(s,r,clk,reset, q, qbar);

    input s,r,clk,reset;
    output reg q, qbar;

    always@(reset,clk)
        begin
        if (reset == 0) begin
            q <= 0;
        end
        else if(clk==1)
        begin

        if(s == 1)
            begin
            q <= 1;
            qbar <= 0;
            end
        else if(r == 1)
            begin
            q <= 0;
            qbar <=1;
            end
        else if(s == 0 & r == 0) 
            begin 
            q <= q;
            qbar <= qbar;
            end
        end
        end
endmodule
