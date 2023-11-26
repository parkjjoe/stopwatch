// The system clock is set at 50MHz, hence I set sec_count to 19bits.
// When hard_reset is pressed, sec_count is reset to 0. When 'en' is T0, a wait state, so the value of sec_count remains unchanged at 0.
// When 'en' is T1, indicating the start button has been pressed, so sec_count increases by 1.
// When 'en' is T2, representing a state where the stopwatch has been started and then paused, sec_count maintains the same value.
// Since sec_count is 19bits, it counts up to 520,000 and the time is delayed, so it was hard-coded to 500,000.
module sec_counter(
              clk,
              hard_reset,
            sec_count,
            en);
            
input clk;
input hard_reset;
input [1:0] en;

output reg [18:0] sec_count;

parameter T0=2'b00;
parameter T1=2'b01;
parameter T2=2'b10;

always @ (posedge clk or negedge hard_reset) begin
  if (~hard_reset) sec_count <=0;
else begin 
 if(en == T0) sec_count <=0; 
else begin
if(en == T1) sec_count <= sec_count+19'd1; 

else begin
if (en == T2) sec_count <= sec_count;
if(sec_count == 19'd500_000) sec_count <= 0; 
end
end
end
end
endmodule
