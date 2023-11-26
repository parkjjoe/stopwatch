module top(clk, soft_reset, hard_reset,
          start,
          seg,
          seg_sel);
          
input clk;
input soft_reset;
input hard_reset;
input start;
output [7:0] seg;
output [5:0] seg_sel;

wire [3:0] d;
wire [3:0] e;
wire [3:0] f;
wire [3:0] g;
wire [3:0] h;
wire [3:0] i;

stopwatch_top U0_stopwatch_top(.clk(clk),
                           .soft_reset(soft_reset),
                           .hard_reset(hard_reset),
                           .start(start),
                           .d(d),
                           .e(e),
                           .f(f),
                           .g(g),
                           .h(h),
                           .i(i));
                           
seg_controller U1_seg_controller(.clk(clk),
                                 .hard_reset(hard_reset),
                                 .d(d),
                                 .e(e),
                                 .f(f),
                                 .g(g),
                                 .h(h),
                                 .i(i),
                                 .seg(seg),
                                 .seg_sel(seg_sel));


endmodule
