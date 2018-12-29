module DataMemory(input wire [63:0]Address,
	input [63:0]WriteData,
	input clk,
	input writeMem,
	input readMem,
        output reg [63:0] ReadDate);

reg [63:0] memory[31:0];
integer i=0;
initial
begin
	for( i = 0; i < 32; i = i + 1) 
		memory[i] = 5;
end 

always@(readMem) 
	begin
   		if (readMem == 1)
        		ReadDate <= memory[Address[4:0]];
        end
	always@(writeMem)
	begin
	if(writeMem==1)
	memory[Address[4:0]] <= WriteData;
	end
endmodule
