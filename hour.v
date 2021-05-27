module	hour	(	clk,
						rst,
						hour_10,
						hour1 );
	
	input				clk, rst;
	
	output			[3:0] hour_10, hour1;
	
	reg				[3:0] hour_10,hour1;
	
	always @ (posedge clk or negedge rst) begin
		if(!rst) begin
			hour1 <= 4'd0;
			hour_10	<= 4'd0;
		end
		
		else if ( hour1 == 9 ) begin
			hour1 <= 4'd0;
			hour_10   <= hour_10 + 4'd1;
		end
		
		else if ( hour_10 == 2 && hour1 == 3 ) begin
			hour1 	<= 4'd0;
			hour_10	<= 4'd0;
		end
		
		else begin
			hour1 <= hour1 + 2'd1;
			hour_10 <= hour_10;
		end
	end
endmodule