`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 12:52:44 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator #(parameter WIDTH = 5)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    output logic EQ,
    output logic GT,
    output logic LT
    );
    
    always_comb
    begin
        EQ = 0; GT = 0; LT = 0;
        if (A == B) EQ = 1;
        else if (A > B) GT = 1;
        else LT = 1;
    end
endmodule
