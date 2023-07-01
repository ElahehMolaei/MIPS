module CPU_tb;
  // Inputs
  reg clk;
  reg rst;

  // Instantiate the DUT
  CPU dut (
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial clk = 1'b0;
  always #5 clk = ~clk;

  // Reset generation
  initial begin
    rst = 1;
    #10; // Hold reset for 10 time units
    rst = 0;
    #10000;
    $stop;
  end

endmodule // CPU_tb
