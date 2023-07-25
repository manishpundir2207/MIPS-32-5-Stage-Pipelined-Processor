

module Adder_branch( input [31:0]PC_PLUS_4,Sign_Ex_sll_2,output [31:0] add_out

    );
    assign add_out = PC_PLUS_4 + Sign_Ex_sll_2;
endmodule
