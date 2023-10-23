`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/23/2021 10:49:42 AM
// Design Name: 
// Module Name: Enigma
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Based on the design of the Enigma M3. Encrypts a message character
//              by character through a series of letter swaps, filters, and bitshifts.
//              For full detail, see the user manual.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Enigma(
    input [4:0] LET = 0,
    input ENTER = 0, 
    input LDRot = 0, 
    input LDPlug = 0, 
    input CLK = 0,
    input [1:0] RotSEL = 0, 
    input [1:0] PlugSEL = 0,
    output logic [7:0] seg,
    output logic [3:0] an, led
    );
    
    logic enter, enableRotor, enablePlug, on, hclock, qclock;
    logic [4:0] rPos1, rPos2, rPos3, regLET, plugLET, rotLET, plugLETinv, segLET;
    //LET path: Enter -> Plugboard -> Rotors -> Reflector -> InverseRotors -> InversePlugboard -> Output
    
    //divides the clock input for use in the display
    ClkDiv2 halfclock (.CLK(CLK), .SCLK(hclock));
    
    //divides the clock to drive the debouncer
    ClkDiv2 #(25000) quartclock (.CLK(CLK), .SCLK(qclock));
    
    //ensures that the value of the switches is a valid letter before allowing the circuit to function
    ValidLock valid (.CLK(qclock), .LET(LET), .ENTER(ENTER), .LDPlug(LDPlug), .LDRot(LDRot), .outENTER(enter), .outLDPlug(enablePlug), .outLDRot(enableRotor));
    
    //stores the current input so that the encrypted output stays constant until the next input is entered
    LetterRegister letReg (.LET(LET), .LD(enter), .outLET(regLET), .ON(on));
    
    //stores letters in pairs
    //If the input is present in one of the pairs, it is swapped to the value of the other letter in the pair
    Plugboard plugs (.settingLET(LET), .LET(regLET), .LETinv(rotLET), .SEL(PlugSEL), .LD(enablePlug), .outLET(plugLET), .outLETinv(plugLETinv), .active(led));
    
    //maintains the current rotor positions, can be used to set/reset the positions based the value of RotSEL and enableRotor
    RPosition rotorPos (.Rnotch(LET), .LD(enableRotor), .SEL(RotSEL), .STEP(enter), .R1(rPos1), .R2(rPos2), .R3(rPos3));
    
    //shifts the input into an encrypted character through a series of bitshifts and value switching
    RotorLogic rLogic (.LET(plugLET), .R1(rPos1), .R2(rPos2), .R3(rPos3), .outLET(rotLET));
    
    //helps display the rotor positions and encrypted character on the seven segment displays concurrently
    AnodeFSM anodes (.ON(on), .CLK(hclock), .R1(rPos1), .R2(rPos2), .R3(rPos3), .LET(plugLETinv), .an(an), .out(segLET));
    
    //decodes the 5 bit output of the AnodeFSM into an 8 bit value
    //corresponding to a character on the seven segment display
    AlphaDecoder alpha (.LET(segLET), .seg(seg));
    
endmodule
