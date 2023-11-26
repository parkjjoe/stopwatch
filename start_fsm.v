// When the start or pause button is pressed, numerous counts and clk values enter during the period when the 0 and 1 signals fluctuate before stabilizing. Therefore, the setup is made such that a proper start signal and posedge clk are received after a certain amount of count value is registered.
// The start and end of the count can be determined based on 's'.
// The new_start is set to become 1 when the count reaches 50,000, thereby skipping the phase where the start oscillates between 0 and 1.
// Consequently, the stopwatch_fsm.v module receives input when start is 1.
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
