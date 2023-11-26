module counter( // 10bit counter
              clk,
              hard_reset,
            dp_count); // 10bit counter

parameter N=10;
input clk;
input hard_reset;
output reg [N-1:0] dp_count;

always @ (posedge clk or negedge hard_reset) begin
  if (~hard_reset) dp_count <=0;
  else dp_count <= dp_count+1'b1;
end

endmodule
