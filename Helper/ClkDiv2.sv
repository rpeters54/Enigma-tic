`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 04:23:06 PM
// Design Name: 
// Module Name: ClkDiv2
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
// ClkDiv2 #(param) clk1 ( .CLK(), .SCLK()); 
//////////////////////////////////////////////////////////////////////////////////

module ClkDiv2 #(parameter COUNT = 1100)(
    input CLK,
    output logic SCLK = 0
    );
    
    logic [31:0] count = 0;
    always_ff @ (posedge CLK)
    begin
        if (count == COUNT -1 )
        begin
            SCLK <= ~SCLK;
            count <= 0;
        end
        else
            count <= count + 1;
    end
        
endmodule

