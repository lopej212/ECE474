module tas (
       input  clk_50,               // 50Mhz input clock
       input  clk_2,                // 2Mhz input clock
       input  reset_n,              // reset async active low
       input  serial_data,          // serial input data
       input  data_ena,             // serial data enable
       output reg ram_wr_n,             // write strobe to ram
       output reg [7:0] ram_data,       // ram data
       output reg [10:0] ram_addr       // ram address
       );

logic assembled_flag;
logic [7:0] shft_rg_output;
logic data_available_flag;
logic wr_fifo;
logic rd_fifo;
logic [7:0] fifo_output;
logic empty_flag;
logic full_flag;
logic add;
logic avg_done_flag;


shift_register shft_reg_0 (
  .reset_n        (reset_n),
  .data_in        (serial_data),
  .data_en        (data_ena),
  .clk            (clk_50),
  .byte_assembled (assembled_flag),
  .data_out       (shft_rg_output)
  );

a5_or_c3 aoc_0(
  .reset_n        (reset_n),
  .data_in        (shft_rg_output),
  .data_available (data_available_flag)
  );

fifo fifo_0(
  .wr_clk   (clk_50),
  .rd_clk   (clk_2),
  .reset_n  (reset_n),
  .wr       (wr_fifo),
  .rd       (rd_fifo),
  .data_in  (shft_rg_output),
  .data_out (fifo_output),
  .empty    (empty_flag),
  .full     (full_flag)
  );

control_50MHz control_50MHz_0(
  .reset_n        (reset_n),
  .clk            (clk_50),
  .byte_assembled (assembled_flag),
  .a5_or_c3       (data_available_flag),
  .full           (full_flag),
  .write_control  (wr_fifo)
);

control_2MHz control_2MHz_0(
  .reset_n      (reset_n),
  .clk          (clk_2),
  .empty        (empty_flag),
  .control_avg  (add)
);

averager averager_0(
  .clk          (clk_2),
  .data_in      (fifo_output),
  .add          (add),
  .reset_n      (reset_n),
  .average_done (avg_done_flag),
  .data_out     (ram_data)
);

counter_11bit counter_11bit_0(
  .average_done (avg_done_flag),
  .clk          (clk_2),
  .reset_n      (reset_n),
  .address_out  (ram_addr),
  .write_ram    (ram_wr_n)
);

endmodule // tas
