module DataMemory(input [63:0]address,
	input dataInput,
	input clk,
	input writeMem,
	input readMem,
	output dataOutput)

reg [63:0] memory[0:255];

always@(posedge clk)
	always@(address) 
	begin
   		if (writeMem == 1)
        		memory[address] <= dataInput;
   		end
	end
end
always@(address)
	begin 
		if(readMem==1)
			dataOutput <= memory[address]
		end
	end

end
endmodule
