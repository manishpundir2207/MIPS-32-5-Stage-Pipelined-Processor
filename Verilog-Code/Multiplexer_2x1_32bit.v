module Multiplexer_2x1_32bit(Input1,Input2,Sel,Mux_out);
input[31:0]Input1,Input2;
input Sel;
output reg [31:0]Mux_out;
always@(Input1 or Input2 or Sel)
begin 
if(Sel)
Mux_out<=Input2;
else
Mux_out<= Input1;
end
endmodule

module Multiplexer_2x1_9bit(Input1,Input2,Sel,Mux_out);
input[8:0]Input1,Input2;
input Sel;
output reg [8:0]Mux_out;
always@(Input1 or Input2 or Sel)
begin 
if(Sel)
Mux_out<=Input2;
else
Mux_out<= Input1;
end
endmodule
module Multiplexer_2x1_5bit(Input1,Input2,Sel,Mux_out);
input[4:0]Input1,Input2;
input Sel;
output reg [4:0]Mux_out;
always@(Input1 or Input2 or Sel)
begin 
if(Sel)
Mux_out<=Input2;
else
Mux_out<= Input1;
end
endmodule