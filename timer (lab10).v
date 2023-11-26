module timer(
  clk,
  hard_reset,
  sec_count,
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
  input [18:0] sec_count;
  input soft_reset;
  
  output reg [3:0] d;
  output reg [3:0] e;
  output reg [3:0] f;
  output reg [3:0] g;
  output reg [3:0] h;
  output reg [3:0] i;
  
  always@(posedge clk or negedge hard_reset) begin
    if (~hard_reset)  d<= 4'd0;
    else begin 
          if ((d==4'd10) || ~soft_reset) d<= 4'd0;
      else begin
    if(sec_count == 19'd499_999) d<= d+4'd1;
    else;
    end
  end
  end

always@(posedge clk or negedge hard_reset) begin
    if (~hard_reset)  e<= 4'd0;
    else begin 
      if ((e==4'd10) || ~soft_reset) e<= 4'd0;
    else begin
    if(d==4'd10) e<= e+4'd1;
    else;
  end
end
end

always@(posedge clk or negedge hard_reset) begin
    if (~hard_reset)  f<= 4'd0;
    else begin 
      if ((f==4'd10) || ~soft_reset) f<= 4'd0;
      else begin
    if(e==4'd10) f<= f+4'd1;
    else;
    end
  end
end

always@(posedge clk or negedge hard_reset) begin
    if (~hard_reset)  g<= 4'd0;
    else begin 
      if ((g==4'd6) || ~soft_reset) g<= 4'd0;
      else begin
    
    if(f==4'd10) g<= g+4'd1;
    else;
    end
  end
end

always@(posedge clk or negedge hard_reset) begin
    if (~hard_reset)  h<= 4'd0;
    else begin 
      if ((h==4'd10) || ~soft_reset) h<= 4'd0;
      else begin
    
    if(g==4'd6) h<= h+4'd1;
    else;
    end
  end
end

always@(posedge clk or negedge hard_reset) begin
    if (~hard_reset)  i<= 5'd0;
    else begin 
      if ((i==4'd6) || ~soft_reset) i<= 4'd0;
      else begin
    
    if(h==4'd10) i<= i+4'd1;
    else;
    end
  end
end

endmodule


