


module Control_Unit(Opcode,RegDst,Jump,Branch,MemRead,MemtoReg,ALUOP1,ALUOP2,MemWrite,ALUSrc,RegWrite,Flush);
input [5:0]Opcode;
output reg RegDst;
output reg Jump;
output reg Branch;
output reg MemRead;
output reg MemtoReg;
output reg ALUOP1;
output reg ALUOP2;
output reg MemWrite;
output reg ALUSrc;
output reg RegWrite;
output reg Flush;
parameter R_type=6'b000000,LW=6'b100011,SW=6'b101011,BEQ=6'b000100,JumP=6'b000010;// i&R types instructions
//always@(Opcode)


initial
begin
                       RegDst<=1'b0; //make RegDst the destination register
					   Jump=1'b0;
					   Branch=1'b0;
					   MemRead=1'b0;
					   MemtoReg=1'b0;
					   ALUOP1=1'b0;
					   ALUOP2=1'b0;
					   MemWrite=1'b0;
					   ALUSrc=1'b0;
					   RegWrite=1'b0;
					    Flush = 1'b0;
	end		
	always@(Opcode)	    
case(Opcode)

          R_type: begin    //in case of R-type instruction
		               RegDst<=1'b1; //make RegDst the destination register
					   Jump<=1'b0;
					   Branch<=1'b0;
					   MemRead<=1'b0;
					   MemtoReg<=1'b0;
					   ALUOP1<=1'b1;
					   ALUOP2<=1'b0;
					   MemWrite<=1'b0;
					   ALUSrc<=1'b0;
					   RegWrite<=1'b1; //write in registers files
					   Flush = 1'b0;
					
		end
						 
        LW: begin  //in case of load woRegDst instruction
		               RegDst<=1'b0; //make RegDst the destination register
					   Jump<=1'b0;
					   Branch<=1'b0;
					   MemRead<=1'b1;
					   MemtoReg<=1'b1;
					   ALUOP1<=1'b0;
					   ALUOP2<=1'b0;
					   MemWrite<=1'b0;
					   ALUSrc<=1'b1;
					   RegWrite<=1'b1; //write in registers files
					Flush = 1'b0;
                                       
			   end
		   
			SW: begin  //in case of store woRegDst instruction
			        RegDst<=1'bx; //make RegDst the destination register
					   Jump<=1'b0;
					   Branch<=1'b0;
					   MemRead<=1'b0;
					   MemtoReg<=1'bx;
					   ALUOP1<=1'b0;
					   ALUOP2<=1'b0;
					   MemWrite<=1'b1;
					   ALUSrc<=1'b1;
					   RegWrite<=1'b0; //write in registers files
					 Flush = 1'b0;
			    end
					
		   BEQ: begin //in case of Branch if equal instruction
			        
					  
					   RegDst<=1'bx; //make RegDst the destination register
					   Jump<=1'b0;
					   Branch<=1'b1;
					   MemRead<=1'b0;
					   MemtoReg<=1'bx;
					   ALUOP1<=1'b0 ;
					   ALUOP2<=1'b1 ;
					   MemWrite<=1'b0;
					   ALUSrc<=1'b0;
					   RegWrite<=1'b0; //write in registers files
					   Flush <= 1'b1;
			    end
			
			JumP: begin
			        RegDst<=1'bx; //make RegDst the destination register
					   Jump<=1'b1;
					   Branch<=1'b0;
					   MemRead<=1'b0;
					   MemtoReg<=1'bx;
					   ALUOP1<=1'b0 ;
					   ALUOP2<=1'b0 ;
					   MemWrite<=1'b0;
					   ALUSrc<=1'b0;
					   RegWrite<=1'b0; //write in registers files
					   //Flush = 1'b0;
				end    
				
			    endcase	  

//end
endmodule
