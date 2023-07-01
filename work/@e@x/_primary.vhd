library verilog;
use verilog.vl_types.all;
entity EX is
    port(
        imm             : in     vl_logic_vector(15 downto 0);
        op_1            : in     vl_logic_vector(15 downto 0);
        op_2            : in     vl_logic_vector(15 downto 0);
        NPC_ID          : in     vl_logic_vector(15 downto 0);
        INS_ID          : in     vl_logic_vector(15 downto 0);
        do_branch       : out    vl_logic;
        WBA_EX          : out    vl_logic_vector(2 downto 0);
        INS_EX          : out    vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(15 downto 0);
        write_data      : out    vl_logic_vector(15 downto 0);
        branch_addr     : out    vl_logic_vector(15 downto 0)
    );
end EX;
