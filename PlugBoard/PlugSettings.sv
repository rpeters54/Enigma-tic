`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 12:36:26 PM
// Design Name: 
// Module Name: PlugSettings
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


module PlugSettings(
    input [1:0] SEL,
    input LD,
    input [4:0] LET,
    output logic [3:0] ACT,
    output logic[9:0] F0,
    output logic [9:0] F1,
    output logic [9:0] F2,
    output logic [9:0] F3
    );
    
    logic L0, L1, L2, L3;
    
    //Demux is used to determine which plugboard pair is being changed
    //based on the PlugBoard Select Switches
    Demux4_1 #(1) dm1 (.DEMUX_IN(LD), .SEL(SEL), .ZERO(L0), .ONE(L1), .TWO(L2), .THREE(L3));
    
    //PlugFSM facilitates the storage and activation of the plugboard pairs
    PlugFSM plug0 (.LD(L0), .LET(LET), .active(ACT[0]), .F(F0));
    PlugFSM plug1 (.LD(L1), .LET(LET), .active(ACT[1]), .F(F1));
    PlugFSM plug2 (.LD(L2), .LET(LET), .active(ACT[2]), .F(F2));
    PlugFSM plug3 (.LD(L3), .LET(LET), .active(ACT[3]), .F(F3));
    
endmodule

