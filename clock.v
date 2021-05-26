module	clock ( 
					clk,
					rst,
					hour_10,
					hour1,
					min_10,
					min1,
					sec_10,
					sec1);
						
	input				clk, rst;
	output			[3:0] hour_10, hour1, min_10, min1, sec_10, sec1;
	wire				w_m, w_h;
	wire				clk1;
	
	
	
	clkone_gen		U0 ( 
							  .clk		(clk),
							  .rst		(rstn),
							  .clk1		(clk1) );
	
	second			U1 ( 
							  .clk		(clk1),
							  .rst		(rstn),
							  .w_m		(w_m),
							  .sec_10	(sec_10),
							  .sec1		(sec1) );
	
	minute			U2 ( 
							  .w_m		(w_m),	
							  .rst		(rstn),
							  .w_h		(w_h),
							  .min_10	(min_10),
							  .min1		(min1) );
							  
	hour				U3 ( 
							  .w_h		(w_h),	
							  .rst		(rstn),
							  .hour_10	(hour_10),
							  .hour1		(hour1) );

endmodule