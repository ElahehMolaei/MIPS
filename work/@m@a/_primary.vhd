library verilog;
use verilog.vl_types.all;
entity MA is
    port(
        clk             : in     vl_logic;
        WBA_EX          : in     vl_logic_vector(2 downto 0);
        result          : in     vl_logic_vector(15 downto 0);
        INS_EX          : in     vl_logic_vector(15 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0);
        WBA_MA          : out    vl_logic_vector(2 downto 0);
        data            : out    vl_logic_vector(15 downto 0);
        INS_MA          : out    vl_logic_vector(15 downto 0);
        ALU_result      : out    vl_logic_vector(15 downto 0)
    );
end MA;
