// METHOD 1
/*
module half_adder(
    input in_a,
    input in_b,
    output sum,
    output carry
);

assign sum = in_a ^ in_b;
assign carry = in_a & in_b;

endmodule
*/

// METHOD 2

module half_adder (
    input  in_a,
    input  in_b,
    output reg sum,
    output reg carry
);

  always @(*) {carry, sum} = in_a + in_b;

endmodule
