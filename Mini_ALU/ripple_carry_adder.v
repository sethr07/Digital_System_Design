`timescale 1ns / 1ps

module ripple_carry_adder(
    input [5:0] x,  // 6 bit input
    input [5:0]y,  // 6 bit input
    input sel,     // functionality - add/subtract
    output overflow, // 1 bit Overflow in sum output
    output c_out,       //1 bit MSB carry out from sum
    output [5:0] sum    // 6 bit sum of inputs x and y
    );
    
    //if y xor 0 = y
    // y xor 1 = not(y)
    //if sel = 1 = x + (not y) == subtraction
    // therefore, if sel==0 -> add and if sel==1 -> sub
    
    wire c0; //carry out for a0
    wire c1; //carry out for a1
    wire c2; //carry out for a2
    wire c3; //carry out for a3
    wire c4; //carry out for a4
    wire c5; //carry out for a5
    
    wire in0; // xor of y[0] and sel
    wire in1; // xor of y[1] and sel
    wire in2; //xor of y[2] and sel
    wire in3; //xor of y[3] and sel
    wire in4; //xor of y[4] and sel
    wire in5; //xor of y[5] and sel
     
     //xor of sel and y for inverting the number when sel == 1, subtractirion
     
     xor(in0, y[0], sel); 
     xor(in1, y[1], sel);
     xor(in2, y[2], sel);
     xor(in3, y[3], sel);
     xor(in4, y[4], sel);
     xor(in5, y[5], sel);
     
     xor(c_out, c5, sel);  // carry / borrow
     xor(overflow, c5, c4); // c5 != c4, we have overflow
     
    //Instantiating full adders for each bit 
    FullAdder a0(x[0], in0, sel, sum[0], c0);
    FullAdder a1(x[1], in1, c0,  sum[1], c1);
    FullAdder a2(x[2], in2, c1,  sum[2], c2);
    FullAdder a3(x[3], in3, c2,  sum[3], c3);
    FullAdder a4(x[4], in4, c3,  sum[4], c4);
    FullAdder a5(x[5], in5, c4,  sum[5], c5);     
   
   endmodule 
 
 /////////////////////////////////////////////////////////   