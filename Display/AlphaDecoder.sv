`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 09:31:46 PM
// Design Name: 
// Module Name: AlphaDecoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Converts a five bit binary input into an 8 bit binary value
//              that represents an alphabetical character displayed on a 
//              seven segment display. (A = 0, Z = 25)
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AlphaDecoder(
    input [4:0] LET,
    output logic [7:0] seg
    );
    
    always_comb
    begin
        case(LET)
            5'd0: seg = 8'h11;
            5'd1: seg = 8'hC1;
            5'd2: seg = 8'h63;
            5'd3: seg = 8'h85;
            5'd4: seg = 8'h61;
            5'd5: seg = 8'h71;
            5'd6: seg = 8'h09;
            5'd7: seg = 8'hD1;
            5'd8: seg = 8'hF3;
            5'd9: seg = 8'h87;
            5'd10: seg = 8'h51;
            5'd11: seg = 8'hE3;
            5'd12: seg = 8'h57;
            5'd13: seg = 8'h13;
            5'd14: seg = 8'h03;
            5'd15: seg = 8'h31;
            5'd16: seg = 8'h19;
            5'd17: seg = 8'hF5;
            5'd18: seg = 8'h49;
            5'd19: seg = 8'hE1;
            5'd20: seg = 8'h83;
            5'd21: seg = 8'hAB;
            5'd22: seg = 8'hA9;
            5'd23: seg = 8'h91;
            5'd24: seg = 8'h89;
            5'd25: seg = 8'h25;
            default: seg = 0;
        endcase
    end
    
endmodule
