library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity DE0Serializer is 
port( --Data_in : in std_logic_vector(11 downto 0);
		DataReady : in std_logic;
		clk : in std_logic;
		LED2 : out std_logic;
		LED : out std_logic);
		
end DE0Serializer;

architecture behavior of DE0Serializer is

signal CLK_DIV : std_logic_vector(23 downto 0);
constant data_in_s : std_logic_vector := "101010101010";
-- signal data_in_s : std_logic_vector(11 downto 0);
component P2S is 
	Port ( Serial_out     : out std_logic;
			clk            : in std_logic;
			Parallel_data  : in std_logic_vector(11 downto 0);
			DataReady      : in std_logic);
end component;				

begin

--data_in_s <= data_in;
	process (clk) -- clock divider
	begin
       if (clk'Event and clk = '1') then
           CLK_DIV <= CLK_DIV + '1';	
       end if;
   end process;
	LED2 <= not DataReady;
-- LED <= clk_div(23);
	
	serializer : P2S port map (
		parallel_data => data_in_s,
		clk => CLK_DIV(23),
		
		DataReady => not DataReady,
		Serial_out => LED
		);							

	
	
end behavior;
