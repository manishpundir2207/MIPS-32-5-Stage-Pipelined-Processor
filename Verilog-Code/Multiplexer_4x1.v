module Multiplexer_4x1(a,b,c,d,Sel_2,ALU_MUX1_out);
input[31:0] a,b,c,d;
input [1:0]Sel_2;
output reg[31:0] ALU_MUX1_out;
always @(*) begin
  case (Sel_2)
    2'b00: ALU_MUX1_out = a;
    2'b01: ALU_MUX1_out = b;
    2'b10: ALU_MUX1_out = c;
    2'b11: ALU_MUX1_out = d;
  endcase
end

endmodule 