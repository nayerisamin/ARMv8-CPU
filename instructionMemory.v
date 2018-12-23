module InstructionMemory( 
  input [63:0] ReadAddr,
  output [31:0] Instruction
  );
  parameter delay_t = 5;

  reg [7:0] Memory [0:63];
  
  assign Instruction[7:0] = Memory[ReadAddr]; 
  assign Instruction[15:8] = Memory[ReadAddr + 1];
  assign Instruction[23:16] = Memory[ReadAddr + 2];
  assign Instruction[31:24] = Memory[ReadAddr + 3];

endmodule 