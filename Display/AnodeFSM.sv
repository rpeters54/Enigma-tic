`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 09:49:40 PM
// Design Name: 
// Module Name: AnodeFSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Helps the output display the rotor positions, as well as the encrypted output.
//              When no letter has been encrypted the encrypted output display is deactivated.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AnodeFSM(
    input ON,
    input CLK,
    input [4:0] R1,
    input [4:0] R2,
    input [4:0] R3,
    input [4:0] LET,
    output logic [3:0] an,
    output logic [4:0] out
    );
    
    typedef enum {SEG1, SEG2, SEG3, SEG4} STATES;
    STATES PS = SEG1;
    STATES NS;
    
    always_ff @ (posedge CLK)
    begin
        PS <= NS;
    end
    
    always_comb
    begin
        an = 0; out = 0;
        case(PS) 
            SEG1:
            begin
            //displays the position of rotor 3 on ssd 1
                an = 4'b0111;
                out = R3;
                NS = SEG2;
            end
            SEG2:
            begin
            //displays the position of rotor 2 on ssd 2
                an = 4'b1011;
                out = R2;
                NS = SEG3;
            end
            SEG3:
            begin
            //displays the position of rotor 1 on ssd 3
                an = 4'b1101;
                out = R1;
                if(ON) NS = SEG4;
                else NS = SEG1;
            end
            SEG4:
            begin
            //displays the encrypted output on ssd 4
                an = 4'b1110;
                out = LET;
                NS = SEG1;
            end
        endcase
    end
endmodule
