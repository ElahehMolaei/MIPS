library verilog;
use verilog.vl_types.all;
entity INS_MEM is
    port(
        INS_ADDR        : in     vl_logic_vector(15 downto 0);
        INS             : out    vl_logic_vector(15 downto 0)
    );
end INS_MEM;
