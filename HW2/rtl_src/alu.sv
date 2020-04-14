 module alu(
      input        [7:0] in_a     ,  //input a
      input        [7:0] in_b     ,  //input b
      input        [3:0] opcode   ,  //opcode input
      output  reg  [7:0] alu_out  ,  //alu output
      output  reg        alu_zero ,  //logic '1' when alu_output [7:0] is all zeros
      output  reg        alu_carry   //indicates a carry out from ALU
      );


reg [8:0] sum;// temporary register to store the operation

always @(in_a, in_b, opcode)
begin
  case(opcode)
    4'h1: sum=in_a + in_b;// add a and b
    4'h2: sum=in_a - in_b;// subract b from a
    4'h3: sum=in_a + 1;// incremetn a by 1
    4'h4: sum=in_a - 1;// decrement a by 1
    4'h5: sum=in_a | in_b;//a OR b
    4'h6: sum=in_a & in_b;//a AND b
    4'h7: sum=in_a ^ in_b;//a XOR b
    4'h8: sum=in_a >> 1;// a shifted 1 right
    4'h9: sum=in_a << 1;// a shifted by 1 left
    4'hA: sum=~in_a; // ones compliment
    4'hB: sum=~in_a + 1;// twos compliment
    default: sum = 0;
  endcase
end

assign alu_zero = ~(|sum[7:0]);
assign alu_carry = sum[8];
assign alu_out = sum[7:0];

endmodule
