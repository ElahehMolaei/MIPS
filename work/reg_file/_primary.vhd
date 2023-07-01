library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        reg_write       : in     vl_logic;
        write_addr      : in     vl_logic_vector(2 downto 0);
        read_addr_1     : in     vl_logic_vector(2 downto 0);
        read_addr_2     : in     vl_logic_vector(2 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0);
        read_data_1     : out    vl_logic_vector(15 downto 0);
        read_data_2     : out    vl_logic_vector(15 downto 0)
    );
end reg_file;
