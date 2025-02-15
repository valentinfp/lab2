module ALU (
  input wire [31:0] operand1,   // Primeiro operando
  input wire [31:0] operand2,   // Segundo operando
  input wire [2:0] ALUControl,  // Sinal de controle da ALU
  output wire zero,             // Sinal de saída zero (resultado zero)
  output reg [31:0] result      // Resultado da operação
);

  wire [31:0] add_result;
  wire [31:0] sub_result;
  wire [31:0] and_result;
  wire [31:0] or_result;
  wire [31:0] xor_result;
  wire [31:0] slt_result;
  wire [31:0] sll_result;
  wire [31:0] srl_result;

  assign add_result = operand1 + operand2;
  assign sub_result = operand1 - operand2;
  assign and_result = operand1 & operand2;
  assign or_result = operand1 | operand2;
  assign xor_result = operand1 ^ operand2;
  assign slt_result = (operand1 < operand2) ? 1 : 0;
  assign sll_result = operand1 << operand2[4:0];
  assign srl_result = operand1 >> operand2[4:0];

  always @(*) begin
    case (ALUControl)
      3'b000: result = add_result;   // Operação de adição
      3'b001: result = sub_result;   // Operação de subtração
      3'b010: result = and_result;   // Operação AND
      3'b011: result = or_result;    // Operação OR
      3'b100: result = xor_result;   // Operação XOR
      3'b101: result = slt_result;   // Operação SLT (Set Less Than)
      3'b110: result = sll_result;   // Operação SLL (Shift Left Logical)
      3'b111: result = srl_result;   // Operação SRL (Shift Right Logical)
      default: result = 32'b0;       // Caso de sinal de controle inválido
    endcase
  end

  assign zero = (result == 32'b0) ? 1 : 0;

endmodule