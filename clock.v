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
	output	[7:0]	month;
	output	[7:0]	day;
	output 	[7:0] second,minute,hour;
	
	reg		[11:0]year;
	reg		[7:0]	month;
	reg		[7:0]	day;
	reg 		[7:0] second,minute,hour;		
	
	wire			clk1;
	
	clkone_gen			U0(
		.clk		(clk),
		.rst		(rst),
		.clk1		(clk1));
		
	always @(posedge clk1 or negedge rst) begin
		if(!rst)	begin
			year		<=	12'd2021;
			month		<=	8'd1;
			day		<=	8'd1;
			second	<= 8'd0;
			minute	<=	8'd0;
			hour		<=	8'd0;
		end
		else begin
			if(second == 8'd59) begin 
				second 	<= 8'd0;
				minute	<=	minute + 1'b1;
			end
			if(minute == 8'd59) begin 
				minute	<= 8'd0;
				hour		<=	hour + 1'b1;
			end
			if(hour	==	8'd23) begin
				hour		<=	8'd0;
				day		<=	day + 1'b1;
			end 
			if(day	==	8'd30) begin
				day	<=	8'd1;
				month	<=	month	+ 1'b1;
			end
			if(month	==	8'd12) begin
				month	<=	8'd1;
				year	<=	year + 1'b1;
			end
			second	<= second + 1'b1;
		end
			
	end
	
endmodule
