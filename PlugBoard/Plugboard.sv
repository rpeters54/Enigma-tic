`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/23/2021 10:42:14 AM
// Design Name: 
// Module Name: Plugboard
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


module Plugboard(
    input [4:0] settingLET, LET, LETinv,
    input [1:0] SEL,
    input LD,
    output logic [4:0] outLET, outLETinv,
    output logic [3:0] active
    );
    
    logic [3:0] ACT;
    logic [9:0] F0, F1, F2, F3;
    
    //PlugSettings stores the current plugboard pairs and
    //shows whether a pair is active (can be used)
    PlugSettings plugs (.SEL(SEL), .LD(LD), .LET(settingLET), .ACT(ACT), .F0(F0), .F1(F1), .F2(F2), .F3(F3));
    
    //PlugFunction facilitates the swapping of letters based
    //on what values are stored by PlugSettings
    PlugFunction binder (.LET(LET), .LETinv(LETinv), .F0(F0), .F1(F1), .F2(F2), .F3(F3), .ACT(ACT), .outLET(outLET), .outLETinv(outLETinv));
    
    assign active = ACT;
    
endmodule
