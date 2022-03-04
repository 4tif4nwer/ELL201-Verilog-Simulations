module Combination
(
    input A,
    input B,
    input C,
    input D,
    output F
);
wire Dcomp,m1,m2,Acomp;
not(Acomp,A);
not(Dcomp,D);
multiplexer4x1 M1(  .I0(1'b1),
                    .I1(Dcomp),
                    .I2(D),
                    .I3(Dcomp),
                    .En(Acomp),
                    .S1(B),
                    .S0(C),
                    .F(m1));

multiplexer4x1 M2(  .I0(1'b1),
                    .I1(D),
                    .I2(D),
                    .I3(1'b1),
                    .En(A),
                    .S1(B),
                    .S0(C),
                    .F(m2));
or(F,m1,m2);

endmodule
module multiplexer4x1
(
    input I0,
    input I1,
    input I2,
    input I3,
    input En,
    input S1,
    input S0,
    output reg F 
);
always @(I0,I1,I2,I3,S0,S1) 
begin
    if(En) begin
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
    else begin
        assign F = 1'b0;
    end
end
endmodule


