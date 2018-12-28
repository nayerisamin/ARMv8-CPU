module Control(
  input [10:0] op,
  output [1:0] ALUOp,
  output ALUSrc,
  output Branch,
  output UncondBranch,
  output MemRead,
  output MemWrite,
  output RegWrite,
  output MemtoReg
  ); 
  
  reg [7:0] ControlOutput;

  wire [2:0] opcode = 
  {op[6], op[4], op[1]};

  

  assign 
  {ALUOp, ALUSrc, 
   Branch, MemRead, MemWrite,
   RegWrite, MemtoReg}
   = ControlOutput;
   
   always @(opcode)
    casex(opcode)

      11'b10110100xxx: ControlOutput = 8'b0101000x; // CBZ
      
      11'b11111000010: ControlOutput = 8'b00101011; // LDUR
      
      11'b11111000000: ControlOutput = 8'b0010010x; // STUR
      
      11'b10001011000: ControlOutput = 8'b10000010; // R-Format
 
    endcase
endmodule
