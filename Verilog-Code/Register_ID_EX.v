


module Register_ID_EX(clk,ID_EX_in1,ID_EX_out1);
    input clk;
    input [124:0]ID_EX_in1;
    output reg [124:0]ID_EX_out1;
    always@(posedge clk)
    begin
    ID_EX_out1<=ID_EX_in1;
    end
endmodule
