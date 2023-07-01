module IF (
  input clk,
  input rst,
  input do_branch,
  input [15:0] branch_addr,
  output [15:0] NPC_IF,
  output [15:0] INS_IF
);
  // PC
  reg [15:0] PC;

  // instruction wire
  wire [15:0] INS;

  // if it's jump instruction
  wire is_jump = (INS[15:12] == 4'b1111) ? 1'b1 : 1'b0;

  // PC + 2
  wire [15:0] PC_2 = PC + 16'h0002;

  // instruction memory
  INS_MEM mem (
    .INS_ADDR(PC),
    .INS(INS)
  );

  // update PC with rising edge of clk or rst
  always @(posedge clk or posedge rst) begin
    if (rst) PC = 16'h0000;
    else begin
      if (is_jump) PC = {PC[15:13], INS[11:0], 1'b0};
      else if (do_branch) PC = branch_addr;
      else PC = PC_2;
    end
  end

  // instruction
  assign INS_IF = INS;

  // next pc
  assign NPC_IF = PC_2;
endmodule // IF