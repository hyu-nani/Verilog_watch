module	BCD(
	bin,
	rst,
	hundreds,
	tens,
	ones);
	
	input		[7:0]	bin;
	input				rst;
	output	[3:0]	hundreds, tens, ones;
	
	reg		[3:0]	hundreds, tens, ones;
	wire		[7:0] h_m, m_s;
	
	assign	h_m = {hundreds, tens};
	assign	m_s = {tens, ones};
	
	integer	i;
	
	always @(bin) begin
		if(!rst) begin
			hundreds	<=	0;
			tens		<=	0;
			ones		<=	0;
		end
			
		else begin	
			for (i=7;i>=0;i=i-1) begin
				if(hundreds	>= 4'd5)
					hundreds <= hundreds + 3;
				if(tens >= 5)
					tens <= tens + 3;
				if(ones >= 5)
					ones <= ones + 3;
					
				hundreds <= hundreds << 1;
				hundreds[0] <= tens[3];
				tens	<=	tens	<< 1;
				tens[0] <= ones[3];
				ones <= ones << 1;
				ones[3] <= bin[i];
			end
		end
	end
	
endmodule
