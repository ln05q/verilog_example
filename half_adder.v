module half_adder(
    input in_a,
    input in_b,
    output sum,
    output carry
);

assign sum = in_a ^ in_b;
assign carry = in_a & in_b;

endmodule
