Main Module: universal_shift_8bit
The universal_shift_8bit module is an 8-bit shift register that performs multiple operations based on the 2-bit control input s. This module takes an 8-bit input a and shifts its bits either to the left or right, or it can hold the input or load it in parallel, depending on the control signals.

Inputs:
a (8 bits): The data to be shifted or loaded.
s (2 bits): The control signal that determines the operation to be performed:
2'b00: Shift the input a to the left, filling the least significant bit (LSB) with 0.
2'b01: Hold the current value of a (no shift).
2'b10: Shift the input a to the right, filling the most significant bit (MSB) with 0.
2'b11: Load the input a directly into the output.
Output:
p (8 bits): The result of the operation based on the value of s.
The module uses a simple assign statement to select the operation based on the value of the control signal s.

Test Bench: tb_universal_shift_8bit
The test bench for the universal_shift_8bit module simulates and verifies its behavior by applying different inputs to the control signal s and checking how the module's output p responds.

Purpose:
The test bench initializes the inputs and applies a series of test cases to verify if the universal_shift_8bit module performs the correct operation for each value of s.
Test Flow:
A specific test pattern (8-bit binary values) is applied to the input a.
Different control signals s are applied in sequence:
First, the module shifts the input left.
Then, it holds the current value (no shift).
Next, it shifts the input right.
Lastly, it performs a parallel load of the input.
The results are displayed using the $monitor statement, which prints the values of a, s, and p at every change in the simulation.
Expected Operations:
With s = 2'b00, the input a is shifted left.
With s = 2'b01, the value is held without change.
With s = 2'b10, the input is shifted right.
With s = 2'b11, the input a is loaded directly to the output p.
This test bench ensures that the module works correctly for all possible values of s and generates the appropriate output for each operation.






