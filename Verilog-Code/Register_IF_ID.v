


module Register_IF_ID(clk,IF_ID_in1,IF_ID_Ctrl,IF_ID_out1,Flush);
    input clk;
    input IF_ID_Ctrl,Flush;
    input [63:0]IF_ID_in1;
    output reg [63:0]IF_ID_out1;
    always@(posedge clk)
    begin
    if (Flush)
    IF_ID_out1 = 64'b0;
    else if (~Flush)
    begin
    if(IF_ID_Ctrl)
     IF_ID_out1<=IF_ID_in1;
     end
    end
endmodule
