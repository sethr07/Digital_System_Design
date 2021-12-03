`timescale 1ns / 1ps
//////////////////////////
//Alu
//Top level module

module Alu_top(
       
      input [5:0] A, //input 1
      input [5:0] B, //input 2
      input [2:0] fxn, //function selection
      output reg [5:0] X //output 
     );
   
   //Internal wire declarations 
   //Stores output from each Instantiation and then is stored in output X
 
    wire [5:0] outA; //for fxn 000 
    wire [5:0] outB; //for fxn 001
    wire [5:0] negA; //for fxn 010
    wire [5:0] negB; //for fxn 011
    wire [5:0] alb; //for fxn 100
    wire [5:0] xnor1; //for fxn 101
    wire [5:0] add; // for fxn 110
    wire [5:0] sub; //for fxn 111
    wire ov_flow; //overflow - not implemented in tb
    wire cr_out; //carry/borrow - not implemented in tb
    
     /////////////////////////////////////////////////////////////////////////////////////////////////
     /////////////////////////////////////////////////////////////////////////////////////////////////
   
   
    //Instantiating all sub modules 
    /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 000, X = A
    ripple_carry_adder outputA (.x(A), .y(6'b00), .sel(1'b0), .sum(outA)); // X = A
    /////////////////////////////////////////////////////////////////////////////////////////////////
     
    //Instantiating for fxn = 001, X = B
    ripple_carry_adder outputB (.x(6'b00), .y(B), .sel(1'b0), .sum(outB)); // X = B
    /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 010, X = -A
    negativeAB negativeA (.a(A), .s(negA)); // X = - A
    /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 011, X = -B
    negativeAB negativeB (.a(B), .s(negB)); // X = - B
     /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 100, X = A < B
    comparator_6bit comparasion (.in1(A), .in2(B), .y(alb));
     /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 101, X = A nxor B
    bitwise_xnor bitxnor (.a(A), .b(B), .y(xnor1)); //bitwise nxor
     /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 110, X = A + B
    ripple_carry_adder addition (.x(A), .y(B), .sel(1'b0), .overflow(ov_flow), .c_out(cr_out), .sum(add)); //addition - sel = 0
     /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //Instantiating for fxn = 110, X = A - B

    ripple_carry_adder subtraction (.x(A), .y(B), .sel(1'b1), .overflow(ov_flow), .c_out(cr_out), .sum(sub));  //subtraction - sel = 1
    
       ////////////////////////////////////////////////////////////////////////////////////////////////
       /////////////////////////////////////////////////////////////////////////////////////////////////
    
    always @(*)
    begin
        case(fxn)
        
        //fxn 000
        //X=A
        3'b000: 
        X = outA;
        
        //fxn 001
        //X=B
        3'b001:
        X = outB;
        
         //fxn 010
        //X=-A
        3'b010:
        X = negA;
        
        //fxn 011
        //X=-B
        3'b011:
        X = negB;
        
        //fxn 100
        3'b100:
        X = alb;
        
         //fxn 101
        //A nxor B
        3'b101:
        X = xnor1;
        
        //fxn 100
        //x=A+B
        3'b110:
        X = add;
        
        //fxn 111
        //X=A-B
        3'b111:
        X = sub;
 
       endcase
       end
   
endmodule

   ////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
