module SignExtender_16to32bit (
  input wire [15:0] in,    // Entrada de 16 bits
  output wire [31:0] out   // Saída de 32 bits
);

  assign out = { {16{in[15]}}, in };
  
endmodule