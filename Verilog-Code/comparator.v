
module comparator( input [31:0] in1, in2, output out);
assign out =~(in1^in2);
endmodule
