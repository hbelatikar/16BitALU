module two_ip_tb;
	wire t_p,t_q;
	reg [1:0] inTest;
	
	gate dut( .a(inTest[1]) , .b(inTest[0]) , .p(t_p) , .q(t_q));
	
	initial begin
		$monitor(inTest[0],inTest[1],t_p,t_q);
			
			inTest = 2'b00;
			#60
			inTest = 2'b01;
			#60
			inTest = 2'b10;
			#60
			inTest = 2'b11;
			#60
			
		$finish;
	end
endmodule
