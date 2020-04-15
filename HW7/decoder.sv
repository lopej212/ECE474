module decoder (
  input  [3:0] digit_out,// might need logic
  output reg [6:0] segment_data// might need logic
  );

  always_comb begin
    case(digit_out)
        0:segment_data = 7'b000_0001;//d1, h1
        1:segment_data = 7'b100_1111;//d79,h4f
        2:segment_data = 7'b001_0010;//d18,h12
        3:segment_data = 7'b000_0110;//d6,h6
        4:segment_data = 7'b100_0110;//d70,h46
        5:segment_data = 7'b010_0100;//d36,h24
        6:segment_data = 7'b010_0000;//d32,h20
        7:segment_data = 7'b000_1111;//d15,hf
        8:segment_data = 7'b000_0000;//d0,h0
        9:segment_data = 7'b000_1100;//d12,hc
        10:segment_data = 7'b111_1111;//colon off(d127,h7f)
        11:segment_data = 7'b111_1001;//colon on(d121,h79)
        default: segment_data = 7'b0;
    endcase
  end

endmodule // decoder
