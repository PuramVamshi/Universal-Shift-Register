module universal_shift_8bit(a, s, p);
  input [7:0] a;
  input [1:0] s;
  output [7:0] p;
  
  assign p = (s == 2'b00) ? {a[6:0], 1'b0} :  // Shift left
             (s == 2'b01) ? a :               // Hold
             (s == 2'b10) ? {1'b0, a[7:1]} :  // Shift right
             a;                               // Parallel load
endmodule
