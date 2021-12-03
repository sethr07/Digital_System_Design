`timescale 1ns / 1ps

module Alu_top_tb();
    
    reg [5:0] test_A;
    reg [5:0] test_B;
    reg [2:0] fxn;
    wire [5:0] test_X;
   

////////////////////////////////////////////////////////////////////////////////////////////////
////Instantiating top level alu file

    Alu_top uut (.A(test_A), .B(test_B), .fxn(fxn), .X(test_X));
        
        ////////////////////////////////////////////////////////////////////////////////////////////////
        
        initial
        begin
        
        $display("test_A     test_B      fxn         test_X  ");
        $monitor(" %b        %b        %b          %b ", test_A, test_B, fxn,test_X);
   
       ////////////////////////////////////////////////////////////////////////////////////////////////
   
        //Test Vectors Start
        //for each fxn minimum of 4 test vectors
      
        //Fxn = 000
      
        //Test Vectror 1 
        test_A = 6'b00_0001; // 1
        test_B = 6'b00_0000; // 0
        fxn = 3'b000; // x = 1
        #20;
        //Test Vector 2
        test_A = 6'b10_0000; // -32
        test_B = 6'b00_0000; // 0
        fxn = 3'b000; // x = -32
        #20;
        //Test vector 3
        test_A = 6'b00_0100; //4
        test_B = 6'b10_0000; // -32
        fxn = 3'b000; //x = 4
        #20;
        //Test Vector 4
        test_A = 6'b00_0000; // 0
        test_B = 6'b00_0010; // 2
        fxn = 3'b000; //x = 0
        #20; 
       
        // End of test vector for fxn = 000 //
        ///////////////////////////////////
        
        //Fxn = 001
        
        //Test Vector 5
        test_A = 6'b00_0000; // 0 
        test_B = 6'b00_0001; // 1
        fxn = 3'b001; // x = 1
        #20;
        //Test Vector 6
        test_A = 6'b00_0001; // 1
        test_B = 6'b00_1111; //15
        fxn = 3'b001; // x = 15
        #20;
        //Test Vector 7
        test_A = 6'b00_0000; // 0
        test_B = 6'b10_0001; //-31
        fxn = 3'b001; // x = -31
        #20;
        //Test Vector 8
        test_A = 6'b00_0011; // 3
        test_B = 6'b00_0000; // 0
        fxn = 3'b001; // x = 0
        #20;

        // End of test vectors for fxn = 001 //
        //////////////////////////////////////
        
        //Fxn = 010 
        //x = -a
       
        //Test Vector 9
         test_A = 6'b00_0011; //3
         test_B = 6'b00_0000; //0
         fxn = 3'b010;
         #20;  
         //Test Vector 10
         test_A = 6'b10_0010; //
         test_B = 6'b00_0001; //1
         fxn = 3'b010;
         #20;
         //Test vector 11
         test_A = 6'b00_0000; //0
         test_B = 6'b10_0100; //8
         fxn = 3'b010;
         #20;
         //Test Vector 12
         test_A = 6'b00_1011;
         test_B = 6'b00_0100;
         fxn = 3'b010;
         #20;

         //End of test vectors for fxn = 010//
         ////////////////////////////////
         
        //Fxn = 011
        //X = -B
        
        //Test vector 13
        test_A = 6'b00_0000; // 0
        test_B = 6'b00_0110; // 6
        fxn = 3'b011; //x=-6
        #20;
        //Test Vector 14
        test_A = 6'b00_0001; // 1
        test_B = 6'b00_0010; //2
        fxn = 3'b011; //x=-2
        #20;
        //Test Vector 15
        test_A = 6'b00_0000; //0
        test_B = 6'b10_0011; //-29 
        fxn = 3'b011; //x=29
        #20;
        //Test Vector 16
        test_A = 6'b10_0011; //-29
        test_B = 6'b00_0001; //1
        fxn = 3'b011; //x=1
        #20; 
      
        //End of test vectors for fxn = 011//
       ///////////////////////////////////

        //fxn = 100 
        // X = A<B =1
        
        //Test vector 17
        test_A = 6'b00_0001;
        test_B = 6'b00_0000;
        fxn = 3'b100;
        #20;
        //Test Vector 18
        test_A = 6'b00_0000;
        test_B = 6'b00_0001;
        fxn = 3'b100;
        #20;
        //Test Vector 19
        test_A = 6'b00_0001;
        test_B = 6'b00_0001;
        fxn = 3'b100;
        #20;
        //Test Vector 20
        test_A = 6'b10_0101;
        test_B = 6'b00_1111;
        fxn = 3'b100;
        #20;
        //Test Vector 21
        test_A = 6'b10_0100;
        test_B = 6'b10_1100;
        fxn = 3'b100;
        #20; 

        //End of test vectors for fxn = 100//
        ///////////////////////////////////
        
       //fxn = 101 
        //X = A nxor B

        //Test vector 22
        test_A = 6'b00_0000; //0
        test_B = 6'b00_0000; //0
        fxn = 3'b101; 
        #20;
        //Test vector 23
        test_A = 6'b00_0011;
        test_B = 6'b00_0001;
        fxn = 3'b101;
        #20;
        //Test Vector 24
        test_A = 6'b10_1100;
        test_B = 6'b00_0001;
        fxn = 3'b101;
        #20;
        //Test Vector 25
        test_A = 6'b10_1100;
        test_B = 6'b11_0001;
        fxn = 3'b101;
        #20;
     
        // End of Test vectors for fxn = 101//
        //////////////////////////////////////

        //fxn = 110
        // x = a+b
        
        //Test vector 26
        test_A = 6'b00_0000; // 0
        test_B = 6'b00_0110; // 6
        fxn = 3'b110; // x = 6
        #20;
        //Test vector 27
        test_A = 6'b00_0001; // 1
        test_B = 6'b00_0011; // 3
        fxn = 3'b110; //x=4
        #20;
       //Test Vector 28
         test_A = 6'b00_0011;
         test_B = 6'b10_0011;
         fxn = 3'b110;
          #20;
        //Test vector 29
        test_A = 6'b10_1111; 
        test_B = 6'b10_1100;
        fxn = 3'b110;
        #20;
        //Test vector 30
        test_A = 6'b00_0000; //0
        test_B = 6'b00_0000;//0
        fxn = 3'b110; // x =0
        #20;
        //Test Vector 31
        test_A = 6'b10_1100;
        test_B = 6'b00_0100;
        fxn = 3'b110;
        #20;
        
    
        
        //End of test vectors for fxn = 110 //
        ///////////////////////////////////////
        
        //fxn = 111
        //x = a -b
        
        //Test vector 32
        test_A = 6'b00_0000; // 0
        test_B = 6'b00_0110; // 6
        fxn = 3'b111; // x = -6
        #20;
        //Test vector 33
        test_A = 6'b00_0001; // 1
        test_B = 6'b00_0011; // 3
        fxn = 3'b111; //x=-2
        #20;
        //Test vector 34
        test_A = 6'b10_1111; 
        test_B = 6'b10_1100;
        fxn = 3'b111;
        #20;
        //Test vector 35
        test_A = 6'b00_0000; //0
        test_B = 6'b00_0000;//0
        fxn = 3'b111; // x =0
        #20;
        //Test Vector 36
        test_A = 6'b10_1100;
        test_B = 6'b00_0100;
        fxn = 3'b111;
        #20;
        
        //End of fxn = 111//
        //////////////////////////////////////
       
        //End of Test Vectors//
         ////////////////////////////////////////////////////////////////////////////////////////////////
       
       $stop;
      end
endmodule
   ////////////////////////////////////////////////////////////////////////////////////////////////