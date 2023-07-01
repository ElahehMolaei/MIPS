module ALU (
  input [3:0] func,
  input [15:0] first_operand,
  input [15:0] second_operand,
  output reg do_branch,
  output reg [15:0] result
);

  // do the math with combinational logic
  always @(*) begin
    do_branch = 1'b0;
    case (func)
      4'b0000: result = first_operand + second_operand; // add function
      4'b0001: result = first_operand - second_operand; // sub function
      4'b0010: result = first_operand & second_operand; // and function
      4'b0011: result = first_operand | second_operand; // or function
      4'b0100: result = first_operand ^ second_operand; // xor function
      4'b0101: result = ~(first_operand | second_operand); // nor function
      // slt function
      4'b0110: begin
        if (first_operand < second_operand) result = 16'b1;
        else result = 16'b0;
      end
      4'b0111: do_branch = first_operand == second_operand; // beq function
      4'b1000: do_branch = first_operand != second_operand; // bne function
      4'b1001: begin // blt function
        if (first_operand[15] == 1'b1 && second_operand[15] == 1'b0) do_branch = 1'b1;
        else if (first_operand[15] == 1'b0 && second_operand[15] == 1'b1) do_branch = 1'b0;
        else do_branch = first_operand < second_operand;
      end
      4'b1010: begin // bgt function
        if (first_operand[15] == 1'b1 && second_operand[15] == 1'b0) do_branch = 1'b0;
        else if (first_operand[15] == 1'b0 && second_operand[15] == 1'b1) do_branch = 1'b1;
        else do_branch = first_operand > second_operand;
      end
      default: result = 16'bZ;
    endcase
  end

endmodule // ALU