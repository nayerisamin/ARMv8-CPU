module MUX(output reg [63:0] Y,
input [63:0] A,
input [63:0] B,
input select);
	parameter delay_t =5;
		assign #delay_t Y = (select)?A:B;
endmodule
