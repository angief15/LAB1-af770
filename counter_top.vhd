
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity  counter_top is
    port(

        clk  : in std_logic;        -- 125 Mhz clock
        btn : in std_logic_vector(3 downto 0);
	    sw : in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0)   


    );
end counter_top;

architecture behavior of counter_top is

component clock_div is
Port(clk:in std_logic;
     div:out std_logic);
end component;

component debounce is
port(   clk : in std_logic;   
        btn : in std_logic;
        dbnc : out std_logic);
end component;

component fancy_counter is 
port(   clk, clk_en, dir, en, ld, rst, updn  : in std_logic;       
        val: in std_logic_vector (3 downto 0);
        cnt: out std_logic_vector (3 downto 0)    );
end component;    

      signal div, rst, en, ld, updn :std_logic;
      signal dbnc0, dbnc1, dbnc2, dbnc3 : std_logic;
      signal cnt : std_logic_vector(3 downto 0);
      


begin

  --clock_div port map (div => div2);
reg: clock_div port map (clk => clk, 
			 div => div);

button0: debounce port map( clk=> clk,
			    btn => btn(0),
			    dbnc => rst );
button1: debounce port map( clk=> clk,
			    btn => btn(1),
			    dbnc => en );
button2: debounce port map( clk=> clk,
			    btn => btn(2),
			    dbnc => updn );
button3: debounce port map( clk=> clk,
			    btn => btn(3),
			    dbnc => ld );

fancy: fancy_counter port map( clk=> clk,
			       clk_en => div,
			       dir => sw(0),
			       en => en,
			       ld => ld,
			       rst => rst,
			       updn => updn,
			       val => sw,
			       cnt => cnt         );

led <= cnt;


end behavior;