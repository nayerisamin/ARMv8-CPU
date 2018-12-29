module pc(input clk,
    input reset,
    input write,
    input [63:0]newpc,
    output reg[63:0] oldpc);
    parameter delay_t=5;


always@(posedge clk)
    begin
        if(reset)
            #delay_t
            begin
                oldpc <= 0;
            end
        else if(write)
            #delay_t
            begin
                oldpc = newpc;
            end  
     end           
    endmodule
