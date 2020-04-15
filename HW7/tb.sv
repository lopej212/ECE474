//
//-------------------------------------------------------------------
//This module creates a testbench for the digital clock
//Jose Manuel Lopez Alcala Spring 2019
//-------------------------------------------------------------------
//

`timescale 1ns / 1ns

module tb;
  //system verilog testbench for clock

  reg reset_n, mil_time;
  reg clk_1sec,clk_1ms;
  reg [6:0] segment_data;
  reg [2:0] digit_select;

  integer i = 0;
  integer output_file;
  string digit_encoded;


  //parameter CYCLE_1SEC = 1000000000;// these numbers are nano seconds (period)
  //parameter CYCLE_1MS  = 1000000;//nano seconds (period)

  parameter CYCLE_1SEC = 1000000;//scaled by 1000
  parameter CYCLE_1MS = 1000;//scalled by 1000


  initial begin
    clk_1sec <=0;
    forever #(CYCLE_1SEC/2) clk_1sec = ~clk_1sec;
  end

  initial begin
    clk_1ms <=0;
    forever #(CYCLE_1MS/2) clk_1ms = ~clk_1ms;
  end

  initial begin
    mil_time = '0;
    reset_n ='0;
    #(CYCLE_1MS * 6) reset_n = 1'b1;
  end

  //setupt output file generation
  initial begin
    output_file = $fopen("output_data.txt", "w");
    if(output_file == 0) $display ("ERROR: Cannot open file output_data");
  end

  clock clock_0(.*);

  task military_on;
    $display ("Military time on!");
    mil_time = 1'b1;
  endtask

  task encode;
      if(segment_data == 7'b000_0001) digit_encoded = "0";
      if(segment_data == 7'b100_1111) digit_encoded = "1";
      if(segment_data == 7'b001_0010) digit_encoded = "2";
      if(segment_data == 7'b000_0110) digit_encoded = "3";
      if(segment_data == 7'b100_0110) digit_encoded = "4";
      if(segment_data == 7'b010_0100) digit_encoded = "5";
      if(segment_data == 7'b010_0000) digit_encoded = "6";
      if(segment_data == 7'b000_1111) digit_encoded = "7";
      if(segment_data == 7'b000_0000) digit_encoded = "8";
      if(segment_data == 7'b000_1100) digit_encoded = "9";
      if(segment_data == 7'b111_1111) digit_encoded = " ";
      if(segment_data == 7'b111_1001) digit_encoded = ":";
    endtask

  //sample output  data
  always@(posedge clk_1ms)
    begin
      encode();
      if((reset_n == 1'b1) && (digit_select == 4))
        begin
          $fwrite(output_file,"\n", digit_encoded);
        end
      if (reset_n == 1'b1 && (digit_select !=4))
        begin
          $fwrite(output_file, digit_encoded);
        end
    end

endmodule // tb
