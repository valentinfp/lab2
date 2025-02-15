module ALUController (
  input wire [1:0] opALU,
  input wire [31:0] extendedSignal,           // Campo do funct da instrução
  output reg [2:0] ALUControl      // Sinal de controle da ALU
);
  reg [5:0] funct;
 
  always @ (extendedSignal) begin
	funct = extendedSignal[5:0];
  end
  
  always @ (opALU) begin
    case (opALU)
      2'b00: ALUControl = 3'b010;   // lw/ sw
      2'b01: ALUControl = 3'b110;   // beq
      2'b10:  // Tipo R  
			case (funct)
				6'b100000: ALUControl = 3'b010; // add
				6'b100010: ALUControl = 3'b110; // sub
				6'b100100: ALUControl = 3'b000; // and
				6'b100101: ALUControl = 3'b001; // or
				6'b101010: ALUControl = 3'b111; // slt
				default: ALUControl = 3'b000;
			 endcase
      default: ALUControl = 3'b000; 
    endcase
  end

endmodule