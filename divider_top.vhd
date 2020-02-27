
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity  divider_top is
    port(

        clk  : in std_logic;        -- 125 Mhz clock
       
        led0: out std_logic       


    );
end divider_top;

architecture behavior of divider_top is

 --   signal counter : std_logic_vector(25 downto 0) := (others => '0');
    signal outreg,div :std_logic;
  --  signal outbuffer: std_logic;

component clock_div is
Port(clk:in std_logic;
     div:out std_logic);
end component;

begin

  --clock_div port map (div => div2);
reg: clock_div port map (clk => clk, div => div);

registro: process(clk)

	begin
		if (rising_edge(CLK)) then
		    if (div='1') then 
			outreg <= not(outreg);
			
		    end if;
		end if;
	end process;

led0<= outreg;
   
end behavior;