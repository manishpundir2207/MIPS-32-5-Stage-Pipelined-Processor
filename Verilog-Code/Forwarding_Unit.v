


module Forwarding_Unit(ID_EX_Reg_Rs,ID_EX_Reg_Rt,EX_MEM_Reg_Rd,EX_MEM_RegWrite,MEM_WB_RegWrite,
MEM_WB_Reg_Rd,ForwardA,ForwardB);
input [4:0] ID_EX_Reg_Rs,ID_EX_Reg_Rt,EX_MEM_Reg_Rd,MEM_WB_Reg_Rd;
input EX_MEM_RegWrite,MEM_WB_RegWrite;
output reg[1:0]ForwardA,ForwardB; 
always@(*)
begin
if((EX_MEM_RegWrite) && ~(EX_MEM_Reg_Rd ==0) && (EX_MEM_Reg_Rd ==ID_EX_Reg_Rs ) )
ForwardA=2'b10;
else if ((MEM_WB_RegWrite) && ~(MEM_WB_Reg_Rd ==0) && (MEM_WB_Reg_Rd ==ID_EX_Reg_Rs ))
ForwardA=2'b01;
else
ForwardA=2'b00;
end
always@(*)
begin
if((EX_MEM_RegWrite) && ~(EX_MEM_Reg_Rd ==0) && (EX_MEM_Reg_Rd ==ID_EX_Reg_Rt ) )
ForwardB=2'b10;
else if ((MEM_WB_RegWrite) && ~(MEM_WB_Reg_Rd ==0) && (MEM_WB_Reg_Rd ==ID_EX_Reg_Rt ))
ForwardB=2'b01;
else
ForwardB=2'b00;
end
endmodule
