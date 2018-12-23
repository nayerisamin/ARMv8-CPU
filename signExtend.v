module SignExtend(
input [31:0] Instruction,
output reg [63:0] out_ins
  );
  
  reg sign_E;
  
  always @(Instruction) begin 
    
    case(Instruction)
      
      
      end 
      
    endcase
  end
  
endmodule
