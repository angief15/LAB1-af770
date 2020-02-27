library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity fancy_counter is
    port(

        clk, clk_en, dir, en, ld, rst, updn  : in std_logic;       
        val: in std_logic_vector (3 downto 0);
        cnt: out std_logic_vector (3 downto 0)       

    );
end fancy_counter;

architecture behavior of fancy_counter is

    signal counter : std_logic_vector(3 downto 0):= (others => '0');
    signal value : std_logic_vector (3 downto 0):= (others => '0');
    signal direction : std_logic;

begin

process(clk)
    begin
  if (en = '1') then
     if rising_edge(clk) then  
        if (rst = '1') then 
	     cnt <= "0000";
         end if; 
         end if;
     
	
	-- Clock in rising edge:     
	   if rising_edge(clk) then  
               if (ld='1') then  
                    value <= val;
		end if; 
		end if; 
        if rising_edge(clk) then   
	       if (updn='1') then
	           direction <= dir;
		
	       end if; 
	       end if;
          
         if (clk_en = '1') then 
		 if rising_edge(clk) then  
            if (direction = '1') then    

		counter<="0000";     
		cnt<=counter;          
               if (unsigned(counter) < unsigned(value)) then
                    counter <= std_logic_vector(unsigned(counter) + 1);
                    cnt<=counter;
		      else
		            counter <= "0000";
		            cnt<=counter;
		      end if;
 
		elsif (direction = '0') then 
		 counter <= value;
		 cnt<=counter;
		   if (unsigned(counter) > 0) then
                    counter <= std_logic_vector(unsigned(counter) - 1);
                    cnt<=counter;
		   else
		          counter <= value;     
		          cnt<=counter;              
           end if;                  
          end if;
            
         end if;
         end if;   
         end if;

  end process;
    
end behavior;