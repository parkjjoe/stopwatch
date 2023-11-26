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
