`timescale 1ns / 1ps
module tb_half_adder;

  // Inputs
  reg  in_a;
  reg  in_b;

  // Outputs
  wire sum;
  wire carry;

  // Parameters for self_checking
  reg  temp_sum;
  reg  temp_carry;

  // Instantiation

  half_adder ha (
      .in_a (in_a),
      .in_b (in_b),
      .sum  (sum),
      .carry(carry)
  );

  // Clock signal ==> none

  // Define task

  task generate_random_value;

    reg temp_a;
    reg temp_b;

    begin
      temp_a = $random;
      temp_b = $random;

      in_a = temp_a;
      in_b = temp_b;

      temp_sum = temp_a ^ temp_b;
      temp_carry = temp_a & temp_b;

      #3;
    end
  endtask


  // Testbench
  initial begin
    $dumpfile("wave_half_adder.vcd");
    $dumpvars(0, tb_half_adder);

    //$monitor("TIME: %d | in_a = %b | in_b = %b | sum = %b | carry = %b", $time, in_a, in_b, sum,
    //        carry);

    repeat (8) begin
      generate_random_value();
      $display("in_a = %b | in_b = %b | sum = %b | carry = %b", in_a,
               in_b, sum, carry);
      if (temp_sum == sum) begin
        $display("TEST PASSED");

      end else $display("TEST FAILED");
    end
  end
endmodule
