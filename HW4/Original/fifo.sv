module fifo (
       input            wr_clk,   //write clock
       input            rd_clk,   //read clock
       input            reset_n,  //reset async active low
       input            wr,       //write enable
       input            rd,       //read enable
       input      [7:0] data_in,  //data in
       output reg [7:0] data_out, //data out
       output logic          empty,    //empty flag
       output logic            full      //full flag
       );

logic [3:0] wr_ptr;
logic [3:0] rd_ptr;
logic empty_sync;
logic empty_temp;
logic full_sync;
logic full_temp;
reg[7:0] mem[2:0];

//write
always_ff @ (posedge wr_clk, negedge reset_n)
  begin
      if(reset_n == 0)
        begin
          wr_ptr <= 0;
        end
      else if( wr == 1 )
        begin
          mem[wr_ptr[2:0]] <= data_in;
          wr_ptr <= wr_ptr + 1;
        end
  end

//read
always_ff @ (posedge rd_clk, negedge reset_n)
  begin
    if ( reset_n == 0)
      begin
        rd_ptr <= 0;
      end
    else if (rd == 1)
      begin
        rd_ptr <= rd_ptr + 1;
      end
  end

//Fall-through
always_comb
  begin
    if ( reset_n == 0 )
      begin
        data_out = mem[0];
      end
    else
      begin
        data_out = mem[rd_ptr[2:0]];
      end
  end

// empty
always_ff @ (posedge rd_clk)
  begin
    if(rd_ptr == wr_ptr)
      begin
        empty_sync <= 1;
      end
  end

always_comb
  begin
    empty_temp = (rd_ptr == wr_ptr) && (rd == wr);
    if(rd)
      begin
        empty = (empty_temp || empty_sync);
      end
    else if ( reset_n==0)
    begin
      empty = 1;
    end
  end

//full
always_ff @ (posedge wr_clk)
  begin
    full_sync <= (rd_ptr[2:0] == wr_ptr[2:0] ) && ( rd_ptr[3] != wr_ptr[3]);
  end

always_comb
  begin
    full_temp = (rd_ptr == wr_ptr) && (rd != wr);
    if(wr)
      begin
        full = (full_temp || full_sync);
      end
    else if ( reset_n==0)
      begin
        full = 0;
        empty = 1;
      end
  end



endmodule


// always_comb
//   begin
//     full_temp    = (rd_ptr == wr_ptr) && (rd != wr);
//     empty_temp   = (rd_ptr == wr_ptr) && (rd == wr);
//     if( rd || wr )
//       begin
//          assign empty = (empty_temp) || (empty_sync);
//          assign full  = (full_temp)  || (full_sync);
//       end
//   end

//endmodule
