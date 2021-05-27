module	BCD(
	bin,
	sec1,
	sec_10,
	min1,
	min_10,
	hour_10,
	hour1,
	hundreds,
	tens,
	ones);
	
	input		[7:0]	bin;
	input		[3:0] sec1, sec_10, min1, min_10, hour1, hour_10;
	output	[3:0]	hundreds, tens, ones;

	reg		[3:0]	hundreds, tens, ones;
	
	integer	i;
	
	always @(bin) begin
		hundreds	=	4'd0;
		tens		=	4'd0;
		ones		=	4'd0;
		
		for (i=7;i>=0;i=i-1) begin
			if(hundreds	>= 5)
				hundreds = hundreds + 3;
			if(tens >= 5)
				tens = tens + 3;
			if(ones >= 5)
				ones = ones + 3;
				
			hundreds = hundreds << 1;
			hundreds[0] = tens[3];
			tens	=	tens	<< 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones[0] = bin[i];
		end
	end
	
endmodule
