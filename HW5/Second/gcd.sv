module gcd( input [31:0] a_in,          //operand a
            input [31:0] b_in,          //operand b
            input start,                //validates the input data
            input reset_n,              //reset
            input clk,                  //clock
            output reg [31:0] result,  //output of GCD engine
            output reg done,
            output reg [31:0] a_val,
            output reg [31:0] b_val );          //validates output

reg [31:0] a_value;
reg [31:0] b_value;

enum reg [2:0]{
  IDLE       = 3'b000,
  RUNNING    = 3'b001,
  DONE       = 3'b010,
  AGB        = 3'b011,
  BGA        = 3'b100} present_state, next_state;


always_ff @ (posedge clk, negedge reset_n)
  begin
    if(!reset_n)  present_state <= IDLE;
    else          present_state <= next_state;
  end

always_comb
  begin
    case(present_state)
      IDLE:
        begin
          if(start== 1)
            begin
               next_state = RUNNING;
               a_value    = a_in;
               b_value    = b_in;
            end
          else// start == 0
            begin
              a_value = 0;
              b_value = 0;
            end
        end
      RUNNING:
        begin
          if (a_value == b_value)
            begin
              next_state = DONE;
            end
          else if( a_value>b_value)
            begin
              next_state = AGB;
            end
          else
            begin
              next_state = BGA;
            end
        end
      AGB:
        begin
          a_value -= b_value;
          next_state = RUNNING;
        end
      BGA:
        begin
          b_value -= a_value;
          next_state = RUNNING;
        end
      DONE:
        begin
           done      = 1;
           result    = 7;
          next_state = IDLE;
        end
    endcase
  end
 // assign result = a_value ;

 //for tetsing
 assign a_val  = a_val;
 assign b_Val  = b_val;



  endmodule
