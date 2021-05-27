module	BCD(
	bin,
	hundreds,
	tens,
	ones);
	
	input		[7:0]	bin;
	output	[3:0]	hundreds, tens, ones;

	reg		[3:0]	hundreds, tens, ones;
	
	integer	i;
	
	always @(bin) begin
		hundreds	=	4'd0;
		tens		=	4'd0;
		ones		=	4'd0;
		
		for (i=7;i>=0;i=i-1) begin
			if(hundreds	>= 5)
				hundreds = hundreds + 4'b0011;
			if(tens >= 5)
				tens 		= tens + 4'b0011;
			if(ones >= 5)
				ones 		= ones + 4'b0011;
				
			hundreds 	= hundreds << 1;
			hundreds[0] = tens[3];
			tens			=	tens	<< 1;
			tens[0] 		= ones[3];
			ones 			= ones << 1;
			ones[0] 		= bin[i];
		end
	end
	
endmodule
