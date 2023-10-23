`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/23/2021 09:29:59 AM
// Design Name: 
// Module Name: LetterEncoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Returns the 26 bit decoded input to a 5 bit output
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LetterEncoder(
    input [25:0] DEC,
    output logic [4:0] LET
    );
    
    always_comb
    begin
        case(DEC)
            26'h1: LET = 5'd0;
            26'h2: LET = 5'd1;
            26'h4: LET = 5'd2;
            26'h8: LET = 5'd3;
            26'h10: LET = 5'd4;
            26'h20: LET = 5'd5;
            26'h40: LET = 5'd6;
            26'h80: LET = 5'd7;
            26'h100: LET = 5'd8;
            26'h200: LET = 5'd9;
            26'h400: LET = 5'd10;
            26'h800: LET = 5'd11;
            26'h1000: LET = 5'd12;
            26'h2000: LET = 5'd13;
            26'h4000: LET = 5'd14;
            26'h8000: LET = 5'd15;
            26'h10000: LET = 5'd16;
            26'h20000: LET = 5'd17;
            26'h40000: LET = 5'd18;
            26'h80000: LET = 5'd19;
            26'h100000: LET = 5'd20;
            26'h200000: LET = 5'd21;
            26'h400000: LET = 5'd22;
            26'h800000: LET = 5'd23;
            26'h1000000: LET = 5'd24;
            26'h2000000: LET = 5'd25;
            default: LET = 0;
        endcase
    end
endmodule
