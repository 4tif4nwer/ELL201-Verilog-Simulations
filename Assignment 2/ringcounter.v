module ring_counter (clk,override,count);

    input clk,override;
    output[3:0] count;
    
    wire[3:0] D;
    wire[3:0] Q,Qbar;

    assign D[0] = Q[1];
    assign D[1] = Q[2];
    assign D[2] = Q[3];
    assign D[3] = Q[1]^Q[0];
    
    D_flip_flop FF1(.D(D[0]),.clk(clk),.reset(1'b1),.preset(override),
                    .q(Q[0]),.qbar(Qbar[0]));
    
    D_flip_flop FF2(.D(D[1]),.clk(clk),.reset(override),.preset(1'b1),
                    .q(Q[1]),.qbar(Qbar[1]));
    
    D_flip_flop FF3(.D(D[2]),.clk(clk),.reset(override),.preset(1'b1),
                    .q(Q[2]),.qbar(Qbar[2]));
    
    D_flip_flop FF4(.D(D[3]),.clk(clk),.reset(1'b1),.preset(override),
                    .q(Q[3]),.qbar(Qbar[3]));

    assign count = Q;
    
endmodule

module D_flip_flop(D,clk,reset,preset, q, qbar);

    input D,clk,reset,preset;
    output reg q, qbar;

    always@(preset,reset,clk)
        begin
        if (reset == 0) begin
            q <= 0;
        end
        else if (preset == 0) begin
            q <= 1;
        end
        else if(clk == 1)
        begin

        if(D == 1)
            begin
            q <= 1;
            qbar <= 0;
            end
        else if(D == 0)
            begin
            q <= 0;
            qbar <=1;
            end
        
        end
    end
endmodule
