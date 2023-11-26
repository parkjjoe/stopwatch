module start_fsm(
clk,
start,
new_start
);

input clk;
input start;
output reg new_start;
reg [18:0] count;

reg s;

always @ (posedge clk) begin
  if (start) begin
		count <= 1'b0;
		s <= 1'b1;
		new_start <= 1'b0;
  end
  else count <= count + 1'b1;
  if ((count == 19'd50000) & s) new_start <= 1;
  else if (count == 19'd100000) s <= 1'b0;
  else new_start <= 0;
end

endmodule 
