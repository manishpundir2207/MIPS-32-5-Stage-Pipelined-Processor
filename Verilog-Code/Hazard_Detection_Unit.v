module Hazard_Detection_Unit(IF_ID_Reg_Rt,IF_ID_Reg_Rs,ID_EX_MemRead,ID_EX_Reg_Rt,PC_write,
IF_ID_write,Mux_HDU_out);
input ID_EX_MemRead;
input [4:0] IF_ID_Reg_Rt,IF_ID_Reg_Rs,ID_EX_Reg_Rt;
output reg PC_write,IF_ID_write,Mux_HDU_out;
initial
begin
IF_ID_write = 1'b1;
PC_write = 1'b1;
end
always@(*)
begin
if((ID_EX_MemRead)&&((ID_EX_Reg_Rt==IF_ID_Reg_Rs) || (ID_EX_Reg_Rt==IF_ID_Reg_Rt)))
begin
PC_write=0;
IF_ID_write=0;
Mux_HDU_out=1;
end
else
begin
PC_write=1;
IF_ID_write=1;
Mux_HDU_out=0;
end
end
endmodule
