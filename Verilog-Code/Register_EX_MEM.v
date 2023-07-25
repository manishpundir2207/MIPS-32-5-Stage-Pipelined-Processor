


module Register_EX_MEM(clk,EX_MEM_in1,EX_MEM_out1);
    input clk;
    input [74:0]EX_MEM_in1;
    output reg [74:0]EX_MEM_out1;
    always@(posedge clk)
    begin
    EX_MEM_out1<=EX_MEM_in1;
    end
endmodule
