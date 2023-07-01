library verilog;
use verilog.vl_types.all;
entity ALU_controller is
    port(
        func            : in     vl_logic_vector(2 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        ALU_op          : out    vl_logic_vector(3 downto 0)
    );
end ALU_controller;
