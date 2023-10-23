`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 08:17:27 PM
// Design Name: 
// Module Name: PlugCompare
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PlugCompare(
    input [4:0] LET,
    input [9:0] F,
    input active,
    output logic [4:0] outLET
    );
    
    logic EQ1, EQ2;
    logic [4:0] muxOut1, muxOut2;
    
    //Compares the input to the two letters contained within the plugboard pair
    Comparator #(5) comp1 (.A(LET), .B(F[4:0]), .EQ(EQ1));
    Comparator #(5) comp2 (.A(LET), .B(F[9:5]), .EQ(EQ2));
    
    //if the pair is not active, output the letter
    //if the pair is active and the input matches one of the pair
    //replace the input with the other character in the pair
    MUX2_1 #(5) mux1 (.ZERO(LET), .ONE(F[9:5]), .SEL(EQ1), .F(muxOut1));
    MUX2_1 #(5) mux2 (.ZERO(muxOut1), .ONE(F[4:0]), .SEL(EQ2), .F(muxOut2));   
    MUX2_1 #(5) mux3 (.ZERO(LET), .ONE(muxOut2), .SEL(active), .F(outLET));   
    
endmodule
