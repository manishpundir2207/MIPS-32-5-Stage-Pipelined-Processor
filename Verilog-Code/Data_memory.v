module Data_memory(input Mem_Write,Mem_Read,clk,input[31:0]Address,Write_data,output reg [31:0] Mem_Data);

reg[7:0] Data_Memory[0:1023]; 

initial

begin

// LW $t1 0x0030 $zero
  Data_Memory[0] = 8'h8c;
  Data_Memory[1] = 8'h09;
  Data_Memory[2] = 8'h00;
  Data_Memory[3] = 8'h30;
    
//LW $t2 0x0034 $zero
  Data_Memory[4] = 8'h8c;
  Data_Memory[5] = 8'h0a;
  Data_Memory[6] = 8'h00;
  Data_Memory[7] = 8'h34;
   
// sub t3,t1,t2
  Data_Memory[8] = 8'h00;
  Data_Memory[9] = 8'h00;
  Data_Memory[10] = 8'h00;
  Data_Memory[11] = 8'h04;
  
// and t4,t1,t2
  Data_Memory[12] = 8'h01;
  Data_Memory[13] = 8'h2a;
  Data_Memory[14] = 8'h60;
  Data_Memory[15] = 8'h24;
  
// or t5,t1,t2;
  Data_Memory[16] = 8'h01;
  Data_Memory[17] = 8'h2a;
  Data_Memory[18] = 8'h68;
  Data_Memory[19] = 8'h25;

// add t6,t1,t2;
  Data_Memory[20] = 8'h01;
  Data_Memory[21] = 8'h2a;
  Data_Memory[22] = 8'h70;
  Data_Memory[23] = 8'h20;

//  slt t7,t1,t2
  Data_Memory[24] = 8'h01;
  Data_Memory[25] = 8'h2a;
  Data_Memory[26] = 8'h78;
  Data_Memory[27] = 8'h2a;

// SW $t1 0x0038 $zero
  Data_Memory[28] = 8'hac;
  Data_Memory[29] = 8'h09;
  Data_Memory[30] = 8'h00;
  Data_Memory[31] = 8'h38;
  

// BEQ $t2 $t3 0x0002
  Data_Memory[32] = 8'h11;
  Data_Memory[33] = 8'h4b;
  Data_Memory[34] = 8'h00;
  Data_Memory[35] = 8'h02;
// dummy instr1
  Data_Memory[36] = 8'h01;
  Data_Memory[37] = 8'h2a;
  Data_Memory[38] = 8'hc0;
  Data_Memory[39] = 8'h22;
//Dummy instr
  Data_Memory[40] = 8'h05;
  Data_Memory[41] = 8'h06;
  Data_Memory[42] = 8'h00;
  Data_Memory[43] = 8'h00;
//J 0x0000000
  Data_Memory[44] = 8'h08;
  Data_Memory[45] = 8'h00;
  Data_Memory[46] = 8'h00;
  Data_Memory[47] = 8'h00;
  // Data Memory
  Data_Memory[48] = 8'h00;
  Data_Memory[49] = 8'h00;
  Data_Memory[50] = 8'h00;
  Data_Memory[51] = 8'h04;
  
  Data_Memory[52] = 8'h00;
  Data_Memory[53] = 8'h00;
  Data_Memory[54] = 8'h00;
  Data_Memory[55] = 8'h02;
  
end

always@(*)

begin 
 if(Mem_Read)
begin
        Mem_Data[31:24]=Data_Memory[Address];
        Mem_Data[23:16]=Data_Memory[Address+32'd1];
        Mem_Data[15:8]=Data_Memory[Address+32'd2];        
        Mem_Data[7:0]=Data_Memory[Address+32'd3];

end
end 
always@(posedge clk)
begin
 if(Mem_Write)

begin
   Data_Memory[Address]= Write_data[31:24]; 
   Data_Memory[Address+32'd1]=Write_data[23:16];
   Data_Memory[Address+32'd2]=Write_data[15:8];
   Data_Memory[Address+32'd3]=Write_data[7:0];
end
 
end


endmodule
