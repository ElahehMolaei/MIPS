module ALU_controller (
  input [2:0] func,
  input [3:0] opcode,
  output reg [3:0] ALU_op
);

  always @(*) begin
    if (opcode == 4'b0000) begin
      case (func)
        3'b000: ALU_op = 4'b0000; // add
        3'b001: ALU_op = 4'b0001; // sub
        3'b010: ALU_op = 4'b0010; // and
        3'b011: ALU_op = 4'b0011; // or
        3'b100: ALU_op = 4'b0100; // xor
        3'b101: ALU_op = 4'b0101; // nor
        3'b110: ALU_op = 4'b0110; // slt
        default: ALU_op = 4'bZZZZ;
      endcase
    end else begin
      case (opcode)
        4'b0001: ALU_op = 4'b0000; // addi
        4'b0010: ALU_op = 4'b0010; // andi
        4'b0011: ALU_op = 4'b0011; // ori
        4'b0100: ALU_op = 4'b0001; // subi
        4'b0111: ALU_op = 4'b0000; // lhw
        4'b1000: ALU_op = 4'b0000; // lhb
        4'b1001: ALU_op = 4'b0111; // beq
        4'b1010: ALU_op = 4'b1000; // bne
        4'b1011: ALU_op = 4'b1001; // blt
        4'b1100: ALU_op = 4'b1010; // bgt
        default: ALU_op = 4'bZZZZ;
      endcase
    end
  end

endmodule //ALU_controller