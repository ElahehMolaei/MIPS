module D_MEM (
  input clk,
  input MEMW,
  input MEMR,
  input [15:0] data_addr,
  input [15:0] write_data,
  output [15:0] read_data
);
  // memory
  reg [15:0] mem [0:1023];

  // initialize memory
  initial $readmemh("D_MEM.mem", mem);

  // do memory write
  always @(posedge clk) begin
    // write to memory
    if (MEMW) mem[data_addr] = write_data;
    // update data memory file
    $writememh("D_MEM.mem", mem);
  end

  // do memory read
  assign read_data = MEMR ? mem[data_addr] : 16'bZ;
endmodule //D_MEM