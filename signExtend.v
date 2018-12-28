module SignExtend(
input [31:0] Instruction,
output reg [63:0] out_ins);  
  //reg[63:0] sign_E;
  
  always @(Instruction) begin 
    
     if (extend[31:26] == 6'b000101) //B-type
	begin
      
        extended[25:0] = extend[25:0];
        extended[63:26] = {38{extended[25]}};
      
    end 
	else if (extend[31:24] == 8'b10110100)//CBZ-type 
	begin 

        extended[19:0] = extend[23:5];
        extended[63:20] = {44{extended[19]}};
        
    end 
	else
	begin 
        extended[9:0] = extend[20:12];
        extended[63:10] = {54{extended[9]}}; //D-type 
end
  end
  
endmodule
