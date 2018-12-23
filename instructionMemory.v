module InstructionMemory( 
  input [63:0] ReadAddr,
  output reg [31:0] Instruction
  );
  parameter delay_t = 5;

  reg [31:0] Memory [0:63];
  
  
  initial
	  #delay_t
	begin
		Memory[0]    = 32'h8b1f03e5;
		Memory[1]    = 32'hf84000a4;
		Memory[2]    = 32'h8b040086;
       	 	Memory[3]    = 32'hf80010a6;
	end
         
	 
end

endmodule 
