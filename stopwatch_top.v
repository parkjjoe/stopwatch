module stopwatch_top(
                     clk,
                     hard_reset,
                     start,
		     soft_reset,
                     d,
                     e,
                     f,
                     g,
                     h,
                     i
                     );
                     
input clk;
input hard_reset;
input start;
input soft_reset;

output [3:0] d;
output [3:0] e;
output [3:0] f;
output [3:0] g;
output [3:0] h;
output [3:0] i;

wire [18:0] sec_count;
wire [1:0] en;
wire new_start;

sec_counter U0_sec_counter(
                        .clk(clk),
                        .hard_reset(hard_reset),
                        .en(en),
                        .sec_count(sec_count)
                        );

start_fsm U0_start_fsm(.clk(clk),
			.start(start),
			.new_start(new_start));
                        
stopwatch_fsm U1_stopwatch_fsm(
                           .clk(clk),
                           .soft_reset(soft_reset),
                           .hard_reset(hard_reset),
                           .start(new_start),
                           .en(en)
                           );
           
timer U2_timer(
            .clk(clk),
            .hard_reset(hard_reset),
	     .soft_reset(soft_reset),
            .sec_count(sec_count),
            .d(d),
            .e(e),
            .f(f),
            .g(g),
            .h(h),
            .i(i)
            );
            
          endmodule                          
