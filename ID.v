module ID (
  input clk,
  input rst,
  input write_flag,
  input [2:0] write_addr,
  input [15:0] NPC_IF,
  input [15:0] INS_IF,
  input [15:0] write_back_data,
  output [15:0] NPC_ID,
  output [15:0] INS_ID,
  output [15:0] reg_data_1,
  output [15:0] reg_data_2,
  output [15:0] immediate
);

  // passthrough
  assign NPC_ID = NPC_IF;
  assign INS_ID = INS_IF;

  // immediate part sign-extened
  wire [15:0] sign_extened = {{10{INS_IF[5]}}, INS_IF[5:0]};

  // zero-extended immediate
  wire [15:0] zero_extened = {{10{1'b0}}, INS_IF[5:0]};

  // reg file
  reg_file rf (
    .clk (clk),
    .rst (rst),
    .reg_write (write_flag),
    .write_addr (write_addr),
    .read_addr_1 (INS_IF[11:9]),
    .read_addr_2 (INS_IF[8:6]),
    .write_data (write_back_data),
    .read_data_1 (reg_data_1),
    .read_data_2 (reg_data_2)
  );

  // immediate zero-extended for opcode 0010 and 0011 otherwise sign-extended
  assign immediate = (INS_IF[15:12] == 4'b0010 || INS_IF[15:12] == 4'b0011) ? zero_extened : sign_extened;

endmodule // ID