
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debounce_tb is
end debounce_tb;

architecture testbench of debounce_tb is

    signal tb_clk : std_logic := '0';
    signal tb_btn : std_logic:= '1';
    signal tb_dbnc : std_logic;

    
    component debounce is
        port(
        
            clk , btn : in std_logic;        -- 125 Mhz clock
            
            dbnc: out std_logic        -- led, '1' = on
        
        );
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    
	tb_btn <= '1';
  
    dut : debounce
    port map (
    
        clk  => tb_clk,
        btn => tb_btn,
	dbnc => tb_dbnc
    
    );

    
end testbench; 
