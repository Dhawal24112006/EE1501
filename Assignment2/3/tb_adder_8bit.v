`timescale 1ns / 1ps

module tb_adder_8bit;

    reg  [7:0] A, B;
    reg        Cin;
    wire [7:0] Sum;
    wire       Cout;

    adder_8bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("adder_8bit.vcd");
        $dumpvars(0, tb_adder_8bit);

        // Test 1: Basic Addition
        A = 8'b00001111; B = 8'b00000001; Cin = 0; #10;

        // Test 2: With Carry-in
        A = 8'b11110000; B = 8'b00001111; Cin = 1; #10;

        // Test 3: Max values
        A = 8'b11111111; B = 8'b11111111; Cin = 0; #10;

        // Test 4: Random pattern
        A = 8'b10101010; B = 8'b01010101; Cin = 0; #10;

        $display("Simulation complete.");
        $finish;
    end
endmodule

