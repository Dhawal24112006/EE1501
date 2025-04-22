`timescale 1ns / 1ps

module tb_ripple_adder;

    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    ripple_carry_adder_4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        $dumpfile("ripple_adder.vcd");
        $dumpvars(0, tb_ripple_adder);

        // Test 1: 15 + 15 + 1 = 31 (Overflow)
        A = 4'b1111; B = 4'b1111; Cin = 1; #100;

        // Test 2: 1 + 2 = 3
        A = 4'b0001; B = 4'b0010; Cin = 0; #100;

        // Test 3: Alternating bits with Cin
        A = 4'b1010; B = 4'b0101; Cin = 1; #100;

        // Test 4: All zeros
        A = 4'b0000; B = 4'b0000; Cin = 0; #100;

        // Test 5: Random mix
        A = 4'b1001; B = 4'b0110; Cin = 1; #100;

        $finish;
    end
endmodule

