module clock(
  input             reset_n,             //reset pin
  input             clk_1sec,            //1 sec clock
  input             clk_1ms,             //1 mili sec clock
  input             mil_time,            //mil time pin
  output reg [6:0]  segment_data,        // output 7 segment data
  output reg [2:0]  digit_select         // digit select
  );

//internal regs
reg [4:0] hrs_mil = 5'b0;
reg [4:0] hrs_std = 5'b1100;
reg [5:0] mins = 6'b0;
reg [5:0] secs = 6'b0;


//wires
logic [2:0] state_wire;
logic [3:0] digit_out_wire;

//outgoing to mux
reg [3:0] min_ones;
reg [3:0] min_tens;
reg [3:0] hrs_ones;
reg [3:0] hrs_tens;
reg [3:0] colon = 4'b1010;//colon initial off (d10)


always_ff @ (posedge clk_1sec) begin
  // colon ticker
  if (colon == 4'b1011) begin
    colon <= 4'b1010;
  end
  else
    begin
      colon <= 4'b1011;
    end
end

always_ff @ (posedge clk_1sec, negedge reset_n) begin
  //Second, min, and hour counter
  if(reset_n == 0 )
    begin
      secs <= 6'b0;
    end
  else
    begin
      if(secs == 59)
        begin
          secs  <= 0;
          if (mins == 59) begin
            mins <= 0;
            //Military time
            if (hrs_mil == 23) begin
              hrs_mil<=0;
            end
            else
              begin
                hrs_mil <= hrs_mil + 1;
              end
            // Standard time
            if (hrs_std == 12) begin
              hrs_std <= 1;
            end
            else
              begin
                hrs_std <= hrs_std + 1;
              end
          end
          else
            begin
              mins <= mins +1;
            end
        end
      else
        begin
          secs <= secs +1;
        end
    end
end

//Parsing the segment_data
assign min_ones = (mins%10);
assign min_tens = (mins/10)%10;

always_comb begin
  if(mil_time == 1)
    begin
      hrs_ones = (hrs_mil%10);
      hrs_tens = (hrs_mil/10)%10;
    end
  else
    begin
      hrs_ones = (hrs_std%10);
      hrs_tens = (hrs_std/10)%10;
    end
end

mux mux_0(
  .min0       (min_ones),
  .min1       (min_tens),
  .hour0      (hrs_ones),
  .hour1      (hrs_tens),
  .colon      (colon),
  .state      (state_wire),
  .digit_out  (digit_out_wire)
);

states states_0(
  .reset_n      (reset_n),
  .clk_1ms      (clk_1ms),
  .state        (digit_select),
  .digit_select (state_wire)
);

decoder decoder_0(
  .digit_out  (digit_out_wire),
  .segment_data (segment_data)
);


endmodule//clock
