


module Register_MEM_WB(clk,MEM_WB_in1,MEM_WB_out1);
    input clk;
    input [70:0]MEM_WB_in1;
    output reg [70:0]MEM_WB_out1;
    always@(posedge clk)
    begin
    MEM_WB_out1<=MEM_WB_in1;
    end
endmodule
