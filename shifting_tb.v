module shifting_tb;
	wire t_y;
	reg t_am,t_cm,t_ap,t_cp;
	reg [1:0] t_sel;
	
	shifting_block dut(.amin(t_am),.cmin(t_cm),.cplus(t_cp),.aplus(t_ap),.select1(t_sel[1]),.select0(t_sel[0]),.y(t_y));
	
	initial begin
		t_am = 1'b0;	
		t_cm = 1'b0;
		t_ap = 1'b1;
		t_cp = 1'b1;
		$monitor(t_am,t_cm,t_ap,t_cp,t_y,t_sel);
			t_sel= 2'b00;
			#50
			t_sel= 2'b01;
			#50
			t_sel= 2'b10;
			#50
			t_sel= 2'b11;
			#50
		$finish;
	end
endmodule
