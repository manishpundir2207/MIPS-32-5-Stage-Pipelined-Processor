module Sign_extended(Immediate,Sign_Immex);
input[15:0]Immediate; 
output reg [31:0]Sign_Immex;
always@(Immediate)
if(Immediate[15]==1) 
begin
Sign_Immex<={{16{Immediate[15]}},Immediate}; 
end
else if (Immediate[15]==0)
begin
Sign_Immex<={{16{Immediate[15]}},Immediate}; 
end
endmodule
