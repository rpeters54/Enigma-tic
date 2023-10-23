`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/23/2021 10:08:59 AM
// Design Name: 
// Module Name: Reflector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Reflects the output of the Rotors back through
//              so that encryption can be reversible
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reflector (
    input [25:0] D,
    output logic [25:0] OUT
    );
    
    always_comb
        begin
        OUT[24]=  D[0];
        OUT[17]=  D[1];
        OUT[20]=  D[2];
        OUT[7]=  D[3];
        OUT[16]=  D[4];
        OUT[18]=  D[5];
        OUT[11]=  D[6];
        OUT[3]=  D[7];
        OUT[15]=  D[8];
        OUT[23]=  D[9];
        OUT[13] = D[10];
        OUT[6] = D[11];
        OUT[14] = D[12];
        OUT[10] = D[13];
        OUT[12] = D[14];
        OUT[8] = D[15];
        OUT[4] = D[16];
        OUT[1] = D[17];
        OUT[5] = D[18];
        OUT[25] = D[19];
        OUT[2] = D[20];
        OUT[22] = D[21];
        OUT[21] = D[22];
        OUT[9] = D[23];
        OUT[0] = D[24];
        OUT[19] = D[25];    
        end
endmodule