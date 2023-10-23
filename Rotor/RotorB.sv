`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/23/2021 10:07:07 AM
// Design Name: 
// Module Name: RotorB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Based on the rotor position, the input is bitshifted and passed through
//              a filter that maps the input to a separate value. After the filter, the
//              bitshift is reversed. There is an additional inverse input for the signal
//              that returns through the rotor.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RotorB (
    input [25:0] D,
    input [25:0] Dinv,
    output logic [25:0] OUT,
    output logic [25:0] OUTinv,
    input [4:0] POS
    );
    
    logic [25:0] shiftToFilter, filterToShift, shiftToFilterInv, filterToShiftInv;
    
    BFilter pass (.filter(shiftToFilter), .OUT(filterToShift), .filterInv(shiftToFilterInv), .OUTinv(filterToShiftInv));
    Rotor rotForward (.DR(filterToShift), .DL(D), .RIGHT(OUT), .LEFT(shiftToFilter), .POS(POS));
    Rotor rotInverse (.DR(filterToShiftInv), .DL(Dinv), .RIGHT(OUTinv), .LEFT(shiftToFilterInv), .POS(POS));

endmodule

