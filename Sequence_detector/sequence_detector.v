//////////////////////////////////////////////////////////////////////////////////
/*
            FSM Module
          Sequence Detector
          Codeword - 010110
             6 bit number
*/
//////////////////////////////////////////////////////////////////////////////////
module seq_det(
    input clk, //clcok signal
    input rst, //resetsignal
    input serial_in,//input data
    output reg serial_out //output when codeword detected 
   );
///////////////////////////////////////////////////////   

//Internal Signals  
 
 reg[2:0] cs; //current state
 
 /// Declaring States for FSM ///
 /// 6 states ///
 parameter s0 = 3'b000; //Idle state
 parameter s1 = 3'b001;
 parameter s2 = 3'b010;
 parameter s3 = 3'b011;
 parameter s4 = 3'b100;
 parameter s5 = 3'b101; //Final State -> Pattern Detected
///////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////


always @ (posedge clk, posedge rst) 
    if(rst) 
        cs <= s0;
    else
        case (cs) 
    ///////////////////////////
    // If serial in == 0, move to next state 
    // else stay in s0
            s0: case(serial_in) 
                1'b0: begin
                    cs <= s1;
                    serial_out <= 0;
                end   
                1'b1: begin
                    cs <= s0;
                    serial_out <= 0;
                end
                default: cs <= s0;
         endcase
 ////////////////////////////////////////// 
  // if serial in == 1, move to next state
  // else state in s1
            s1: case(serial_in)
                1'b0: begin
                    cs <= s1;
                    serial_out <= 0;
              end
                1'b1: begin
                    cs <= s2;
                    serial_out <= 0;
              end
                default: cs <= s0;
         endcase
     ///////////////////////////////////////////////
     // if serial in == 0, move to next state
     // else move to s0
     s2: case(serial_in)
        1'b0: begin
            cs <= s3;
            serial_out <= 0;
           end
        1'b1: begin
            cs <= s0;
            serial_out <= 0;
         end
        default: cs <= s0;
       endcase
       
    //////////////////////////////////////////////////
    //if serial_in == 1, move to next state
    //else serial_in==0 move to s1
    s3: case(serial_in)
        1'b0: begin
            cs <= s1;
            serial_out <= 0;
        end
        1'b1: begin
            cs <= s4;
            serial_out <=0;
       end
       default: cs <= s0;
    endcase
    /////////////////////////////////////////////////
    // if serial_in == 1, .pve to next state,
    // else serial_in == 0, move to s3
    s4: case(serial_in)
        1'b0: begin
            cs <= s3;
            serial_out <= 0;
         end
        1'b1: begin
            cs <= s5;
            serial_out <= 0;
        end
      default: cs <= s0;
   endcase
   
   //////////////////////////////////////
   //if serial_in== 0 -> pattern detected, output 1, move to s0, restart cycle
   // else move to s0
   s5: case(serial_in)
    1'b0: begin
        cs <= s1;
        serial_out <= 1'b1;
     end
    1'b1: begin
        cs <= s0;
        serial_out <= 0;
    end
    default: cs <= s0;
   endcase
   
   /////////////////////////////////////////
   default: cs <= s0;
endcase   
/////////////////////////////////////////// 
endmodule //End of FSM SEQ DET
/////////////////////////////////////////////////////////////////////