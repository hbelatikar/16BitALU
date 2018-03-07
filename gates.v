`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  KJSCE BE Project
// Engineer: Hrishikesh Belatikar
// 
// Create Date: 11/01/2017 12:48:02 PM
// Design Name: 
// Module Name: gates
// Project Name: 1 Bit ALU_Rev Gates 
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

module  feyGate(a, b, p, q);
	input a,b;
	output p,q;
	assign p=a;
	assign q=a^b;
endmodule

module fredGate (a,b,c,p,q,r);
	input a,b,c;
	output p,q,r;
	assign p=a;
	assign q=((~a)&b)^(a&c);
	assign r=((~a)&c)^(a&b);
endmodule

module tofGate (a,b,c,p,q,r);
	input a,b,c;
	output p,q,r;	
	assign p=a;
	assign q=b;
	assign r=(a&b)^c;
endmodule

module dpgGate(a,b,c,d,p,q,r,s);
	input a,b,c,d;
	output p,q,r,s;	
	assign p=a;
	assign q=(a^b);
	assign r=(a^b^c);
	assign s=(((a^b)&c)^((a&b)^d));
endmodule

module dkgGate(a,b,c,d,p,q,r,s);
	input a,b,c,d;
	output p,q,r,s;	
	assign p=b;
	assign q=((~a)&c)||(a&(~d));
	assign r=((a^b)||(c^d)||(c&d));
	assign s=b^c^d;
endmodule
