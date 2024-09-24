module universal_shift_8bit(a, s, p);
  input [7:0] a;
  input [1:0] s;
  output [7:0] p;
  
  assign p = (s == 2'b00) ? {a[6:0], 1'b0} :  // Shift left
             (s == 2'b01) ? a :               // Hold
             (s == 2'b10) ? {1'b0, a[7:1]} :  // Shift right
             a;                               // Parallel load
endmodule

`timescale 1ns / 1ps

module tb_universal_shift_8bit;

// Declare inputs as regs and outputs as wires
reg [7:0] a;
reg [1:0] s;
wire [7:0] p;

// Instantiate the unit under test (UUT)
universal_shift_8bit uut (
    .a(a), 
    .s(s), 
    .p(p)
);

initial begin
    // Initialize inputs
    a = 8'b10101010;   // Test pattern
    s = 2'b00;         // Initial condition: Shift left

    // Display output at each change
    $monitor("Time: %0t | a = %b | s = %b | p = %b", $time, a, s, p);

    // Test for shift left
    #10; s = 2'b00; a = 8'b11011010;  // Shift left
    #10; s = 2'b01;                   // Hold value
    #10; s = 2'b10;                   // Shift right
    #10; s = 2'b11; a = 8'b11110000;  // Parallel load (p = a)
    #10; s = 2'b00;                   // Shift left again
    #10; s = 2'b01;                   // Hold value
    #10; s = 2'b10;                   // Shift right

    // Finish the simulation
    #10 $finish;
end

endmodule
