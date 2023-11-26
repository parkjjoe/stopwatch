// To display minutes, seconds, and 1/100 seconds in the segment, timer's 'd', 'e', 'f', 'g', 'h', and 'i' are added as input.
// 'd' must be shown in units of 1/100 second, 'e' must be shown in units of 1/10 second, 'f' must be shown in units of 1 second, 'g' must be shown in units of 10 seconds, 'h' must be shown in units of 1 minute, and 'i' must be shown in units of 10 minutes.
// To display '0' on the far-right segment when pressing the hard_reset for initialization, it was programmed as S5.
// When dp_count reaches 10’h3FF, it moves to the next state.
// It appears that 6 segments are turned on at the same time, because they are turned on very quickly in order from S0 to S5 according to dp_count.
module dp_fsm(
clk, hard_reset, dot,
dp_count, // count value
a, // segment data in
seg_sel, // segment select
d, e, f, g, h, i); 

input clk;
input hard_reset;
input [9:0] dp_count;
input [3:0] d;
input [3:0] e;
input [3:0] f;
input [3:0] g;
input [3:0] h;
input [3:0] i;
output reg [3:0] a;
output reg [5:0] seg_sel;
output reg dot;

reg [2:0] state, next_state;
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b011;
parameter S3=3'b010;
parameter S4=3'b100;
parameter S5=3'b101;

// status register
always @ (posedge clk or negedge hard_reset) begin
  if (~hard_reset) state <= S5;
  else state <= next_state;
end

// next state logic
always @ (state or dp_count) begin
  case (state)
    S0: if (dp_count==10'h3FF) next_state=S1;
        else next_state=S0;
    S1: if (dp_count==10'h3FF) next_state=S2;
        else next_state=S1;
    S2: if (dp_count==10'h3FF) next_state=S3;
        else next_state=S2;
    S3: if (dp_count==10'h3FF) next_state=S4;
        else next_state=S3;
    S4: if (dp_count==10'h3FF) next_state=S5;
        else next_state=S4;
    S5: if (dp_count==10'h3FF) next_state=S0;
        else next_state=S5;
    default: next_state=S0;
  endcase
end

// output logic
always @ (state) begin
  if (state==S0) begin
    a=i;
    dot=0;
    seg_sel=6'h20;
  end
  else if (state==S1) begin
    a=h;
    dot=1;
    seg_sel=6'h10;
  end
  else if (state==S2) begin
    a=g;
    dot=0;
    seg_sel=6'h08;
  end
  else if (state==S3) begin
    a=f;
    dot=1;
    seg_sel=6'h04;
  end
  else if (state==S4) begin
    a=e;
    dot=0;
    seg_sel=6'h02;
  end
  else if (state==S5) begin
    a=d;
    dot=0;
    seg_sel=6'h01;
  end
end

endmodule
