`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University
// Engineer: Riley Peters
// 
// Create Date: 11/30/2021 04:28:36 PM
// Design Name: 
// Module Name: CFilter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              Filters the input based on the specifications of Rotor I of
//              the Enigma M3. Setting list is available here: 
//              https://www.cryptomuseum.com/crypto/enigma/wiring.htm
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CFilter(
    input [25:0] filter,
    input [25:0] filterInv,
    output logic [25:0] OUT,
    output logic [25:0] OUTinv
    );
    
    always_comb                           
     begin                                 
     OUT[0] = filter[20];                   
     OUT[1] = filter[22];                   
     OUT[2] = filter[24];                   
     OUT[3] = filter[6];                    
     OUT[4] = filter[0];                    
     OUT[5] = filter[3];                    
     OUT[6] = filter[5];                    
     OUT[7] = filter[15];                   
     OUT[8] = filter[21];                   
     OUT[9] = filter[25];                   
     OUT[10] =filter[1];                   
     OUT[11] =filter[4];                   
     OUT[12] =filter[2];                   
     OUT[13] =filter[10];                  
     OUT[14] =filter[12];                  
     OUT[15] =filter[19];                  
     OUT[16] =filter[7];                   
     OUT[17] =filter[23];                  
     OUT[18] =filter[18];                  
     OUT[19] =filter[11];                  
     OUT[20] =filter[17];                  
     OUT[21] =filter[8];                   
     OUT[22] =filter[13];                  
     OUT[23] =filter[16];                  
     OUT[24] =filter[14];                  
     OUT[25] =filter[9];        
                                       
     OUTinv[0] = filterInv[4];            
     OUTinv[1] = filterInv[10];           
     OUTinv[2] = filterInv[12];           
     OUTinv[3] = filterInv[5];            
     OUTinv[4] = filterInv[11];           
     OUTinv[5] = filterInv[6];            
     OUTinv[6] = filterInv[3];            
     OUTinv[7] = filterInv[16];           
     OUTinv[8] = filterInv[21];           
     OUTinv[9] = filterInv[25];           
     OUTinv[10] =filterInv[13];          
     OUTinv[11] =filterInv[19];          
     OUTinv[12] =filterInv[14];          
     OUTinv[13] =filterInv[22];          
     OUTinv[14] =filterInv[24];          
     OUTinv[15] =filterInv[7];           
     OUTinv[16] =filterInv[23];          
     OUTinv[17] =filterInv[20];          
     OUTinv[18] =filterInv[18];          
     OUTinv[19] =filterInv[15];          
     OUTinv[20] =filterInv[0];           
     OUTinv[21] =filterInv[8];           
     OUTinv[22] =filterInv[1];           
     OUTinv[23] =filterInv[17];          
     OUTinv[24] =filterInv[2];           
     OUTinv[25] =filterInv[9];   
     end
endmodule