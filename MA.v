module MA (
  input clk,               // clock
  input [2:0] WBA_EX,      // write back address from EX
  input [15:0] result,     // result from EX
  input [15:0] INS_EX,     // instruction from EX
  input [15:0] write_data, // write data from EX
  output [2:0] WBA_MA,     // write back address from MA
  output [15:0] data,      // data from MA
  output [15:0] INS_MA,    // instruction from MA
  output [15:0] ALU_result // ALU result from MA
);
  // do read
  wire do_read = INS_EX[15:12] == 4'b0111 ? 1'b1 : 1'b0;

  // do write
  wire do_write = INS_EX[15:12] == 4'b1000 ? 1'b1 : 1'b0;

  // data memory
  D_MEM mem (
    .clk(clk),
    .MEMR(do_read),
    .MEMW(do_write),
    .data_addr(result),
    .write_data(write_data),
    .read_data(data)
  );

  // passthrough Write back address
  assign WBA_MA = WBA_EX;

  // passthrough instruction
  assign INS_MA = INS_EX;

  // passthrough ALU result
  assign ALU_result = result;
endmodule // MA