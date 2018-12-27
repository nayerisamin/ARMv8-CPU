module RegBank(
input [5:0]readReg1, 
input [5:0]readReg2,
input [5:0]writeReg,
input [63:0]writeData,
input regWrite,
input clk,
output [63:0]readData1,
output [63:0]readData2);

parameter delay_t = 5;
reg [63:0] registers [0:31];

assign readData1 = registers[readReg1];
assign readData2 = registers[readReg2];

always @(posedge clk) begin
		#delay_t;
		
			if(regWrite)
				registers[writeReg] = writeData;
	 
		end 
endmodule
