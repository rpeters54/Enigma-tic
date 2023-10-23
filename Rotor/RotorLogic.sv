`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/23/2021 10:30:04 AM
// Design Name: 
// Module Name: RotorLogic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Based on the current position of the rotors, this section will send
//              the input through a series of filters that will change its value
//              This action is reversible, meaning with the same rotor position
//              a letter's encrypted character would return the original letter.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RotorLogic(
    input [4:0] LET,
    input [4:0] R1, R2, R3,
    output logic [4:0] outLET
    );
    
    logic [25:0]DECtoA, AtoB, BtoC, CtoREF, REFtoC, CtoB, BtoA, AtoDEC;
    
    //turns the letter into a 26 bit decoded input to make rotor encryption possible
    RotorDecoder decode (.LET(LET), .DEC(DECtoA));
    
    //Based on the position of the rotor, each will change the value of the input signal
    //Since the input is reflected back through the rotors in reverse, its path creates a loop
    //This feature allows for decoding
    RotorA rotA (.POS(R1), .D(DECtoA), .OUT(AtoB), .Dinv(BtoA), .OUTinv(AtoDEC));
    RotorB rotB (.POS(R2), .D(AtoB), .OUT(BtoC), .Dinv(CtoB), .OUTinv(BtoA));
    RotorC rotC (.POS(R3), .D(BtoC), .OUT(CtoREF), .Dinv(REFtoC), .OUTinv(CtoB));
    
    Reflector reflect (.D(CtoREF), .OUT(REFtoC));
    
    //returns the letter to a 5 bit input so that it can pass through the plugboard again
    LetterEncoder encode (.DEC(AtoDEC), .LET(outLET));
    
endmodule
