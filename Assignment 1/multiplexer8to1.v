module Combination
(
    input A,
    input B,
    input C,
    input D,
    output F
);
wire comp;
not(comp,A);
multiplexer8x1 M1(  .I0(1'b1),
                    .I1(1'b1),
                    .I2(comp),
                    .I3(A),
                    .I4(1'b0),
                    .I5(1'b1),
                    .I6(1'b1),
                    .I7(A),
                    .S2(B),
                    .S1(C),
                    .S0(D),
                    .F(F));

endmodule
module multiplexer8x1
(
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S2,
    input S1,
    input S0,
    output reg F 
);
always @(I0,I1,I2,I3,I4,I5,I6,I7,S0,S1,S2) 
begin
    if (S2) begin
        if (S1) begin
            if (S0) begin
                assign F = I7;
            end
            else begin
                assign F = I6;
            end
        end
        else begin
            if (S0) begin
                assign F = I5;
            end
            else begin
                assign F = I4;
            end
        end
    end
    else begin
        if (S1) begin
            if (S0) begin
                assign F = I3;
            end
            else begin
                assign F = I2;
            end
        end
        else begin
            if (S0) begin
                assign F = I1;
            end
            else begin
                assign F = I0;
            end
        end
    end
end
endmodule
