`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 12:59:57 PM
// Design Name: 
// Module Name: PlugFunction
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Swaps characters defined by PlugSettings between the input
//              and rotors, and once again from the rotors to the output
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PlugFunction(
    input [4:0] LET, LETinv,
    input [9:0] F0,
    input [9:0] F1,
    input [9:0] F2,
    input [9:0] F3,
    input [3:0] ACT,
    output [4:0] outLET, outLETinv
    );
    
    logic [4:0] inter1, inter2, inter3,
                inter1inv, inter2inv, inter3inv;
    
    PlugCompare fplug0 (.LET(LET), .F(F0), .active(ACT[0]), .outLET(inter1));
    PlugCompare fplug1 (.LET(inter1), .F(F1), .active(ACT[1]), .outLET(inter2));
    PlugCompare fplug2 (.LET(inter2), .F(F2), .active(ACT[2]), .outLET(inter3));
    PlugCompare fplug3 (.LET(inter3), .F(F3), .active(ACT[3]), .outLET(outLET));
    
    PlugCompare rplug0 (.LET(LETinv), .F(F3), .active(ACT[3]), .outLET(inter1inv));
    PlugCompare rplug1 (.LET(inter1inv), .F(F2), .active(ACT[2]), .outLET(inter2inv));
    PlugCompare rplug2 (.LET(inter2inv), .F(F1), .active(ACT[1]), .outLET(inter3inv));
    PlugCompare rplug3 (.LET(inter3inv), .F(F0), .active(ACT[0]), .outLET(outLETinv));
    
    
endmodule
