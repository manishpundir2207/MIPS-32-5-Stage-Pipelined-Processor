module Reg_File_module(clk,rs,rt,rd,write_data,Read_data1,
Read_data2,Reg_write,PC_in,PC_Write,PC_out);
input[4:0]rs,rt,rd; 
input[31:0]write_data,PC_in; 
output reg [31:0]Read_data1,Read_data2; 
output  [31:0]PC_out;
input Reg_write;
input PC_Write;
input clk; 
reg[31:0] Reg_File[0:31];
integer i;
initial 
begin
for(i=0;i<32;i=i+1)
begin
Reg_File[i]<=32'b0;
end
end
initial
begin
Reg_File[8]<=32'd8;
Reg_File[9]<=32'd8;
Reg_File[10]<=32'd5;
Reg_File[17]<=32'd8;
Reg_File[18]<=32'd6;
Reg_File[19]<=32'd5;
end
assign PC_out = Reg_File[31];
always@(posedge clk)
begin 
if(PC_Write)
Reg_File[31]=PC_in;
if(Reg_write) 
begin
Reg_File[rd]<=write_data; 
end
end
always@(negedge clk)
begin
Read_data1 = Reg_File[rs];   
Read_data2 = Reg_File[rt]; 
end
endmodule


