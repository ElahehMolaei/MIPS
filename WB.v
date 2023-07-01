module WB (
  input [2:0] WBA_MA,           // write back address from MA
  input [15:0] ALU_result,      // ALU result from MA
  input [15:0] data,            // data from MA
  input [15:0] INS_MA,          // instruction from MA
  output write_flag,            // write flag
  output [2:0] write_addr,      // write address
  output [15:0] write_back_data // write data
);

  // select right data to write
  // if opcode is 0111 then we read data from data memory to reg file
  assign write_back_data = INS_MA[15:12] == 4'b0111 ? data : ALU_result;

  // write flag
  assign write_flag = (INS_MA[15:12] == 4'b1000 || INS_MA[15:12] == 4'b1001 ||
                       INS_MA[15:12] == 4'b1010 || INS_MA[15:12] == 4'b1011 ||
                       INS_MA[15:12] == 4'b1100 || INS_MA[15:12] == 4'b1111) ? 1'b0 : 1'b1;

  // passthrough write address
  assign write_addr = WBA_MA;
endmodule //WB