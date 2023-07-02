module SignalController (
  input wire [5:0] opcode,       // Campo do opcode da instrução
  output reg RegDst,            
  output reg Branch,            
  output reg LeMem,          
  output reg MemparaReg,          
  output reg [1:0]OpALU,           
  output reg EscreveMem,          
  output reg OrigALU,      
  output reg EscreveReg             
);

  always @ (opcode) begin
    case (opcode)
      6'b000000: begin   // R-type
        RegDst = 1;
		  Branch = 0;
		  LeMem = 0;
        MemparaReg = 0;
        OpALU = 2'b10;   // Funct field determines ALU operation
        EscreveMem = 0;
		  OrigALU = 0;
		  EscreveReg = 1;
		  
      end

      6'b100011: begin  // lw
        RegDst = 0;
		  Branch = 0;
		  LeMem = 1;
        MemparaReg = 1;
        OpALU = 2'b00;   // Add for address calculation
        EscreveMem = 0;
		  OrigALU = 1;
		  EscreveReg = 1;
      end

      // Adicione mais cases para outros tipos de instrução

      default: begin    // Instrução não suportada
        RegDst = 0;
		  Branch = 0;
		  LeMem = 0;
        MemparaReg = 0;
        OpALU = 2'b00;
        EscreveMem = 0;
		  OrigALU = 0;
		  EscreveReg = 0;
      end
    endcase
  end

endmodule