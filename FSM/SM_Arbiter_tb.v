
`timescale 10ns/10ns
module SM_Arbiter_tb;

parameter clk = 2;

integer i;

reg t_clk , t_rst;
reg [3:0] t_req; 
wire [3:0] t_gnt;

reg [3:0] test_data[4:0];

SM_Arbiter DUT(.clk(t_clk),.rst(t_rst),.req(t_req),.gnt(t_gnt));

initial begin
	t_clk = 0;
	test_data[0] = 4'b0001;
	test_data[1] = 4'b0010;
	test_data[2] = 4'b0100;
	test_data[3] = 4'b1000;
	test_data[4] = 4'b0000;
	i = 1;

end


always

		forever #(clk/2) t_clk = ~t_clk;
		initial begin 
		t_rst = 1'b1;
		t_req = 4'b0000;
		#2 t_rst = 1'b0;
			
		for(i=0 ; i<=4 ; i =i+1)
		begin 
		#4 
		t_req = test_data[i];
		end 
	end
endmodule