module MUX(
input [63:0] A,
input [63:0] B,
input select,
output[63:0] Y);
	parameter delay_t =5;
		 
assign #delay_t  Y = (select)?A:B;
endmodule
