`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/30/2021 11:27:11 AM
// Design Name: 
// Module Name: Is_Num
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Simplified comparator with only an is_equal feature
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Is_Num #(parameter NUM = 0) (
    input [4:0] D,
    output logic OUT
    );
    
    always_comb
    begin
        if (D == NUM) OUT = 1;
        else OUT = 0;    
    end
endmodule
