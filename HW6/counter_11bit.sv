 module counter_11bit (
   input average_done,
   input clk, //2MHz
   input reset_n,
   output reg [10:0] address_out,
   output reg write_ram
   );

   always_ff @ (posedge clk, negedge reset_n) begin
    if(reset_n == 0)
      begin
        address_out <= 11'h7FF;
        write_ram = 1;
      end
    else if(average_done == 1 )
      begin
        write_ram = 0;
        address_out <= address_out -1;
      end
    else
      begin
        write_ram = 1;
        address_out <= address_out;
      end
   end
endmodule // counter_11bit
