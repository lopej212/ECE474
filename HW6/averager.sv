module averager (
  input clk, // 2Mhz
  input [7:0] data_in,
  input add,//from control_2MHz "control_avg"
  input reset_n,
  output reg average_done,// to counter_11bit
  output reg [7:0] data_out);

reg [8:0] sum;// for overflow
// reg [1:0] internal_counter;

enum reg[2:0]{
  IDLE = 3'b000,
  ADD1 = 3'b001,
  ADD2 = 3'b010,
  ADD3 = 3'b011,
  ADD4 = 3'b100
}present_state, next_state;


always_ff @ (posedge clk, negedge reset_n) begin
  if(reset_n == 0)
    begin
      present_state <= IDLE;
    end
  else
    begin
      present_state <= next_state;
    end
end

always_comb begin
  case (present_state)
  IDLE:
    begin
      if(add == 0 )
        begin
          next_state = IDLE;
        end
      else
        begin
          next_state = ADD1;
          sum = 0;//resets the average
          average_done = 0; //reset the flag
        end
    end
  ADD1:
    begin
      if(add == 1)
        begin
          sum= sum+ data_in;
          next_state = ADD2;
        end
      else
        begin
          next_state = ADD1;
        end
    end
  ADD2:
    begin
      if(add==1)
        begin
          sum= sum + data_in;
          next_state = ADD3;
        end
      else
        begin
          next_state = ADD2;
        end
    end
  ADD3:
    begin
      if(add == 1)
        begin
          sum  = sum + data_in;
          next_state = ADD4;
        end
      else
        begin
          next_state = ADD3;
        end
    end
  ADD4:
    begin
      sum = sum + data_in;
      next_state = IDLE;
      average_done = 1;
    end
endcase
end

assign data_out = sum[8:2];// divide by 4

// always_ff @ (posedge clk, negedge reset_n) begin
//   if(reset_n == 0)
//     begin
//       sum <=0;
//       //internal_counter = 3;
//     end
//   else
//     begin
//       if(add == 1)
//         begin
//           sum <= sum + data_in;
//           //internal_counter <= internal_counter - 1;
//
//         end
//       else
//         begin
//           sum <= sum;
//         end
//     end
// end





// //Averager done signal
// always_comb begin
//   if(internal_counter == 0)// might need to try other numbers
//     begin
//       average_done = 1;
//     end
//   else
//     begin
//       average_done = 0;
//     end
// end


endmodule // averager
