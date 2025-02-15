module RegisterFile (
  input wire CLOCK_50,                // Sinal de clock
  input wire [4:0] readReg1,     // Registrador de leitura 1
  input wire [4:0] readReg2,     // Registrador de leitura 2
  input wire [4:0] writeReg,     // Registrador de escrita
  input wire EscreveReg,         // Sinal de habilitação da escrita
  input wire [31:0] writeData,   // Dados a serem escritos
  output reg [31:0] readData1,   // Dados lidos do registrador 1
  output reg [31:0] readData2    // Dados lidos do registrador 2
);

  reg [31:0] registers [0:31];   // Matriz de registradores

  always @(readReg1 or readReg2) begin
    readData1 <= registers[readReg1];
    readData2 <= registers[readReg2];
  end

  always @(posedge CLOCK_50) begin
    if (EscreveReg)
      registers[writeReg] <= writeData;
  end

endmodule