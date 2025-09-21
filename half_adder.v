module half_adder(
    input in_a,
    input in_b,
    output reg sum,
    output reg carry
);

assign sum = a ^ b;
assign carry = a & b;

endmodule
