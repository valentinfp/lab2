module DataMemory (
  input wire [31:0] address,
  input wire [31:0] writeData,
  input wire EscreveMem,
  input wire LeMem,
  input wire CLOCK_50,
  output reg [31:0] readData
);

  reg [31:0] mem[0:1023];

  //initial begin
    //$readmemh("data.mif", mem);
  //end

  always @(posedge CLOCK_50) begin
    if (LeMem) begin
      readData <= mem[address];
    end
    if (EscreveMem) begin
      mem[address] <= writeData;
    end
  end

endmodule