module INS_MEM (
  input [15:0] INS_ADDR,
  output [15:0] INS
);

  // memory 256 x 16 bits
  reg [15:0] mem [0:255];

  // initialization of the memory
  initial $readmemh("INS_MEM.mem", mem);

  // assignment
  assign INS = mem[INS_ADDR[15:1]];

endmodule //INS_MEM