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
		.rst				(rstn),
		.year				(year),
		.month			(month),
		.day				(day),
		.second			(second),
		.minute			(minute),
		.hour				(hour));
	
		
	BCD							CON0(
		.bin				(second),
		.rst				(rstn),
		.hundreds		(hundreds),
		.tens				(tens1),
		.ones				(ones1));
			
	BCD							CON1(
		.bin				(minute),
		.rst				(rstn),
		.hundreds		(hundreds),
		.tens				(tens2),
		.ones				(ones2));
		
	BCD							CON2(
		.bin				(hour),
		.rst				(rstn),
		.hundreds		(hundreds),
		.tens				(tens3),
		.ones				(ones3));
		
	en_clk_lcd					LCLK( 
			.clk			(clk), 
			.rst			(rstn), 
			.en_clk		(en_clk) );
	
			
			
	lcd_display_string		STR ( 
			.clk			(clk), 
			.rst			(rstn), 
			.index		(index_char), 
			.ones1		(ones1),
			.tens1		(tens1),
			.ones2		(ones2),
			.tens2		(tens2),
			.ones3		(ones3),
			.tens3		(tens3),
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



