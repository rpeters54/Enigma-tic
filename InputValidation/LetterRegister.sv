`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 09:57:40 PM
// Design Name: 
// Module Name: LetterRegister
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


module LetterRegister(
    input [4:0] LET,
    input LD,
    output logic [4:0] outLET = 0,
    output logic ON = 0
    );
    
    //Stores current letter to be encrypted
    //ON is a latch that keeps the encrypted output off 
    //until the first character has been input
    always_ff @ (posedge LD) 
    begin
        outLET <= LET;
        ON <= 1;
    end
endmodule
