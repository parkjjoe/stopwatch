module dec_7seg ( // 7 segment decoder
		a, // 4 bit input
		seg,
		dot); // 8 bit output
		
input [3:0] a;
input dot;
output [7:0] seg;

assign seg[7] = ~(~a[2]&~a[0] | ~a[3]&a[1] | ~a[3]&a[2]&a[0] | a[2]&a[1] | a[3]&~a[2]&~a[1]);
assign seg[6] = ~(~a[3]&~a[2] | ~a[3]&~a[1]&~a[0] | ~a[2]&~a[1] | ~a[3]&a[1]&a[0] | a[3]&~a[1]&a[0] | a[3]&a[1]&~a[0]);
assign seg[5] = ~(~a[3]&~a[1] | ~a[3]&a[0] | ~a[1]&a[0] | ~a[3]&a[2] | a[3]&~a[2]);
assign seg[4] = ~(~a[2]&~a[0] | ~a[2]&a[1] | a[1]&~a[0] | a[2]&~a[1]&a[0] | a[3]&~a[0]);
assign seg[3] = ~(~a[2]&~a[0] | a[1]&~a[0] | a[3]&a[1] | a[3]&a[2]);
assign seg[2] = ~(~a[2]&~a[1]&~a[0] | ~a[3]&a[2] | a[2]&a[1] | a[3]&~a[2]&a[0]);
assign seg[1] = ~(~a[2]&a[1] | a[2]&~a[1] | a[2]&~a[0] | a[3]);
assign seg[0] = ~(dot);

endmodule
