module adder_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input        Cin,
    output [7:0] Sum,
    output       Cout
);

    wire [7:0] carry;  // Internal carry wires
    wire [7:0] sum;    // Internal sum wires

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : full_adder_loop
            if (i == 0) begin
                full_adder FA (
                    .a    (A[i]),
                    .b    (B[i]),
                    .cin  (Cin),
                    .sum  (sum[i]),
                    .cout (carry[i])
                );
            end else begin
                full_adder FA (
                    .a    (A[i]),
                    .b    (B[i]),
                    .cin  (carry[i-1]),
                    .sum  (sum[i]),
                    .cout (carry[i])
                );
            end
        end
    endgenerate

    assign Sum  = sum;
    assign Cout = carry[7];

endmodule

