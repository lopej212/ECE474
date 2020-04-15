module control_50MHz (
    input reset_n,
    input clk,
    input byte_assembled,
    input a5_or_c3,
    input full,
    output reg write_control
    );

//Byte control
enum reg[2:0]{
  HEADER = 3'b000,
  TEMP1  = 3'b001,
  TEMP2  = 3'b010,
  TEMP3  = 3'b011,
  TEMP4  = 3'b100
}packet_ps, packet_ns;

always_ff @ (posedge clk, negedge reset_n) begin
  if (reset_n == 0 ) begin
    packet_ps <= HEADER;
  end
  else
    begin
      packet_ps <= packet_ns;
    end
end

always_comb begin
 case (packet_ps)
    HEADER:
      begin
        if(byte_assembled == 1)
          begin
            packet_ns = TEMP1;
          end
        else
          begin
            packet_ns = HEADER;
          end
      end
    TEMP1:
      begin
        if(byte_assembled == 1)
          begin
            packet_ns = TEMP2;
          end
        else
          begin
            packet_ns = TEMP1;
          end
      end
    TEMP2:
      begin
        if(byte_assembled == 1)
          begin
            packet_ns = TEMP3;
          end
        else
          begin
            packet_ns = TEMP2;
          end
      end
    TEMP3:
      begin
        if(byte_assembled == 1 )
          begin
            packet_ns = TEMP4;
          end
        else
          begin
            packet_ns = TEMP3;
          end
      end
    TEMP4:
      begin
        if(byte_assembled === 1)
          begin
            packet_ns = HEADER;
          end
        else
          begin
            packet_ns = TEMP4;
          end
      end
  endcase
end

//FIFO control
enum reg[0:0]{
  WRITE    = 1'b1,
  NO_WRITE = 1'b0
} fifo_ps, fifo_ns;

always_ff @ (posedge clk, negedge reset_n) begin
  if(reset_n == 0)
    begin
      fifo_ps <= NO_WRITE;
    end
  else
    begin
      fifo_ps <= fifo_ns;
    end
end

always_comb begin
case (fifo_ps)
  NO_WRITE:
    begin
      write_control = 0;
      if((byte_assembled == 1) && (packet_ps != HEADER) && (full == 0) )
        begin
          fifo_ns = WRITE;
        end
      else
        begin
          fifo_ns = NO_WRITE;
        end
    end
  WRITE:
    begin
      write_control = 1;
      fifo_ns = NO_WRITE;
    end
endcase
end


endmodule // control_50MHz
