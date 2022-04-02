module fsm(clk,override,x,y,State);
    input clk,override,x;
    wire [2:0] D; 
    wire [2:0] Q,Qbar; 
    output reg y;
    output[2:0] State;
    
    
    
    assign    D[2] =  (~Q[2] & Q[1] & Q[0])
                    | (Q[2] & ~Q[1] & ~Q[0]); 

    assign    D[1] =  (~Q[2] & ~Q[1] & Q[0])
                    | (~Q[2] & Q[1] & ~Q[0]); 

    assign    D[0] =  (~Q[2] & Q[1] & ~Q[0])
                    | (Q[2] & ~Q[1] & ~Q[0])
                    | (~Q[2] & ~Q[0] & x); 
    assign    State = Q;
    always @(posedge clk) begin

        y = (~Q[1] & Q[0])|(~Q[2] & Q[1] & ~Q[0])|(~Q[2] & ~Q[0] & x);          
    
    end

    D_flip_flop dff2(D[2],clk,override,1'b1,Q[2],Qbar[2]);
    D_flip_flop dff1(D[1],clk,override,1'b1,Q[1],Qbar[1]);
    D_flip_flop dff0(D[0],clk,override,1'b1,Q[0],Qbar[0]); 
    
endmodule
module D_flip_flop(D,clk,reset,preset, q, qbar);

    input D,clk,reset,preset;
    output reg q, qbar;

    always@(posedge clk)
        begin
        if (reset == 0) begin
            q <= 0;
        end
        else if (preset == 0) begin
            q <= 1;
        end
        else
        begin
        q<=D;
        qbar<=(~D);
        
        end
    end
endmodule
