module convolution (
    input  [3:0] x0, x1, x2, x3, x4, x5, x6, x7,
    input  [3:0] h0, h1, h2, h3, h4, h5, h6, h7,
    output [3:0] y0, y1, y2, y3, y4, y5, y6, y7,
                 y8, y9, y10, y11, y12, y13, y14, y15
);
    reg [7:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7;
    reg [7:0] temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15;

    always @(*) begin
        temp0  = (x0 * h0);
        temp1  = (x0 * h1) + (x1 * h0);
        temp2  = (x0 * h2) + (x1 * h1) + (x2 * h0);
        temp3  = (x0 * h3) + (x1 * h2) + (x2 * h1) + (x3 * h0);
        temp4  = (x0 * h4) + (x1 * h3) + (x2 * h2) + (x3 * h1) + (x4 * h0);
        temp5  = (x0 * h5) + (x1 * h4) + (x2 * h3) + (x3 * h2) + (x4 * h1) + (x5 * h0);
        temp6  = (x0 * h6) + (x1 * h5) + (x2 * h4) + (x3 * h3) + (x4 * h2) + (x5 * h1) + (x6 * h0);
        temp7  = (x0 * h7) + (x1 * h6) + (x2 * h5) + (x3 * h4) + (x4 * h3) + (x5 * h2) + (x6 * h1) + (x7 * h0);
        temp8  = (x1 * h7) + (x2 * h6) + (x3 * h5) + (x4 * h4) + (x5 * h3) + (x6 * h2) + (x7 * h1);
        temp9  = (x2 * h7) + (x3 * h6) + (x4 * h5) + (x5 * h4) + (x6 * h3) + (x7 * h2);
        temp10 = (x3 * h7) + (x4 * h6) + (x5 * h5) + (x6 * h4) + (x7 * h3);
        temp11 = (x4 * h7) + (x5 * h6) + (x6 * h5) + (x7 * h4);
        temp12 = (x5 * h7) + (x6 * h6) + (x7 * h5);
        temp13 = (x6 * h7) + (x7 * h6);
        temp14 = (x7 * h7);
        temp15 = 0;
    end

    assign y0  = temp0[3:0];
    assign y1  = temp1[3:0];
    assign y2  = temp2[3:0];
    assign y3  = temp3[3:0];
    assign y4  = temp4[3:0];
    assign y5  = temp5[3:0];
    assign y6  = temp6[3:0];
    assign y7  = temp7[3:0];
    assign y8  = temp8[3:0];
    assign y9  = temp9[3:0];
    assign y10 = temp10[3:0];
    assign y11 = temp11[3:0];
    assign y12 = temp12[3:0];
    assign y13 = temp13[3:0];
    assign y14 = temp14[3:0];
    assign y15 = temp15[3:0];

endmodule

