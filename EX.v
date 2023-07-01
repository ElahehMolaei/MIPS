module EX (
  input [15:0] imm,
  input [15:0] op_1,
  input [15:0] op_2,
  input [15:0] NPC_ID,
  input [15:0] INS_ID,
  output do_branch,
  output [2:0] WBA_EX,
  output [15:0] INS_EX,
  output [15:0] result,
  output [15:0] write_data,
  output [15:0] branch_addr
);

  // wire alu function
  wire [3:0] alu_func;

  // operand wires
  wire [15:0] first_operand = op_1;
  wire [15:0] second_operand = (INS_ID[15:12] == 4'b0000 ||
                                INS_ID[15:12] == 4'b1001 ||
                                INS_ID[15:12] == 4'b1010 ||
                                INS_ID[15:12] == 4'b1011 ||
                                INS_ID[15:12] == 4'b1100) ? op_2 : imm;

  // ALU controller
  ALU_controller alu_controller (
    .func (INS_ID[2:0]),
    .opcode (INS_ID[15:12]),
    .ALU_op (alu_func)
  );

  // ALU
  ALU alu_ (
    .func (alu_func),
    .first_operand (first_operand),
    .second_operand (second_operand),
    .do_branch (do_branch),
    .result (result)
  );

  // calculate branch address NPC + imm * 2
  assign branch_addr = NPC_ID + {imm[14:0], 1'b0};

  // set data address
  assign WBA_EX = INS_ID[15:12] == 4'b0000 ? INS_ID[5:3] : INS_ID[8:6];

  // passthrough instruction
  assign INS_EX = INS_ID;

  // passthrough write data
  assign write_data = op_2;

endmodule // EX