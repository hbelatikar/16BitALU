module three_ip_tb;
	wire t_p,t_q,t_r;
	reg [2:0] inTest;
	
	gate dut( .a(inTest[2]) , .b(inTest[1]) , .c(inTest[0]) , .p(t_p) , .q(t_q) , .r(t_r) );
	
	initial begin
		$monitor(inTest[0],inTest[1],inTest[2],t_p,t_q,t_r);
			
			inTest = 3'b000;
			#60
			inTest = 3'b001;
			#60
			inTest = 3'b010;
			#60
			inTest = 3'b011;
			#60
			inTest = 3'b100;
			#60
			inTest = 3'b101;
			#60
			inTest = 3'b110;
			#60
			inTest = 3'b111;
			#60
			
		$finish;
	end
endmodule
