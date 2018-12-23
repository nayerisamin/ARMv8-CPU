module RegBank(
input [0:4]readReg1, 
input [0:4]readReg2,
input [0:4]writeReg,
input [0:63]writeData,
input regWrite,
input clk,
output reg [0:63]readData1,
output reg [0:63]readData2)

parameter delay_t = 5;
reg [63:0] registers [0:31];

assign readData1 = ()?registers[readReg1]:;
assign readData2 = ()?registers[readReg2]:;

always @(posedge clk)
		#delay_t;
		begin

		readData1 = registers[readReg1];
    		readData2 = registers[readReg2];
	
			if(regWrite == 1)
			begin 
			
				registers[writeReg] <= writeData;

			end	
	 
end 
endmodule
