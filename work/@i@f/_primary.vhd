library verilog;
use verilog.vl_types.all;
entity \IF\ is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        do_branch       : in     vl_logic;
        branch_addr     : in     vl_logic_vector(15 downto 0);
        NPC_IF          : out    vl_logic_vector(15 downto 0);
        INS_IF          : out    vl_logic_vector(15 downto 0)
    );
end \IF\;
