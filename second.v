module second(clk, rst, w_m, sec_10, sec1);
	input 	clk, rst;
	output 	[3:0] sec_10, sec1;
	output	w_m;
	
	reg		[3:0] sec_10, sec1;
	reg		w_m;
		
	always @(posedge clk or negedge rst)
		if(!rst) begin
			sec1 		<= 4'b0;
			sec_10	<= 4'd0;
			w_m		<= 0;
		end
		
		else if(sec1 == 4'd9) begin 
			sec1 		<= 4'd0;
			sec_10	<= sec_10 + 4'd1;
			w_m		<= 1;
		end
		
		else if(sec_10 == 5 && sec1 == 9) begin
			sec1		<= 4'd0;
			sec_10	<= 4'd0;
			w_m		<= 0;
		end
		
		else begin
			sec1 		<= sec1 + 4'd1;
			sec_10	<= sec_10;
			w_m		<= 0;
		end
	
endmodule