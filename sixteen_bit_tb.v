module sixteen_bit_tb;	
	wire [15:0]t_y;
	wire t_Cout;
	reg [4:0] t_select = 5'b00000;
	reg [15:0]t_a;
	reg [15:0]t_b;
	reg t_Cin;

	sixteen_bit dut(.select(t_select), .a(t_a), .b(t_b), .Cin(t_Cin), .Cout(t_Cout),.y(t_y));

	initial begin
		$monitor(t_a, t_b,t_Cin,t_y,t_Cout,t_select);
	
		t_a = 16'b0000000000000000;
		t_b = 16'b1111111111111111;
		t_Cin = 1'b0;
		t_select = 5'b00000;
		#60
		t_select = 5'b00001;
		#60
		t_select = 5'b00010;
		#60
		t_select = 5'b00011;
		#60
		t_select = 5'b00100;
		#60
		t_select = 5'b00101;
		#60
		t_select = 5'b00110;
		#60
		t_select = 5'b00111;
		#60
		t_select = 5'b01000;
		#60
		t_select = 5'b01001;
		#60
		t_select = 5'b01010;
		#60
		t_select = 5'b01011;
		#60
		t_select = 5'b01100;
		#60
		t_select = 5'b01101;
		#60
		t_select = 5'b01110;
		#60
		t_select = 5'b01111;
		#60
		t_select = 5'b10000;
		#60
		t_select = 5'b10001;
		#60
		t_select = 5'b10010;
		#60
		t_select = 5'b10011;
		#60
		$finish;
	end
endmodule
