`timescale 1ns / 1ps
module tb_half_adder;

  // Inputs
  reg  in_a;
  reg  in_b;

  // Outputs
  wire sum;
  wire carry;

  // Instantiation

  half_adder ha (
      .in_a (in_a),
      .in_b (in_b),
      .sum  (sum),
      .carry(carry)
  );

  // Clock signal ==> none

  // Testbench
  initial begin
    $dumpfile("wave_half_adder.vcd");
    $dumpvars(0, tb_half_adder);

    $monitor("TIME: %d | in_a = %b | in_b = %b | sum = %b | carry = %b", $time, in_a, in_b, sum,
             carry);

    in_a = 1'b0;
    in_b = 1'b0;

    #5 in_a = 1'b0;
    in_b = 1'b1;


    #10 in_a = 1'b1;
    in_b = 1'b0;

    #10 in_a = 1'b1;
    in_b = 1'b1;

    #5 $finish;
  end
endmodule
