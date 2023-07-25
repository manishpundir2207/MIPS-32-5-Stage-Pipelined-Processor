module ALU_control (
     ALU_Op1,ALU_Op2,
     Funct,
    ALU_Control
);
input ALU_Op1,ALU_Op2;
input [5:0]Funct;
output  [2:0]  ALU_Control;
reg [2:0]ALU_Ctrl;
assign ALU_Control=ALU_Ctrl;

    always@(ALU_Op1 or ALU_Op2 or Funct)
     begin
        if (ALU_Op1==0 && ALU_Op2 == 0) 
        begin
  ALU_Ctrl = 3'b010;
        end 
        else if(ALU_Op1==0 && ALU_Op2 == 1) 
         begin
     ALU_Ctrl = 3'b110;
        end
         else if(ALU_Op1==1 && ALU_Op2 == 0)
          begin
          case (Funct)
                6'b100100:ALU_Ctrl = 3'b000; // and
                6'b100101:ALU_Ctrl = 3'b001; // or
                6'b100000:ALU_Ctrl = 3'b010; // add
                6'b100010:ALU_Ctrl = 3'b110; // sub
                6'b101010:ALU_Ctrl = 3'b111; // slt
                default:ALU_Ctrl = 3'b000;
            endcase
        end
    end

endmodule