module four_ip_tb;
	wire t_p,t_q,t_r;
	reg [3:0] inTest;
	
	gate dut( .a(inTest[3]) , .b(inTest[2]) , .c(inTest[1]),.d(inTest[0]) , .p(t_p) , .q(t_q) , .r(t_r), .s(t_s) );
	
	initial begin
		$monitor(inTest[0],inTest[1],inTest[2],inTest[3],t_p,t_q,t_r,t_s);
			
			inTest = 4'b0000;
			#60
			inTest = 4'b0001;
			#60
			inTest = 4'b0010;
			#60
			inTest = 4'b0011;
			#60
			inTest = 4'b0100;
			#60
			inTest = 4'b0101;
			#60
			inTest = 4'b0110;
			#60
			inTest = 4'b0111;
			#60
			inTest = 4'b1000;
			#60
			inTest = 4'b1001;
			#60
			inTest = 4'b1010;
			#60
			inTest = 4'b1011;
			#60
			inTest = 4'b1100;
			#60
			inTest = 4'b1101;
			#60
			inTest = 4'b1110;
			#60
			inTest = 4'b1111;
			#60
			
		$finish;
	end
endmodule
