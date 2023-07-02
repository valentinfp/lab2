module Mux2to1_32bit (
  input wire [31:0] A,   // Entrada 0 do MUX
  input wire [31:0] B,   // Entrada 1 do MUX
  input wire select,         // Sinal de seleção
  output wire [31:0] out   // Saída do MUX
);

  assign out = select ? B : A;

endmodule