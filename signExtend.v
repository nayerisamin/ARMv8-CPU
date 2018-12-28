module SignExtend(
input [31:0] Instruction,
output reg [63:0] out_ins);  
  //reg[63:0] sign_E;
  
  always @(Instruction) begin 
    
     if (Instruction[31:26] == 6'b000101) //B-type
	begin
      
        out_ins[25:0] = Instruction[25:0];
        out_ins[63:26] = {38{out_ins[25]}};
      
    end 
	else if (Instruction[31:24] == 8'b10110100)//CBZ-type 
	begin 

        out_ins[19:0] = Instruction[23:5];
        out_ins[63:20] = {44{out_ins[19]}};
        
    end 
	else
	begin 
        out_ins[9:0] = Instruction[20:12];
        out_ins[63:10] = {54{out_ins[9]}}; //D-type 
end
  end
  
endmodule
