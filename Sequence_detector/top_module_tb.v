`timescale 1ns / 1ps

module top_module_tb();

localparam T =20;

reg clk; //clock signal
reg rst; //reset signal
reg sh_en; //shifting enabled signal for LFSR
wire out; // output for sequence detector
wire max_tick; // indicated when lfsr cycle is over 
wire [21:0] Q_out;// output from lfsr, input for sequence detector
wire [21:0]  count;

////////////////////////////////////////////////////////////////////////////////
//Insantiating top module
top_module uut (.clk(clk), .rst(rst), .sh_en(sh_en), .serial_out(out), .max_tick(max_tick), .q(Q_out), .counter(count));

//////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////
//reset signal
initial
begin
    clk=1'b0;
    rst = 1'b1;
    sh_en=0;
    #(T*10);
    rst = 1'b0;
    sh_en=1'b1;
end
////////////////////////////////////////////////////


initial
begin
    forever #(T/2) clk = ~clk;
end

endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////
