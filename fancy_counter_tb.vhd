

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity fancy_counter_tb is
end fancy_counter_tb;

architecture testbench of fancy_counter_tb is

    signal tb_clk : std_logic := '0';
    signal tb_clk_en : std_logic:= '0';
    signal tb_dir : std_logic:= '0';
    signal tb_en : std_logic:= '1';
    signal tb_ld: std_logic:= '1';
    signal tb_rst : std_logic:= '0';
    signal tb_updn: std_logic:= '1';
    signal tb_val : std_logic_vector (3 downto 0):= "0010";
    signal tb_cnt : std_logic_vector (3 downto 0);

    
    component fancy_counter is
        port(
        
             clk, clk_en, dir, en, ld, rst, updn : in std_logic;        -- 125 Mhz clock
            
           val: in std_logic_vector (3 downto 0);
        cnt: out std_logic_vector (3 downto 0)       
        
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
    
clk_enable: process
    begin
    
        wait for 500 ms;
        tb_clk_en <= '1';
        
        wait for 8 ns;
        tb_clk_en <= '0';


    end process clk_enable;

  
    dut : fancy_counter
    port map (
    
        clk  => tb_clk,
        clk_en => tb_clk_en,
	dir => tb_dir,
	en => tb_en,
	ld => tb_ld,
	rst => tb_rst,
	updn => tb_updn,
	val => tb_val,
	cnt =>tb_cnt
    
    );

    
end testbench; 
