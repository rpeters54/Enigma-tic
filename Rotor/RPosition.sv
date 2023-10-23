`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/19/2021 12:12:22 AM
// Design Name: 
// Module Name: RPosition
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Stores the current position of the rotors, which increment on the
//              rising edge of STEP.
//              Based on the value of SEL, rising edge of LD can have 4 effects.
//              0 - Set all counters to zero
//              1 - LD counter 1 with Rnotch
//              2 - LD counter 2 with Rnotch
//              3 - LD counter 3 with Rnotch
//              At 26, a counter will reset to zero and increment then next counter
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RPosition(
    input [4:0] Rnotch,
    input LD,
    input [1:0] SEL,
    input STEP,
    output logic [4:0] R1,
    output logic [4:0] R2,
    output logic [4:0] R3
    );
    
    logic LDR1, LDR2, LDR3, CLRALL;
    logic [4:0] hold1;
    logic [4:0] hold2;
    logic [4:0] hold3;
    logic rco1, rco2, rco3;
    logic clr1, clr2, clr3;
    
    //determines the action that will occur if LD is pressed
    Demux4_1 #(1) dm1 (.DEMUX_IN(LD), .SEL(SEL), .ZERO(CLRALL), .ONE(LDR1), .TWO(LDR2), .THREE(LDR3));
    
    //increments 1 every time step is pressed
    Counter #(5) r1c (.UP(1'b1), .D(Rnotch), .LD(LDR1), .CLR(clr1), .EN(STEP), .COUNT(hold1));
    //resets the counter when its value reaches 26
    Is_Num #(26) ripple1 (.D(hold1), .OUT(rco1));
    //allows for the LD input or the ripplecarry to clear the value of the rotor
    assign clr1 = CLRALL | rco1;
    
    Counter #(5) r2c (.UP(1'b1), .D(Rnotch), .LD(LDR2), .CLR(clr2), .EN(rco1), .COUNT(hold2));
    Is_Num #(26) ripple2 (.D(hold2), .OUT(rco2));
    assign clr2 = CLRALL | rco2;
    
    Counter #(5) r3c (.UP(1'b1), .D(Rnotch), .LD(LDR3), .CLR(clr3), .EN(rco2), .COUNT(hold3));
    Is_Num #(26) ripple3 (.D(hold3), .OUT(rco3));
    assign clr3 = CLRALL | rco3;
    
    //outputs the current rotor position to use in the circuit's logic
    assign R1 = hold1;
    assign R2 = hold2;
    assign R3 = hold3;
    
endmodule
