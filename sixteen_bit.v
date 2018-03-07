module sixteen_bit(
	input [4:0] select,
	input [15:0] a,
	input [15:0] b,
	input Cin,
	output Cout,
	output [15:0] y
	);
	
	wire wcar[14:0];
	
	one_bit bit0 (select,a[0],b[0],a[15],Cin,a[1],a[1],Cin,wcar[0],y[0]),
			bit1 (select,a[1],b[1],a[0],a[0],a[2],a[2],wcar[0],wcar[1],y[1]),
			bit2 (select,a[2],b[2],a[1],a[1],a[3],a[3],wcar[1],wcar[2],y[2]),
			bit3 (select,a[3],b[3],a[2],a[2],a[4],a[4],wcar[2],wcar[3],y[3]),
			bit4 (select,a[4],b[4],a[3],a[3],a[5],a[5],wcar[3],wcar[4],y[4]),
			bit5 (select,a[5],b[5],a[4],a[4],a[6],a[6],wcar[4],wcar[5],y[5]),
			bit6 (select,a[6],b[6],a[5],a[5],a[7],a[7],wcar[5],wcar[6],y[6]),
			bit7 (select,a[7],b[7],a[6],a[6],a[8],a[8],wcar[6],wcar[7],y[7]),
			bit8 (select,a[8],b[8],a[7],a[7],a[9],a[9],wcar[7],wcar[8],y[8]),
			bit9 (select,a[9],b[9],a[8],a[8],a[10],a[10],wcar[8],wcar[9],y[9]),
			bit10 (select,a[10],b[10],a[9],a[9],a[11],a[11],wcar[9],wcar[10],y[10]),
			bit11 (select,a[11],b[11],a[10],a[10],a[12],a[12],wcar[10],wcar[11],y[11]),
			bit12 (select,a[12],b[12],a[11],a[11],a[13],a[13],wcar[11],wcar[12],y[12]),
			bit13 (select,a[13],b[13],a[12],a[12],a[14],a[14],wcar[12],wcar[13],y[13]),
			bit14 (select,a[14],b[14],a[13],a[13],a[15],a[15],wcar[13],wcar[14],y[14]),
			bit15 (select,a[15],b[15],a[14],a[14],a[0],Cout,wcar[14],Cout,y[15]);
endmodule	
