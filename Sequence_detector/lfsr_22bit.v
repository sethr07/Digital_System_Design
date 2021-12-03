//Module - LFSR
//Feedback - xnor 
//Tap Length = 22
//Seed value - bitwise xnor of last 2 duguts of board number and student id
////////////////////////////////////////////////////////////////////////////////

// Board Number = 9 -> hex = 0009
// Student number = 57 -> hex = 39
// Seed = student number ^~ board number = F
///////////////////////////////////////////////////////////////////////////////

//For my 22 bit lfsr 
//Maximal Length = 2^N - 1 = 2^22 - 1 = 4194303
//So lfsr should start procuding same pattern again after 4194303
//Hence, psedo-random numbers
/////////////////////////////////////////////////////////////////////////////////

module	lfsr_22bit (

 input clk,	//clock 
 input sh_en, //shifting enabled
 input rst_n,	//reset 
 output [21:0] Q_out, //output
 output reg max_tick_reg //1 bit register -> goes high when lfsr reaches 2^N-1
 );		

reg [21:0] Q_state;	//current state
wire [21:0] Q_ns; //next state
wire Q_fb; //feedback

localparam seed = 16'hF; // local paramater for seed
//localparam seed = 16'h0; //forbidden value

//Asynchronous active high reset
always @ (posedge clk) begin	

    //shifting 
    if (rst_n) 
	   Q_state	<=	seed;
	   //max_tick_reg = 1'b0;
	else if	(sh_en)
	   Q_state	<=	Q_ns;

end	

//logic for max tick reg
//if next value is equal to seed va;ue that means the cycle has been completed
always @ (posedge clk) begin
    
    if(Q_ns == seed)
        max_tick_reg = 1'b1;
    else
        max_tick_reg = 1'b0;
 end
    
					
//next	state	logic
//Using Xnor
//Tap info from Xillinix document 
assign	Q_fb	=	(Q_state[21] ^~	Q_state[20]);	
assign Q_ns = {Q_state[20:0],Q_fb};
//output	logic
assign	Q_out	=	Q_state;	

endmodule

///////////////////////////////////////////////////////////