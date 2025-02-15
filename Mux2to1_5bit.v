module Mux2to1_5bit (
  input wire [4:0] A,   // Entrada 0 do MUX
  input wire [4:0] B,   // Entrada 1 do MUX
  input wire select,         // Sinal de seleção
  output wire [4:0] out   // Saída do MUX
);

  assign out = select ? B : A;

endmodule