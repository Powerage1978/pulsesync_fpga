//----------------------------------------------
//	www.verificationguide.com   design.sv
//----------------------------------------------
/*
            --------------
 valid ---->|            |
            |			 |
    a -/--->|       	 |
            |   adder    |---/-> c
    b -/--->|            |
            |            |
            --------------
               ^      ^
               |      |
              clk   reset

*/
module adder(
  input 	   clk	,
  input 	   async_reset_n,
  input  [3:0] a	,
  input  [3:0] b	,
  input        valid,
  output [4:0] c  		);

  reg [4:0] tmp_c;
  assign c = tmp_c;

  //Reset
//  always @(posedge reset)
//    tmp_c <= 0;

  // Waddition operation
//  always @(posedge clk)
//    if (valid)    tmp_c <= a + b;

  always @(posedge clk or negedge async_reset_n)
    begin
      if (!async_reset_n) begin
        tmp_c <= 0;
      end
      else begin
        if (valid)    tmp_c <= a + b;
      end
    end



endmodule
