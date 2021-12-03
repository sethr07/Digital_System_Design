`timescale 1ns / 1ps

// binary numbers in 2's compliment form to represent negative numbers
// Step 1: imver all bits of input
// Step 2: Add 1 to lsb
// Output = negative number

module negativeAB(
        input [5:0] a,
        output [5:0] s
    );
    
    wire [5:0] invert; 
  
    assign invert = ~a; //inverting all bits of input 
    ripple_carry_adder i0(.x(invert), .y(6'b00_0001), .sel(1'b0), .sum(s)); //adding 1 to inverted number using ripple carry adder
    
    endmodule
    