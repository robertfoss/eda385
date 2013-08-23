library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity convert_scancode is
	Port(
		rst          : in  std_logic;
		clk          : in  std_logic;
		edge_found   : in  std_logic;
		sync_kb_data : in  std_logic;
		scan_code    : out std_logic_vector(7 downto 0));
end convert_scancode;

architecture behavioral of convert_scancode is
	signal shift   : std_logic_vector(9 downto 0);
	signal counter : unsigned(3 downto 0);

begin
	process(clk, rst, edge_found, sync_kb_data)
	begin
		if(rst = '0') then
			shift <= "0000000000";

		else
			if(clk'event and clk = '1' and edge_found = '1') then
				for i in 9 downto 1 loop
					shift(i) <= shift(i - 1);
				end loop;
				shift(0) <= sync_kb_data;
			end if;
		end if;
	end process;

	process(shift, rst, clk, edge_found)
	begin
		if(rst = '0') then
			scan_code      <= "00000000";
			counter <= "0000";
		elsif(clk'event and clk = '1') then
			scan_code <=(others => '0');
			if(edge_found = '1') then
				counter <= counter + 1;
				if(counter = 10) then
					for i in 7 downto 0 loop
						scan_code(i) <= shift(1+i);
					end loop;
					counter <= "0000";
				end if;
			end if;
		else
		-- do nothing
		end if;
	end process;
end behavioral;