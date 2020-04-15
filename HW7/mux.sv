module mux (
  input [3:0] min0,
  input [3:0] min1,
  input [3:0] hour0,
  input [3:0] hour1,
  input [3:0] colon,
  input [2:0] state,
  output reg [3:0] digit_out
  );

  always_comb
    begin
      case(state)
        0: digit_out = min0;
        1: digit_out = min1;
        2: digit_out = colon;
        3: digit_out = hour0;
        4: digit_out = hour1;
        default: digit_out = min0;
      endcase
    end
endmodule // mux
