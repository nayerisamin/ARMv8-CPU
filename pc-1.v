module pc(input clk,
    input reset,
    input write,
    input newpc,
    output reg oldpc)
    parameter delay_t=5;


always@(posedge clk)
    begin
        if(reset)
            #delay_t
            begin
                newpc <= 0;
            end
        else if(write)
            #delay_t
            begin
                oldpc <= newpc;
            end             
    end
endmodule
