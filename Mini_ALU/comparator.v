`timescale 1ns / 1ps

// 1 bit comparator 
//Outputs high when a is less than b 

module comparator(
  
    input i1, //input 1
    input i2, //input 2
    output less_than //output 
    );
    
    assign less_than = ~i1 & i2;
 
endmodule

//////////////////////////////////////////////////////////