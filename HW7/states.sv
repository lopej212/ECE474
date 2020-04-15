module states (
  input reset_n,
  input clk_1ms,
  output reg [2:0] state,
  output reg [2:0] digit_select
  );

  enum reg [2:0]{
    digit_0 = 3'b000,
    digit_1 = 3'b001,
    digit_2 = 3'b010,
    digit_3 = 3'b011,
    digit_4 = 3'b100
  }present_state, next_state;

  always_ff @ (posedge clk_1ms, negedge reset_n) begin
    if(reset_n == 0 )
      begin
        present_state <=digit_4;
      end
    else
      begin
        present_state <= next_state;
      end
  end

  always_comb begin
    next_state = present_state;
    state =4;
    digit_select =4;
    case (present_state)
      digit_0:
        begin
          state = 0;
          next_state = digit_4;
        end
      digit_1:
        begin
          state= 1;
          digit_select = 1;
          next_state = digit_0;
        end
      digit_2:// for the colon
        begin
          state = 2;
          digit_select = 2;
          next_state = digit_1;
        end
      digit_3:
        begin
          state = 3;
          digit_select =3;
          next_state = digit_2;
        end
      digit_4:
        begin
          state = 4;
          digit_select= 4;
          next_state  = digit_3;
        end
      //default: next_state = digit_4;
    endcase
  end

//assign digit_select = (state);


endmodule // state
