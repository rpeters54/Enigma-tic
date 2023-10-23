`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 07:58:03 PM
// Design Name: 
// Module Name: PlugFSM
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


module PlugFSM(
    input LD,
    input [4:0] LET,
    output logic active = 0,
    output logic [9:0] F = 0
    );
    
    typedef enum {START, INTER, LAST} STATES;
    STATES PS = START;
    STATES NS;
    
    always_ff @ (posedge LD)
    begin
        PS <= NS;
    end
    
    always_comb
    begin
        if (PS == NS) 
            begin
            case(PS)
                START:
                begin
                    //initial state
                    //no characters are stored
                    //plugboard pair is inactive
                    active = 0;
                    F = 0;
                    NS = INTER;
                end
                INTER:
                begin
                    //intermediate state
                    //one character is stored
                    //plugboard pair is still inactive
                    active = 0;
                    F = {5'd0, LET};
                    NS = LAST;
                end
                LAST:
                begin
                    //final state
                    //both characters are stored
                    //plugboard pair is activated
                    active = 1;
                    F = {LET, F[4:0]};
                    NS = START;
                end
                default:
                begin
                    active = 0;
                    F = 0;
                    NS = INTER;
                end
            endcase
        end
    end
endmodule
