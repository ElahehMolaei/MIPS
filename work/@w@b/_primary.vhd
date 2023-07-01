library verilog;
use verilog.vl_types.all;
entity WB is
    port(
        WBA_MA          : in     vl_logic_vector(2 downto 0);
        ALU_result      : in     vl_logic_vector(15 downto 0);
        data            : in     vl_logic_vector(15 downto 0);
        INS_MA          : in     vl_logic_vector(15 downto 0);
        write_flag      : out    vl_logic;
        write_addr      : out    vl_logic_vector(2 downto 0);
        write_back_data : out    vl_logic_vector(15 downto 0)
    );
end WB;
