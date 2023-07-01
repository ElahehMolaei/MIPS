module CPU (
  input clk,
  input rst
);
  // wires
  wire do_branch;
  wire [15:0] branch_addr;
  wire [15:0] NPC_IF;
  wire [15:0] INS_IF;

  // Instruction Fetch
  IF InsFe (
    // inputs
    .clk (clk),
    .rst (rst),
    .do_branch (do_branch),
    .branch_addr (branch_addr),
    // outputs
    .NPC_IF (NPC_IF),
    .INS_IF (INS_IF)
  );

  // wires
  wire write_flag;
  wire [2:0] write_addr;
  wire [15:0] NPC_ID;
  wire [15:0] INS_ID;
  wire [15:0] reg_data_1;
  wire [15:0] reg_data_2;
  wire [15:0] immediate;
  wire [15:0] write_back_data;

  // Instruction Decode
  ID id (
    // inputs
    .clk (clk),
    .rst (rst),
    .write_flag (write_flag),
    .write_addr (write_addr),
    .NPC_IF (NPC_IF),
    .INS_IF (INS_IF),
    .write_back_data (write_back_data),
    // outputs
    .NPC_ID (NPC_ID),
    .INS_ID (INS_ID),
    .reg_data_1 (reg_data_1),
    .reg_data_2 (reg_data_2),
    .immediate (immediate)
  );

  // wires
  wire [2:0] WBA_EX;
  wire [15:0] INS_EX;
  wire [15:0] result;
  wire [15:0] write_data;

  // Execution
  EX ex (
    // inputs
    .imm (immediate),
    .op_1 (reg_data_1),
    .op_2 (reg_data_2),
    .NPC_ID (NPC_ID),
    .INS_ID (INS_ID),
    // outputs
    .do_branch (do_branch),
    .WBA_EX (WBA_EX),
    .INS_EX (INS_EX),
    .result (result),
    .write_data (write_data),
    .branch_addr (branch_addr)
  );

  // wires
  wire [2:0] WBA_MA;
  wire [15:0] data;
  wire [15:0] INS_MA;
  wire [15:0] ALU_result;

  // Memory Access
  MA ma (
    // inputs
    .clk (clk),
    .WBA_EX (WBA_EX),
    .result (result),
    .INS_EX (INS_EX),
    .write_data (write_data),
    // outputs
    .WBA_MA (WBA_MA),
    .data (data),
    .INS_MA (INS_MA),
    .ALU_result (ALU_result)
  );

  // Write Back
  WB wb (
    // inputs
    .WBA_MA (WBA_MA),
    .ALU_result (ALU_result),
    .data (data),
    .INS_MA (INS_MA),
    // outputs
    .write_flag (write_flag),
    .write_addr (write_addr),
    .write_back_data (write_back_data)
  );
endmodule // cpu