`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: KJSCE
// Engineer: Hrishikesh Belatikar
// 
// Create Date: 11/01/2017 03:08:11 PM
// Design Name: Structural
// Module Name: one_bit
// Project Name: 16 Bit ALU using Reversible logic gates
// Target Devices: N/A
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


module one_bit(
    input [4:0] select,
    input a,
    input b,
    input amin,
    input cmin,
    input aplus,
    input cplus,
    input Cin,
    output Cout,
    output y
    );
    
   wire wdpg[1:0],wmux[11:0],wdkg[4:0],wfey,wtof,garbage[20:0],wshb,warith,waconn,ws0conn[5:0],ws1conn[4:0],ws2conn[3:0];
    
   dpgGate     dpg1(a,b,select[1],select[0],waconn,garbage[0],wdpg[1],wdpg[0]);
    
   fredGate    mux1(select[1],waconn,b,ws1conn[0],wmux[0],garbage[1]),
               mux2(select[0],wmux[0],wdpg[1],ws0conn[0],wmux[1],garbage[2]),
               mux3(select[2],wdpg[0],wmux[1],ws2conn[0],wmux[2],garbage[3]), //to arith mux port 1
               mux4(ws0conn[0],~a,1'b1,ws0conn[1],wmux[3],garbage[4]),
               mux5(ws1conn[0],a,wmux[3],ws1conn[1],wdkg[0],garbage[5]), //to dkg port b
               mux6(ws0conn[1],b,1'b1,ws0conn[2],wmux[4],garbage[6]),     
               mux7(ws2conn[1],1'b1,1'b0,ws2conn[2],wmux[5],garbage[7]),
               mux8(ws0conn[2],wmux[5],1'b1,ws0conn[3],wmux[6],garbage[8]),
               mux9(ws1conn[1],wmux[4],wmux[6],ws1conn[2],wdkg[1],garbage[9]); //to dkg port c
                
   feyGate     fey1(ws0conn[4],ws1conn[3],ws0conn[5],wfey);
   
   fredGate    mux10(wfey,Cin,1'b0,garbage[10],wmux[7],garbage[11]),
               mux11(ws2conn[2],1'b1,1'b0,garbage[12],wmux[8],garbage[13]),
               mux12(wtof,wmux[7],wmux[8],garbage[14],wdkg[2],garbage[15]);     //to dkg port d   
              
   tofGate     tof1(ws0conn[3],ws1conn[2],1'b0,ws0conn[4],ws1conn[3],wtof);
   
   dkgGate     dkg1(ws2conn[0],wdkg[0],wdkg[1],wdkg[2],ws2conn[1],garbage[16],Cout,wmux[9]);
   
   fredGate    muxArith(select[3],wmux[2],wmux[9],garbage[17],warith,garbage[18]);
   
   shifting_block shb1(amin,cmin,aplus,cplus,select[1],select[0],wshb);
           
   fredGate    muxAS(select[4],warith,wshb,garbage[19],y,garbage[20]);
    
endmodule 
