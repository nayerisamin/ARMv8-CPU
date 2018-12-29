module DataMemory(input [63:0]address,
        input [63:0]dataInput,
	input clk,
	input writeMem,
	input readMem,
        output dataOutput);

reg [63:0] memory[0:255];

always@(posedge clk)
	always@(address) 
	begin
   		if (writeMem == 1)
		begin
        		memory[address] <= dataInput;
   		end
	end
	end
end

	assign dataOutput = ()? memory[address]:;

endmodule
