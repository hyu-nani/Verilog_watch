module second(clk, rst, sec_10, sec1);
	input 	clk, rst;
	output 	[3:0] sec_10, sec1;
	reg		[3:0] sec_10, sec1;
		
	always @(posedge clk or negedge rst)
		if(!rst) begin
			sec1 		<= 4'd0;
			sec_10	<= 4'd0;
		end
		
		else if(sec1 == 4'd9) begin 
			sec1 		<= 4'd0;
			sec_10	<= sec_10 + 4'd1;
		end
		
		else if(sec_10 == 5 && sec1 == 9) begin
			sec1		<= 4'd0;
			sec_10	<= 4'd0;
		end
		
		else begin
			sec1 		<= sec1 + 4'd1;
			sec_10	<= sec_10;
		end
	
endmodule