module control_2MHz (
    input reset_n,
    input clk,
    input empty,
    output reg control_avg// connect to "add" in averager
  );

//AVERAGER Control
enum reg [0:0]{
  read = 1'b1,
  no_read = 1'b0
} average_ps, averager_ns;

always_ff @ (posedge clk, negedge reset_n) begin
  if(reset_n == 0)
    begin
      average_ps <= no_read;
    end
  else
    begin
      average_ps <= averager_ns;
    end
end

always_comb begin
    case(average_ps)
      read:
        begin
          control_avg =1;
          if(empty == 0)
            begin
              averager_ns = read;
            end
          else
            begin
              averager_ns = no_read;
            end
        end
      no_read:
        begin
          control_avg = 0;
            if(empty == 0)
              begin
                averager_ns = read;
              end
            else
              begin
                averager_ns = no_read;
              end
        end
    endcase
end

endmodule // control_2MHz
