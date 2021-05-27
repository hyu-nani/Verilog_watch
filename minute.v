module minute	(
					  clk,
					  rst,
					  min_10,
					  min1 );
					  
	input			clk ,rst;
	
	output		[3:0] min_10, min1;
	
	reg			[3:0] min_10, min1;
	
	always @ ( posedge clk or negedge rst ) begin
		if(!rst) begin
			min1 		<= 4'd0;
			min_10	<= 4'd0;
		end
		
		else if (min1 == 4'd9) begin
			min1 		<= 4'd0;
			min_10	<= min_10 + 4'd1;
		end
		
		else if (min_10 == 4'd5 && min1 == 4'd9) begin
			min1		<= 4'd0;
			min_10	<= 4'd0;
		end
		
		else begin
			min1 		<= min1 + 4'd1;
			min_10	<= min_10;
		end
	end
	
endmodule
		