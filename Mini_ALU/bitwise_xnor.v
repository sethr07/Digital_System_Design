`timescale 1ns / 1ps

// 6 bit bitwise xnor operation

module bitwise_xnor(
   
    input [5:0] a,
    input [5:0] b, 
    output [5:0] y
    );

    assign y = a ~^b;
   
endmodule

/////////////////////////////////////