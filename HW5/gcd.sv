module gcd( input [31:0] a_in,          //operand a
            input [31:0] b_in,          //operand b
            input start,                //validates the input data
            input reset_n,              //reset
            input clk,                  //clock
            output reg [31:0] result,  //output of GCD engine
            output reg done);          //validates output

reg [31:0] a_value;
reg [31:0] b_value;
reg [31:0] temp;// may not be needed

enum reg [1:0]{
  IDLE       = 2'b00,
  SWAP       = 2'b01,
  SUBTRACT   = 2'b10,
  FINISH     = 2'b11}present_state, next_state;

enum reg [1:0]{
  START_STATE= 2'b00,
  RUNNING    = 2'b01,
  DONE_STATE = 2'b10} input_ps, input_ns;

always_ff @ (posedge clk, negedge reset_n)
if(!reset_n)  input_ps <= START_STATE;
else          input_ps <= input_ns;

always_comb
  begin
    case (input_ps )
      START_STATE:
        begin
          if(start)
            begin
            input_ns = RUNNING;
            a_value = a_in;
            b_value = b_in;
            end
          else
            begin
              input_ns = START_STATE;// might not be needed
              a_value = 0;
              b_value = 0;
            end
        end
      RUNNING:
        begin
          if (b_value == 0 )//This was changed
            begin
              input_ns = DONE_STATE;
            end
          else
            begin
              input_ns = RUNNING;
            end
        end
      DONE_STATE:
        begin
          done =1;//set flag
          input_ns = START_STATE;
          // might need to add something here
        end
    endcase
  end

always_ff @(posedge clk)
if(input_ps == RUNNING) present_state <= next_state;
else                    present_state <= IDLE;

// always_ff @(posedge clk)
// if(present_state == SWAP)// this might need to be changed to next_state == swap
//   begin
//     a_value <= b_value;
//     b_value <= a_value;
//   end
// else
//   present_state <= present_state;

always_comb
  begin
    case(present_state)
    IDLE:
      begin
        if(!(a_value < b_value))
          begin
            next_state = SUBTRACT;
          end
        else if ( (a_value < b_value))
          begin
            next_state = SWAP;
          end
        else //this is when they are equal ( a_value == b_value)
          begin
            next_state = FINISH;
          end
      end
      SUBTRACT:
        begin
          a_value = a_value - b_value;
          next_state = IDLE;
        end
      SWAP:
        begin
          temp = b_value;
          b_value = a_value;
          a_value = temp;
          next_state = IDLE;
        end
      FINISH:
        begin
          //result = a_value;
          next_state =IDLE;
        end
    endcase
  end

  assign result = a_value;

endmodule
