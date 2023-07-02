module InstructionDecoder (
  input wire [31:0] instruction,     // Sinal de entrada da instrução
  output wire [5:0] code,
  output wire [4:0] readReg1,        // Registrador de leitura 1
  output wire [4:0] readReg2,        // Registrador de leitura 2
  output wire [4:0] writeReg,         // Registrador de escrita
  output wire [15:0] ALUvalue
);

  reg [5:0] opcode;                  // Campo do opcode da instrução
  reg [4:0] rs, rt, rd;              // Campos dos registradores
  reg [15:0] value;

  assign code = opcode;
  assign readReg1 = rs;
  assign readReg2 = rt;
  assign writeReg = rd;
  assign ALUvalue = value;

  always @ (instruction) begin
    opcode = instruction[31:26];
    rs = instruction[25:21];
    rt = instruction[20:16];
    rd = instruction[15:11];
	 value = instruction [15:0];
  end

endmodule