module mult(
  input  reset,
  input  clk,
  input  [31:0] a_in,
  input  [31:0] b_in,
  input  start,
  output logic [63:0] product,
  output logic done);

  reg[31:0] multiplicand_reg;
  reg [63:0] mult_product;
  reg [5:0] counter_reg;

  enum logic [1:0]{
    IDLE = 2'b00,
    TEST = 2'b01,
    ADD = 2'b10,
    SHIFT = 2'b11
    } present_state, next_state ;

//infer the present state vector flip flops
always_ff @(posedge clk, posedge reset)
  begin
    if (reset) present_state <= IDLE;
    else present_state <= next_state;
  end

always_comb
  begin
    case(present_state)
      IDLE:
        begin
          if(!start)// start = 0
            begin
              mult_product[63:32] = 32'd0;
            end
          else//start =1
            begin
              multiplicand_reg = a_in;
              mult_product[31:0] = b_in;
              counter_reg = 6'h0;
              next_state = TEST;
            end
        end
      TEST:
        begin
          // if mult_product[0] ==1 ADD
          if(mult_product[0]) next_state = ADD;
          // if mult_product[0] == 0  then only SHIFT
          else next_state = SHIFT;
        end
      ADD:
        begin
          mult_product[63:32] = mult_product[63:32] + multiplicand_reg;
          next_state = SHIFT;
        end
      SHIFT:
        begin
          mult_product=mult_product>>1;
          counter_reg=counter_reg+1;
          if(counter_reg <32)
            begin
              next_state = TEST;
            end
          else
            begin
              product = mult_product;
              done = 1;
              counter_reg = 0;
              next_state = IDLE;
            end
        end
    endcase
  end
endmodule
