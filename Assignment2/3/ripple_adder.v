`timescale 1ns / 1ps

module nand2(input a, b, output y);
    assign #1 y = ~(a & b);
endmodule

module not_nand(input a, output y);
    nand2 n1(a, a, y);
endmodule

module and_nand(input a, b, output y);
    wire t;
    nand2 n1(a, b, t);
    nand2 n2(t, t, y);
endmodule

module or_nand(input a, b, output y);
    wire na, nb;
    not_nand n1(a, na);
    not_nand n2(b, nb);
    nand2 n3(na, nb, y);
endmodule

module xor_nand(input a, b, output y);
    wire t1, t2, t3;
    nand2 n1(a, b, t1);
    nand2 n2(a, t1, t2);
    nand2 n3(b, t1, t3);
    nand2 n4(t2, t3, y);
endmodule

module full_adder_nand(input a, b, cin, output sum, cout);
    wire axb, ab, bc, ac, t;

    xor_nand x1(a, b, axb);
    xor_nand x2(axb, cin, sum);

    and_nand a1(a, b, ab);
    and_nand a2(b, cin, bc);
    and_nand a3(a, cin, ac);

    or_nand o1(ab, bc, t);
    or_nand o2(t, ac, cout);
endmodule

module ripple_carry_adder_4bit(
    input  [3:0] A, B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire c1, c2, c3;

    full_adder_nand fa0(A[0], B[0], Cin,  Sum[0], c1);
    full_adder_nand fa1(A[1], B[1], c1,   Sum[1], c2);
    full_adder_nand fa2(A[2], B[2], c2,   Sum[2], c3);
    full_adder_nand fa3(A[3], B[3], c3,   Sum[3], Cout);
endmodule

