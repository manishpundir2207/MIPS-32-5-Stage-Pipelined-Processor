module Shift_left2(input [31:0] Sign_Immex,
output reg [31:0] sll2_out);
always @(Sign_Immex)
begin
sll2_out= Sign_Immex << 2;
end
endmodule
