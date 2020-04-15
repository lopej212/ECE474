module shift_register (
  input             reset_n,
  input             data_in,
  input             data_en,
  input             clk,//50MHz
  output reg byte_assembled,
  output reg [7:0]  data_out
  );

enum reg [0:0]{
  NOT_ASSEMBLED = 1'b0,
  ASSEMBLED = 1'b1
}byte_ready_ps, byte_ready_ns;

// always_ff @ (posedge clk, negedge reset_n) begin
//   if( reset_n == 0 )
//     begin
//       data_out <= 0;
//       byte_ready_state <= NOT_ASSEMBLED;
//     end
//   else
//     begin
//       if( data_en == 1)
//         begin
//           //data_out <= {data_out[6:0], data_in};//left shift
//           data_out <= {data_in, data_out[7:1]};// right shift
//           byte_ready_state <= NOT_ASSEMBLED;
//         end
//       else
//         begin
//           data_out <= data_out;
//           byte_ready_state <= ASSEMBLED;
//         end
//     end
// end

always_ff @ (posedge clk, negedge reset_n) begin
    if(reset_n == 0)
      begin
        byte_ready_ps <= NOT_ASSEMBLED;
      end
    else
      begin
          byte_ready_ps <= byte_ready_ns;
      end
end

always_comb begin
  //data_out = 0;
  case (byte_ready_ps)
    NOT_ASSEMBLED:
      begin
        byte_assembled = 0;
        if(data_en ==1)
          begin
            data_out = {data_in, data_out[7:1]};// right shift
            byte_ready_ns = NOT_ASSEMBLED;
          end
        else
          begin
            byte_ready_ns = ASSEMBLED;
          end
      end
    ASSEMBLED:
      begin
        byte_assembled = 1;
        if(data_en ==1)
          begin
            byte_ready_ns = NOT_ASSEMBLED;
          end
        else
          begin
            byte_ready_ns = ASSEMBLED;
          end
      end
  endcase
end

//assign byte_assembled = (byte_ready_state);



endmodule // shift_register
