`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters 
// 
// Create Date: 11/19/2021 12:17:54 AM
// Design Name: 
// Module Name: Demux4_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Takes in an n-bit input and sends it to the output selected
//              Modified from an existing module created by Professor Bridget Benson
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Demux4_1 # (parameter WIDTH = 4)(
    input [WIDTH-1:0] DEMUX_IN,
    input [1:0] SEL,
    output logic [WIDTH-1:0] ZERO, ONE, TWO, THREE
    );
    
    always_comb
    begin
    ZERO = 0; ONE = 0; TWO = 0; THREE = 0;
        case (SEL)
            0: ZERO = DEMUX_IN;
            1: ONE = DEMUX_IN;
            2: TWO = DEMUX_IN;
            3: THREE = DEMUX_IN;
            default: 
                begin
                ZERO = 0; ONE = 0; TWO = 0; THREE = 0;
                end
        endcase
    end
endmodule

