LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
 Port(
	clk 	:	in std_logic;
	reset	:	in std_logic;
	LED	:	out std_logic_vector (7 downto 0));
end Counter;

architecture behavior of Counter is

--signal CLK_DIV : std_logic_vector (2 downto 0);
signal COUNT : std_logic_vector (7 downto 0);

begin
 -- counter
    process (CLK, reset)
    begin
		 if (reset = '0') then
			COUNT <= (others => '0');
        elsif (CLK'Event and CLK = '1') then
            COUNT <= COUNT + '1';
        end if;
    end process;
	 
	
	 -- display the count on the LEDs
    LED <= COUNT;
	 
	 
end behavior;