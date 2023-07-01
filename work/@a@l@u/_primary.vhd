library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        func            : in     vl_logic_vector(3 downto 0);
        first_operand   : in     vl_logic_vector(15 downto 0);
        second_operand  : in     vl_logic_vector(15 downto 0);
        do_branch       : out    vl_logic;
        result          : out    vl_logic_vector(15 downto 0)
    );
end ALU;
