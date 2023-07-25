module ALU(R_data1,R_data2,ALU_control,ALU_Result,zero);
parameter 
add=3'b010,
And_op=3'b000,
Or_op=3'b001,
sub=3'b110,
slt=3'b111;
input[31:0]R_data1,R_data2; //2 source operands rs ,rt
input[2:0]ALU_control; 
output reg[31:0]ALU_Result;
output  zero;
always@(*)
begin
case(ALU_control)
 And_op: ALU_Result = R_data1 & R_data2; // and operation of R_data1 and R_data2
 Or_op: ALU_Result = R_data1 | R_data2; // or operation of R_data1 and R_data2
 add: ALU_Result = R_data1 + R_data2; //addition of R_data1 and R_data2
 sub: ALU_Result = R_data1 - R_data2;  //subtraction of R_data1 and R_data2
 slt: begin
if(R_data1<R_data2) //if the first source operands(rs) less than the second source operands(rt)
ALU_Result<=32'd1;
else 
ALU_Result=32'd0;
end	  
default:  ALU_Result=R_data1 + R_data2;
endcase
end
assign zero =(ALU_Result==0)?1:0;
endmodule

