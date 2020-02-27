
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debounce is
    port(

        clk : in std_logic;        -- 125 Mhz clock
        btn : in std_logic;
        dbnc : out std_logic

    );
end debounce;

architecture behavior of debounce is

    signal counter : std_logic_vector(21 downto 0) := (others => '0');
    signal d1,d2 :std_logic;

begin


shift1: process (clk)
	begin
		if (rising_edge(CLK)) then		  
			d1 <= btn;
		    end if;
		
	end process;

shift2: process (clk)
	begin
		if (rising_edge(CLK)) then		  
			d2 <= d1;
		    end if;
		
	end process;


-- if button 0, output 0
debcounter: process(clk)
    begin
if (btn='1') then
       if rising_edge(clk) then             

		  if (unsigned(counter) < 2499999) then
                      counter <= std_logic_vector(unsigned(counter) + 1);
		      dbnc <= '0';
		  else 
		      dbnc <= d2;
			
                  end if;
    
                
            end if;
          else
            dbnc<= '0';
              end if;
    end process;

end behavior;