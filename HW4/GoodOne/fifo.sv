module fifo (
       input            wr_clk,   //write clock
       input            rd_clk,   //read clock
       input            reset_n,  //reset async active low
       input            wr,       //write enable
       input            rd,       //read enable
       input      [7:0] data_in,  //data in
       output reg [7:0] data_out, //data out
       output logic          empty,    //empty flag
       output logic            full,      //full flag
       //for testing
       output reg  [3:0] wr_address,
       output reg [3:0] rd_address
       //
       );

logic [3:0] wr_ptr;
logic [3:0] rd_ptr;
reg[7:0] mem[0:7];

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

//output
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

always_comb
  begin
    if(reset_n ==0)
      begin
        empty = 1;
        full = 0;
      end
    else if(rd_ptr == wr_ptr)
      begin
        empty =1;
        full =0;
      end
    else if ( (rd_ptr[2:0]==wr_ptr[2:0]) && (rd_ptr[3]!=wr_ptr[3]))
      begin
        full =1;
        empty = 0;
      end
    else
      begin
        full =0;
        empty =0;
      end
  end
// for testing
assign wr_address = wr_ptr;
assign rd_address = rd_ptr;
//
endmodule
