library verilog;
use verilog.vl_types.all;
entity ID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        write_flag      : in     vl_logic;
        write_addr      : in     vl_logic_vector(2 downto 0);
        NPC_IF          : in     vl_logic_vector(15 downto 0);
        INS_IF          : in     vl_logic_vector(15 downto 0);
        write_back_data : in     vl_logic_vector(15 downto 0);
        NPC_ID          : out    vl_logic_vector(15 downto 0);
        INS_ID          : out    vl_logic_vector(15 downto 0);
        reg_data_1      : out    vl_logic_vector(15 downto 0);
        reg_data_2      : out    vl_logic_vector(15 downto 0);
        immediate       : out    vl_logic_vector(15 downto 0)
    );
end ID;
