module ALU(input [63:0]A,
input [63:0]B,
input [3:0]op,
output reg z,
output reg [63:0]Y); //ALU Output

  always@(A,B,op)
    begin
      case(op)
      		  4'b0000:
				Y = A&B;
		  4'b0001:
				Y = A|B;
		  4'b0010:
				Y = A+B;
		  4'b0110:
				Y = A-B;
	       	  4'b1100:
				Y = ~(A | B);
          	  4'b0111:
				Y =B;  
	endcase
      if(Y==64'b0)    
        begin
          z <= 1;
        end
      else
        begin
          z <= 0;
        end
    end
   endmodule
