module clock(
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
	
	reg	[11:0]year;
	reg	[3:0]	month;
	reg	[4:0]	day;
	reg 	[5:0] second,minute,hour;		
	
	wire			clk1;
	
	clkone_gen			U0(
		.clk		(clk),
		.rst		(rst),
		.clk1		(clk1));
		
	always @(posedge clk1 or negedge rst) begin
		if(!rst)	begin
			year		<=	12'd2021;
			month		<=	4'd1;
			day		<=	5'd1;
			second	<= 6'd0;
			minute	<=	6'd0;
			hour		<=	6'd0;
		end
		else begin
			if(day	==	5'd30) begin
				month	<=	month	+ 1'b1;
				day	<=	5'd1;
			end
			if(month	==	4'd12) begin
				year	<=	year + 1'b1;
				month	<=	4'd1;
				day	<=	5'd1;
			end
			if(second == 6'd59) begin 
				second 	<= 6'd0;
				minute	<=	minute + 1'b1;
			end
			if(minute == 6'd59) begin 
				minute	<= 6'd0;
				hour		<=	hour + 1'b1;
			end
			if(hour	==	6'd23) begin
				second	<= 6'd0;
				minute	<=	6'd0;
				hour		<=	6'd0;
				day		<=	day + 1'b1;
			end 
			second	<= second + 1'b1;
		end
			
	end
	
endmodule
