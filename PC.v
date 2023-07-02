module PC (
  input wire CLOCK_50,        // Sinal de clock
  input wire reset,      // Sinal de reset
  input wire pc_write,   // 
  input wire [31:0] pc_next,
  output reg [31:0] pc   // Saída do registrador PC
);

  initial begin
    pc <= 32'd0;
  end

  always @(posedge CLOCK_50 or posedge reset) begin
    if (reset)      // Reset assíncrono
      pc <= 32'd0;
    else if (pc_write) // Habilitação do incremento
      pc <= pc_next;
  end

endmodule