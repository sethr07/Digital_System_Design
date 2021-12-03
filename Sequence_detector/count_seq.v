/// Counter Module for FSM ///
// 22 bit counter 
// if MSB == 1
// count increments
// else count stays same
// if rst == 1 -> count = 0
// if lfsr cycle compelted, count -> restarts 
//////////////////////////////////////////////////
module count_seq(
    input clk, reset,
    input MSB,
    output reg [21:0] count
 );
 
////////////////////////////////////// 
 always @ (posedge clk)
 begin
 
    if(reset)
    count <= 21'b000000;
 else if (MSB)
    count <= count + 1;
 else if (!MSB)
    count <= count;
 end
 
 ///////////////////////////////////////////////////
 endmodule
//////////////////////////////////////////////////// 
 