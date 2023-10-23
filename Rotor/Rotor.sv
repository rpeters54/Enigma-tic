`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/19/2021 07:49:36 PM
// Design Name: 
// Module Name: Rotor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Bitshifts the input based on the value of POS
//              wraps the input around to the opposite side in
//              overflow/underflow cases.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Rotor(
    input [25:0] DR,
    input [25:0] DL,
    output logic [25:0] RIGHT,
    output logic [25:0] LEFT,
    input [4:0] POS
    );
    
    always_comb
    begin
        RIGHT = DR; LEFT = DL;
        for (int i = 0; i < POS; i++)
            begin
            if (RIGHT == 26'd1) RIGHT = 26'h2000000;
            else RIGHT = RIGHT >> 1;
            if (LEFT == 26'h2000000) LEFT = 26'd1;
            else LEFT = LEFT << 1;
            end
     end
endmodule