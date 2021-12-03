`timescale 1ns / 1ns
//// Test Bench for Sequene detector FSM ////////
///////////////////////////////////////////////
module sequence_detector_tb();
/////////////////////////////////////////////////////////////////////
reg clk; //clock signal
reg rst; //reset signal
reg  in; //input for seq det
wire out; //output for seq det
////////////////////////////////////////////////////////////////////
//insantiating sequence detector //
seq_det uut (.clk(clk), .rst(rst), .serial_in(in), .serial_out(out));
/////////////////////////////////////////////////////////////////////

//initialising input siganls
initial
begin
    clk = 1'b0;
    rst = 1;
    #20;
    rst =0;
 //////////////////////////// 
 //Serial Inputs//
    #20in = 0;
    #20in = 1;
    #20in = 0;
    #20in = 1;
    #20in = 1;
    #20in = 0; //pattern detected, out = 1, after 140 ns (approx)

    #20in = 0;
    #20in = 1;
    #20in = 0;
    #20in = 0;
    #20in = 1;
    #20in = 0; // no pattern 
    
     #20in = 0;
     #20in = 1;
     #20in = 0;
     #20in = 1;
     #20in = 1;
     #20in = 0; //pattern detecte
  
    #20in = 0;
    #20in = 1;
    #20in = 0;
    #20in = 1;
    #20in = 1;
    #20in = 0; // pattern at 390
 end
 //////////////////////////////////////////////////////////////////////////
 //defining clock signal
 initial
 begin
 forever #10 clk = ~clk;
 #100;
 end
 ////////////////////////////////////////////////////////////
endmodule // end of test bench for fsm
////////////////////////////////////////////////////////////