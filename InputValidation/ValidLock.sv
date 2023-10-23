`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/22/2021 12:51:15 PM
// Design Name: 
// Module Name: ValidLock
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


module ValidLock(
    input [4:0] LET,
    input CLK, ENTER, LDPlug, LDRot,
    output outENTER, outLDPlug, outLDRot
    );
    
    logic lt, dbENTER, dbLDPlug, dbLDRot;
    
    //debouncer reduces input noise to avoid double presses
    DBounce db1 (.clk(CLK), .sig_in(ENTER), .DB_out(dbENTER));
    DBounce db2 (.clk(CLK), .sig_in(LDPlug), .DB_out(dbLDPlug));
    DBounce db3 (.clk(CLK), .sig_in(LDRot), .DB_out(dbLDRot));
    
    //Makes sure that the character input switches are lower than 26
    //this ensures that the circuit will produce a valid response (Only 0-25 are valid characters)
    Comparator #(5) comp (.A(LET), .B(5'd26), .LT(lt));
    assign outENTER = lt & dbENTER;
    assign outLDPlug = lt & dbLDPlug;
    assign outLDRot = lt & dbLDRot;
endmodule
