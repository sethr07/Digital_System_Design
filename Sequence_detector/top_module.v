/*
Top module
Integrating Sequence detector, LFSR and counter
LFSR -> generating random nos
Sequence detector -> inputting random nos from LFSR into sequence detector. Searches for codeword 010110
Counter -> counts how many time code word present in one lfsr cycle
Code Word -> 010110
*/
/////////////////////////////////////////
module top_module(
    
    input clk, //clock signal
    input rst, //reset signal
    input sh_en, //shifting enabled for lfsr
    output max_tick,//indicated when 1 lfsr cycle has been completed 
    output [21:0] q, //output for lfsr
    output serial_out, //output for seq det
    output [21:0] counter
 );

        
        lfsr_22bit LFSR (.clk(clk), .sh_en(sh_en), .rst_n(rst), .Q_out(q), .max_tick_reg(max_tick)); 
        seq_det SEQ (.clk(clk), .rst(rst), .serial_in(q[21]),.serial_out(serial_out)); 
        count_seq C1 (.clk(clk), .reset(rst), .MSB(serial_out), .count(counter));
        
  
                 
endmodule
/////////////////////////////////////////////////////////
