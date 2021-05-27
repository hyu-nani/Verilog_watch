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
	
	clkone_gen					U0(
		.clk				(clk),
		.rst				(rst),
		.clk1				(clk1));
	
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
		.clk				(clk),
		.rst				(rstn),
		.bin				(second),
		.hundreds		(),
		.tens				(tensS),
		.ones				(onesS));
			
	BCD							CON1(
		.clk				(clk),
		.rst				(rstn),
		.bin				(minute),
		.hundreds		(),
		.tens				(tensM),
		.ones				(onesM));
		
	BCD							CON2(
		.clk				(clk),
		.rst				(rstn),
		.bin				(hour),
		.hundreds		(),
		.tens				(tensH),
		.ones				(onesH));
		
	en_clk_lcd					LCLK( 
			.clk			(clk), 
			.rst			(rstn), 
			.en_clk		(en_clk) );
	
	lcd_display_string		STR ( 
			.clk			(clk), 
			.rst			(rstn), 
			.index		(index_char), 
			.ones1		(onesS),
			.tens1		(tensS),
			.ones2		(onesM),
			.tens2		(tensM),
			.ones3		(onesH),
			.tens3		(tensH),
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



