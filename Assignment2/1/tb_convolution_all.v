`timescale 1ns/1ps

module tb_convolution_all;

    reg  [3:0] x0, x1, x2, x3, x4, x5, x6, x7;
    reg  [3:0] h0, h1, h2, h3, h4, h5, h6, h7;
    wire [3:0] y0, y1, y2, y3, y4, y5, y6, y7,
               y8, y9, y10, y11, y12, y13, y14, y15;

    convolution uut (
        x0, x1, x2, x3, x4, x5, x6, x7,
        h0, h1, h2, h3, h4, h5, h6, h7,
        y0, y1, y2, y3, y4, y5, y6, y7,
        y8, y9, y10, y11, y12, y13, y14, y15
    );

    initial begin
        $dumpfile("convolution_all.vcd");
        $dumpvars(0, tb_convolution_all);
    end

    initial begin
        // -------- Test 1: Basic --------
        $display("Test 1: Basic Increasing x, uniform h");
        x0=1; x1=2; x2=3; x3=4; x4=0; x5=0; x6=0; x7=0;
        h0=1; h1=1; h2=1; h3=1; h4=0; h5=0; h6=0; h7=0;
        #20;

        // -------- Test 2: Impulse --------
        $display("Test 2: Impulse x");
        x0=1; x1=0; x2=0; x3=0; x4=0; x5=0; x6=0; x7=0;
        h0=1; h1=2; h2=3; h3=4; h4=0; h5=0; h6=0; h7=0;
        #20;

        // -------- Test 3: Max Edge --------
        $display("Test 3: Max input values");
        x0=15; x1=15; x2=15; x3=15; x4=15; x5=15; x6=15; x7=15;
        h0=15; h1=15; h2=15; h3=15; h4=15; h5=15; h6=15; h7=15;
        #20;

        $display("Simulation complete");
        $finish;
    end

endmodule

