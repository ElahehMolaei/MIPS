module reg_file (
  input clk,
  input rst,
  input reg_write,
  input [2:0] write_addr,
  input [2:0] read_addr_1,
  input [2:0] read_addr_2,
  input [15:0] write_data,
  output [15:0] read_data_1,
  output [15:0] read_data_2
);
  // reg file
  reg [15:0] reg_file [0:7];

  // read data
  assign read_data_1 = reg_file[read_addr_1];
  assign read_data_2 = reg_file[read_addr_2];

  // index integer
  integer i;

  // update reg file
  always @(posedge clk or posedge rst) begin
    // update reg_file
    if (rst) begin
      for (i = 0; i < 8; i = i + 1) reg_file[i] = 16'h0000;
    end else if (reg_write && write_addr != 3'b000) reg_file[write_addr] = write_data;
    // update the reg_file.mem
    $writememh("reg_file.mem", reg_file);
  end

  // initialize reg file all to ze
  initial $readmemh("reg_file.mem", reg_file);
endmodule // reg_file