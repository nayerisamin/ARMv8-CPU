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
  
  reg [8:0] ControlOutput;  

  assign 
  {ALUOp[1],ALUOp[0], ALUSrc, 
   Branch, MemRead, MemWrite,
   RegWrite, MemtoReg}
   = ControlOutput;
   
   always @(op)
    casex(op)

      11'b10110100xxx: ControlOutput = 9'b0101000x; // CBZ
      
      11'b11111000010: ControlOutput = 9'b00101011; // LDUR
      
      11'b11111000000: ControlOutput = 9'b0010010x; // STUR
      
      11'b10001011000: ControlOutput = 9'b10000010; // R-Format
 
    endcase
endmodule
