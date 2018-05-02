`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2018 07:28:55 PM
// Design Name: 
// Module Name: one_bit_mid
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


module one_bit_mid(
    input [4:0] select,
    input a,
    input b,
    input amin,
    input aplus,
    input Cin,
    output Cout,
    output y
    );
    
    wire wdpg[1:0],wmux[9:0],wdkg[2:0],wfey,wtof,garbage[34:0],wshb,warith;

    dpgGate     dpg1(a,b,select[1],select[0],garbage[0],garbage[1],wdpg[1],wdpg[0]);
    
    fredGate    mux1(select[1],a,b,garbage[2],wmux[0],garbage[3]),
                mux2(select[0],wmux[0],wdpg[1],garbage[4],wmux[1],garbage[5]),
                mux3(select[2],wdpg[0],wmux[1],garbage[6],wmux[2],garbage[7]), //to arith mux port 1
                mux4(select[0],~a,1'b1,garbage[8],wmux[3],garbage[9]),
                mux5(select[1],a,wmux[3],garbage[10],wdkg[0],garbage[11]), //to dkg port b
                mux6(select[0],b,1'b1,garbage[12],wmux[4],garbage[13]),     
                mux7(select[2],1'b1,1'b0,garbage[14],wmux[5],garbage[15]),
                mux8(select[0],wmux[5],1'b1,garbage[16],wmux[6],garbage[17]),
                mux9(select[1],wmux[4],wmux[6],garbage[18],wdkg[1],garbage[19]); //to dkg port c
                 
    feyGate     fey1(select[0],select[1],garbage[20],wfey);
    
    fredGate    mux10(wfey,Cin,1'b0,garbage[21],wmux[7],garbage[22]),
                //mux11(select[2],1'b1,1'b0,garbage[23],wmux[8],garbage[24]),
                mux12(wtof,wmux[7],Cin,garbage[25],wdkg[2],garbage[26]);     //to dkg port d   
               
    tofGate     tof1(select[0],select[1],1'b0,garbage[27],garbage[28],wtof);
    
    dkgGate     dkg1(select[2],wdkg[0],wdkg[1],wdkg[2],garbage[29],garbage[30],Cout,wmux[9]);
    
    fredGate    muxArith(select[3],wmux[2],wmux[9],garbage[31],warith,garbage[32]);
    
   shifting_mid shb1(amin,aplus,select[0],wshb);
    
    fredGate    muxAS(select[4],warith,wshb,garbage[33],y,garbage[34]);
    
endmodule