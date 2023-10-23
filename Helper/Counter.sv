`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Counter #(param) cnt1 (.CLK(), .CLR(), .UP(), .LD(), .EN(), .D(), .COUNT(), .RCO());
//////////////////////////////////////////////////////////////////////////////////


module Counter #(parameter WIDTH = 4) (
    input CLR, UP, LD, EN,
    input [WIDTH-1:0] D, 
    output logic [WIDTH-1:0] COUNT = 0,
    output logic RCO
    );
    
    //modified so that all inputs are asynchronous
    //enable is used to register when a new letter is entered
    //causing the rotors to increment by one position
    always_ff @ (posedge EN, posedge CLR, posedge LD)
    begin    
        if (CLR == 1)
            COUNT <= 0;
        else if (LD == 1)
            COUNT <= D;
        else if (EN == 1)
        begin
            if (UP == 1)
                COUNT <= COUNT + 1;
            else 
                COUNT <= COUNT -1;
        end
    end
    
    always_comb
    begin
        if (UP == 1 && &COUNT == 1 && EN == 1)
            RCO = 1;
        else if (UP == 0 && |COUNT == 0 && EN == 1)
            RCO = 1;
        else
            RCO = 0;
    end
    
    
endmodule
