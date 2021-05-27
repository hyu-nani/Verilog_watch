module	digital_project ( 
	clk, 
	rst, 
	lcd_rs, 
	lcd_rw, 
	lcd_e, 
	lcd_data );

	input				clk;
	input				rst;
	output			lcd_rs;
	output			lcd_rw;
	output			lcd_e;
	output	[7:0] lcd_data;
	
	wire		[4:0] index_char;
	wire		[7:0] data_char;
	wire				en_clk;
	
	assign			rstn	= ~rst;
	
	clock							TIME(
		.clk				(clk), 
		.rst				(rst),
		.year				(year),
		.month			(month),
		.day				(day),
		.second			(second),
		.minute			(minute),
		.hour				(hour));
	
	BCD							CON0(
		.bin				(second),
		.hundreds		(),
		.tens				(sec_10),
		.ones				(sec1));
			
	BCD							CON1(
		.bin				(minute),
		.hundreds		(),
		.tens				(min_10),
		.ones				(min1));
		
	BCD							CON2(
		.bin				(hour),
		.hundreds		(),
		.tens				(hour_10),
		.ones				(hour1));
		
	en_clk_lcd					LCLK( 
			.clk			(clk), 
			.rst			(rstn), 
			.en_clk		(en_clk) );
	
	lcd_display_string		STR ( 
			.clk			(clk), 
			.rst			(rstn), 
			.index		(index_char), 
			.sec_10		(sec_10),
			.sec1			(sec1),
			.min_10		(min_10),
			.min1			(min1),
			.hour_10		(hour_10),
			.hour1		(hour1),
			.out			(data_char) );
	
	lcd_driver					DRV ( 
			.clk			(clk), 
			.rst			(rstn), 
			.en_clk		(en_clk), 
			.data_char	(data_char), 
			.index_char	(index_char), 
			.lcd_rs		(lcd_rs), 
			.lcd_rw		(lcd_rw), 
			.lcd_e		(lcd_e), 
			.lcd_data	(lcd_data));
	
endmodule



