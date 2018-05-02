`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2018 05:15:59 AM
// Design Name: 
// Module Name: shifting_mid
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


module shifting_mid(
    input amin,
    input aplus,
    input select,
    output y
    );
    
    wire [1:0] garbage;
    
    fredGate rlMux(select,amin,aplus,garbage[0],y,garbage[1]);
    
endmodule
