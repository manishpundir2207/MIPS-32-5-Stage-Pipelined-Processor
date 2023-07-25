module Instruction_memory(PC_Read_address, 
Instruction_Outt);
input [31:0] PC_Read_address; // byte address of current instruction
output reg [31:0] Instruction_Outt; // current Instruction_Outt
reg [7:0] I_M[0:4095]; // Instruction_Outt memory of size 4096 bytes
initial
begin

//sub $t3(11) $t1(9) $t2(10)
I_M[0] = 8'h01;
I_M[1] = 8'h2a;
I_M[2] = 8'h58;
I_M[3] = 8'h22;
//and $t4(12) $t1(9) $t2(10)    
I_M[4] = 8'h01;
I_M[5] = 8'h2a;
I_M[6] = 8'h60;
I_M[7] = 8'h24;
//or $t5(13) $t1(9) $t2(10)   
I_M[8] = 8'h01;
I_M[9] = 8'h2a;
I_M[10] = 8'h68;
I_M[11] = 8'h25;
//add $t6(14) $t1(9) $t2(10) 
I_M[12] = 8'h01;
I_M[13] = 8'h2a;
I_M[14] = 8'h70;
I_M[15] = 8'h20;
//sub $t7(15) $t6(14) $t1(9)
I_M[16] = 8'h01;
I_M[17] = 8'hc9;
I_M[18] = 8'h78;
I_M[19] = 8'h22;
//or $t8(24) $t6(14) $t7(15)
I_M[20] = 8'h01;
I_M[21] = 8'hcf;
I_M[22] = 8'hc0;
I_M[23] = 8'h25;
//and $t9(25) $t7(15) $t8(24)
I_M[24] = 8'h01;
I_M[25] = 8'hf8;
I_M[26] = 8'hc8;
I_M[27] = 8'h24;
//lw $s5(21) 0x0001($s1(17))
I_M[28] = 8'h8e;
I_M[29] = 8'h35;
I_M[30] = 8'h00;
I_M[31] = 8'h01;
//stall
//add $s6(22) $s5(21) $s2(18)
I_M[32] = 8'h02;
I_M[33] = 8'hb2;
I_M[34] = 8'hb0;
I_M[35] = 8'h20;
// beq $t0(8) $t1(9) 0x0020  
I_M[36] = 8'h11;
I_M[37] = 8'h09;
I_M[38] = 8'h00;
I_M[39] = 8'h20;
//dummy instr2
I_M[40] = 8'h01;
I_M[41] = 8'h51;
I_M[42] = 8'h98;
I_M[43] = 8'h20;
//sub $s7(23) $t1(9) $t2(10)
I_M[168] = 8'h01;
I_M[169] = 8'h2a;
I_M[170] = 8'hb8;
I_M[171] = 8'h22;

end 
always @(PC_Read_address)
begin
Instruction_Outt = {I_M[PC_Read_address], 
I_M[PC_Read_address+32'd1], I_M[PC_Read_address+32'd2], 
I_M[PC_Read_address+32'd3]};
end
endmodule