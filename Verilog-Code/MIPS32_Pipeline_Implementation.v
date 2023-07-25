module MIPS32_Pipeline_Implementation(input clock, Reset);
wire [63:0] x1,x2;
wire [31:0] w2,w3,w4,w6,w7,w9,w10;
wire m1,m2,m3,m5,m6,m7,m8,m9;
wire [8:0] n1;
wire [124:0] h1,h2;
wire [2:0] t1;
wire [1:0] ts1,ts2;
wire [74:0] s1,s2;
wire [70:0] g1;
wire [70:0] g2;
assign h1[19:15] = x2[25:21];
assign h1[14:10] = x2[20:16];
assign h1[9:5] = x2[20:16];
assign h1[4:0] = x2[15:11];
assign s1[74:70] = h2[124:120] ;
assign g1[70:69] = s2[74:73] ;
assign g1[36:5] = s2[68:37]  ;
assign g1[4:0]= s2[4:0] ;     

Multiplexer_2x1_32bit Pc_in_mux (.Input1(x1[63:32]),.Input2(w2),.Sel(m1),
.Mux_out(w3));

Adder_pc4 pc_incrementor (.Current_PC(w4),.Next_PC(x1[63:32]));

Instruction_memory PC_out_IFID_in (.PC_Read_address(w4),
.Instruction_Outt(x1[31:0]));

Register_IF_ID IF_ID_reg (.clk(clock),.IF_ID_in1(x1),.IF_ID_Ctrl(m2),
.IF_ID_out1(x2),.Flush(m8));

Control_Unit cu (.Opcode(x2[31:26]),.RegDst(n1[3]),.Branch(n1[6]),
.MemRead(n1[5]),.MemtoReg(n1[7]),.ALUOP1(n1[2]),.ALUOP2(n1[1])
,.MemWrite(n1[4]),.ALUSrc(n1[0]),.RegWrite(n1[8]),.Flush(m8));

Sign_extended se1 (.Immediate(x2[15:0]),.Sign_Immex(h1[51:20]));

Shift_left2 sll2 (.Sign_Immex(h1[51:20]),.sll2_out(w6));

Adder_branch adbc (.PC_PLUS_4(x2[63:32]),.Sign_Ex_sll_2(w6),.add_out(w2));

Hazard_Detection_Unit  hzdu (.IF_ID_Reg_Rt(x2[20:16]),.IF_ID_Reg_Rs(x2[25:21]),
.ID_EX_MemRead(h2[121]),.ID_EX_Reg_Rt(h2[9:5]),.PC_write(m5),.IF_ID_write(m2),
.Mux_HDU_out(m6));

Reg_File_module Rg (.clk(clock),.rs(x2[25:21]),.rt(x2[20:16]),.rd(g2[4:0])
,.write_data(w7),.Read_data1(h1[115:84]),.Read_data2(h1[83:52]),
.Reg_write(g2[70]),.PC_in(w3),.PC_Write(m5),.PC_out(w4));

comparator cmp ( .in1(h1[115:84]),.in2(h1[83:52]),.out(m7));

And1_gate and_br (.in1(m7),.in2(m8),.out(m1));

Multiplexer_2x1_9bit MUX_hzdu (.Input1(n1),.Input2(9'b0),.Sel(m6)
,.Mux_out(h1[124:116]));

Register_ID_EX idex_reg (.clk(clock),.ID_EX_in1(h1),.ID_EX_out1(h2));

ALU_control aluctrl (.ALU_Op1(h2[118]),.ALU_Op2(h2[117]),.Funct(h2[25:20]),
.ALU_Control(t1));

Multiplexer_4x1 alu_mux1 (.a(h2[115:84]),.b(w7),.c(s2[68:37]),.d(),.Sel_2(ts1)
,.ALU_MUX1_out(w9));
  
Multiplexer_4x1 alu_mux2 (.a(h2[83:52]),.b(w7),.c(s2[68:37]),.d(),.Sel_2(ts2)
,.ALU_MUX1_out(s1[36:5])); 

Multiplexer_2x1_32bit Immediate_mux (.Input1(s1[36:5]),.Input2(h2[51:20]),.Sel(h2[116]),
.Mux_out(w10));

ALU alu1 (.R_data1(w9),.R_data2(w10),.ALU_control(t1),
.ALU_Result(s1[68:37]),.zero(s1[69]));
 
Multiplexer_2x1_5bit MUX_rsrt (.Input1(h2[9:5]),.Input2(h2[4:0]),.Sel(h2[119]) 
,.Mux_out(s1[4:0])); 

Forwarding_Unit fu(.ID_EX_Reg_Rs(h2[19:15]),.ID_EX_Reg_Rt(h2[14:10]),
.EX_MEM_Reg_Rd(s2[4:0]),.EX_MEM_RegWrite(s2[74]),.MEM_WB_RegWrite(g2[70]),
.MEM_WB_Reg_Rd(g2[4:0]),.ForwardA(ts1),.ForwardB(ts2));     
 
Register_EX_MEM EX_MEM_Reg (.clk(clock),.EX_MEM_in1(s1),.EX_MEM_out1(s2));  

Data_memory DM ( .Mem_Write(s2[70]),.Mem_Read(s2[71]),.clk(clock),
 .Address(s2[68:37]),.Write_data(s2[36:5]),.Mem_Data(g1[68:37]));
 
Register_MEM_WB MEM_WB_Reg (.clk(clock),.MEM_WB_in1(g1),.MEM_WB_out1(g2));
 
Multiplexer_2x1_32bit last_mux (.Input1(g2[68:37]),.Input2(g2[36:5]),
.Sel(~g2[69]),.Mux_out(w7));
                                 
endmodule