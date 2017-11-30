`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2017 06:20:44 PM
// Design Name: Structural
// Module Name: shifting_block
// Project Name: 16 Bit ALU using Reversible logic gates
// Target Devices: N/A
// Tool Versions: 
// Description: 
// 
// Dependencies: gates.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  
//////////////////////////////////////////////////////////////////////////////////


module shifting_block(
    input amin,
    input cmin,
    input aplus,
    input cplus,
    input select1,
    input select0,
    output y
    );
    
    wire wmux[2:0],garbage[5:0]; 
    
    fredGate    leftMux(select1,amin,cmin,garbage[0],wmux[0],garbage[1]),
                rightMux(select1,aplus,cplus,garbage[2],wmux[1],garbage[3]),
                rlMux(select0,wmux[0],wmux[1],garbage[4],y,garbage[5]);
                                  
endmodule
