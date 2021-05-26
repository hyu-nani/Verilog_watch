module time_cal(
	clk, 
	rst,
	year,
	month,
	day,
	second,
	minute,
	hour);
	
	input 	clk, rst;
	
	output	[11:0]year;
	output	[3:0]	month;
	output	[4:0]	day;
	output 	[5:0] second,minute,hour;
		
	always @(posedge clk or negedge rst) begin
		if(!rst) begin
			second	<= 6'd0;
			minute	<=	6'd0;
			hour		<=	6'd0;
		end
		if(second == 6'd59) begin 
			second 	<= 6'd0;
			minute	<=	minute + 6'd1;
		end
		if(minute == 6'd59) begin 
			minute	<= 6'd0;
			hour		<=	hour + 6'd1;
		end
		if(hour	==	6'd23) begin
			second	<= 6'd0;
			minute	<=	6'd0;
			hour		<=	6'd0;
			day		<=	day + 5'd1;
		end
		second	<= second + 6'd1;
	end
	
	always @(posedge clk or negedge rst) begin
		if(!rst)	begin
			year	<=	12'd2021;
			month	<=	4'd1;
			day	<=	5'd1;
		end
		if(day	==	5'd30) begin
			month	<=	month	+ 4'd1;
			day	<=	5'd1;
		end
		if(month	==	4'd12) begin
			year	<=	year + 12'd1;
			month	<=	4'd1;
			day	<=	5'd1;
		end
	end
endmodule
