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
  

  assign 
  {ALUOp, ALUSrc, 
   Branch, MemRead, MemWrite,
   RegWrite, MemtoReg}
   = ControlOut;
   
   always @(op)
    casex(op)
      // CBZ
      11'b10110100xxx: ControlOut = 8'b0101000x; // CBZ
      
      11'b11111000010: ControlOut = 8'b00101011; // LDUR
      
      11'b11111000000: ControlOut = 8'b0010010x; // STUR
      
      11'b10001011000: ControlOut = 8'b10000010; // R-Format
    endcase
    
endmodule