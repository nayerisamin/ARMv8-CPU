module pc(input clk,
    input reset,
    input write,
    input newpc,
    output reg oldpc)



always@(posedge clk)
    begin
        if(reset)
            begin
                newpc <= 0;
            end
        else if(write)
            begin
                oldpc <= newpc;
            end             
    end
endmodule
