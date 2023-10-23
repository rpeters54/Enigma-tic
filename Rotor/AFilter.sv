`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/30/2021 04:28:36 PM
// Design Name: 
// Module Name: AFilter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Filters the input based on the specifications of Rotor III of
//              the Enigma M3. Setting list is available here: 
//              https://www.cryptomuseum.com/crypto/enigma/wiring.htm
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AFilter(
    input [25:0] filter,       
    input [25:0] filterInv,    
    output logic [25:0] OUT,   
    output logic [25:0] OUTinv 
    );
    
    always_comb
    begin
    OUT[0] = filter[19];
    OUT[1] = filter[0];
    OUT[2] = filter[6];
    OUT[3] = filter[1];
    OUT[4] = filter[15];
    OUT[5] = filter[2];
    OUT[6] = filter[18];
    OUT[7] = filter[3];
    OUT[8] = filter[16];
    OUT[9] = filter[4];
    OUT[10] =filter[20];
    OUT[11] =filter[5];
    OUT[12] =filter[21];
    OUT[13] =filter[13];
    OUT[14] =filter[25];
    OUT[15] =filter[7];
    OUT[16] =filter[24];
    OUT[17] =filter[8];
    OUT[18] =filter[23];
    OUT[19] =filter[9];
    OUT[20] =filter[22];
    OUT[21] =filter[11];
    OUT[22] =filter[17];
    OUT[23] =filter[10];
    OUT[24] =filter[14];
    OUT[25] =filter[12];
    
    OUTinv[0] = filterInv[1];
    OUTinv[1] = filterInv[3];
    OUTinv[2] = filterInv[5];
    OUTinv[3] = filterInv[7];
    OUTinv[4] = filterInv[9];
    OUTinv[5] = filterInv[11];
    OUTinv[6] = filterInv[2];
    OUTinv[7] = filterInv[15];
    OUTinv[8] = filterInv[17];
    OUTinv[9] = filterInv[19];
    OUTinv[10] =filterInv[23];
    OUTinv[11] =filterInv[21];
    OUTinv[12] =filterInv[25];
    OUTinv[13] =filterInv[13];
    OUTinv[14] =filterInv[24];
    OUTinv[15] =filterInv[4];
    OUTinv[16] =filterInv[8];
    OUTinv[17] =filterInv[22];
    OUTinv[18] =filterInv[6];
    OUTinv[19] =filterInv[0];
    OUTinv[20] =filterInv[10];
    OUTinv[21] =filterInv[12];
    OUTinv[22] =filterInv[20];
    OUTinv[23] =filterInv[18];
    OUTinv[24] =filterInv[16];
    OUTinv[25] =filterInv[14];
    end
endmodule
