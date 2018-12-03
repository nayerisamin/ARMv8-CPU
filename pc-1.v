module pc(input clk,
    input reset,
    input write,
    input newpc,
    output oldpc)



always@(posedge clk)
    begin
        if(reset)
            begin
                newpc <= 0;
            end
        else
            begin
                oldpc <= newpc + write;
            end             
    end
endmodule