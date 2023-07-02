module Adder32 (
  input wire [31:0] inputA,
  input wire [31:0] inputB,
  output wire [31:0] sum
);

  assign sum = inputA + inputB;

endmodule