library verilog;
use verilog.vl_types.all;
entity D_MEM is
    port(
        clk             : in     vl_logic;
        MEMW            : in     vl_logic;
        MEMR            : in     vl_logic;
        data_addr       : in     vl_logic_vector(15 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0);
        read_data       : out    vl_logic_vector(15 downto 0)
    );
end D_MEM;
