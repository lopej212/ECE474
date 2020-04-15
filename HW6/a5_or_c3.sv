module a5_or_c3 (
  input reset_n,// might not be needed
  input [7:0] data_in,
  output reg data_available
  );

// always_ff @ (negedge reset_n) begin
//   if( reset_n == 0 )
//     begin
//       data_available <= 0;
//     end
//   else
//     begin
//       data_available <= data_available;
//     end
// end

always_comb begin
  if( data_in == 8'hC3 )
    begin
      data_available = 1;
    end
  else if( data_in === 8'hA5)
    begin
      data_available =1;
    end
  else
    begin
      data_available = 0;
    end
end

endmodule // a5_or_c3
