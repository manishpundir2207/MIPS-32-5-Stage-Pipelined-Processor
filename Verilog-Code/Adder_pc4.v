module Adder_pc4(Current_PC,Next_PC);
input[31:0]Current_PC; //current program counter address
output  [31:0]Next_PC; //next program counter address
assign Next_PC=Current_PC+32'd4; 
endmodule
