library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity output_logic is
	Port(
		rst							: in  std_logic;
		clk							: in  std_logic;
		scan_code   				: in  std_logic_vector(7 downto 0);
		keys_pressed				: out std_logic_vector(31 downto 0)--;
		--tmp_internal_scan_code	: out std_logic_vector(7 downto 0)
		);
end output_logic;

architecture behavioral of output_logic is
	signal internal_scan_code		: std_logic_vector(7 downto 0);
	signal int_keys_pressed			: std_logic_vector(31 downto 0);


begin

	-- Debug process
--	process(rst, clk, internal_scan_code)
--	begin
--		if(rst = '0') then
--			tmp_internal_scan_code <=(others => '0');
--		elsif(clk'event and clk='1') then
--			tmp_internal_scan_code <= internal_scan_code;
--		end if;
--	end process;

	

	process(rst, clk, scan_code)
	begin
		if(rst = '0') then
			internal_scan_code <=(others => '0');
		elsif(clk'event and clk='1') then
			case scan_code is
				when X"F0" => -- Case break code
					internal_scan_code <= X"00";
				when X"00" => -- Case no scan_code
					internal_scan_code <= X"00";
				when others =>
					internal_scan_code <= scan_code;
			end case;
		end if;
	end process;
	
	process(rst, clk, int_keys_pressed)
	begin
		keys_pressed <= int_keys_pressed;
		if(rst = '0') then
			keys_pressed <=(others => '0');
		end if;
	end process;
	
	process(rst, clk, internal_scan_code)
	variable ctr1  : std_logic;
	variable ctr2  : std_logic;
	variable ctr3  : std_logic;
	variable ctr4  : std_logic;
	begin
		if(rst = '0') then
			int_keys_pressed <=(others => '0');
			ctr1 := '0';
			ctr2 := '0';
			ctr3 := '0';
			ctr4 := '0';
		else
			if(clk'event and clk='1') then	
				case internal_scan_code is
					when X"16" => -- key 1, toggle value
						if(ctr1 = '1') then
							ctr1 := '0';
							int_keys_pressed(0) <= not(int_keys_pressed(0));
						else
							ctr1 := '1';
						end if;
					when X"1E" => -- key 2, toggle value
						if(ctr2 = '1') then
							ctr2 := '0';
							int_keys_pressed(1) <= not(int_keys_pressed(1));
						else
							ctr2 := '1';
						end if;
					when X"26" => -- key 3, toggle value
						if(ctr3 = '1') then
							ctr3 := '0';
							int_keys_pressed(2) <= not(int_keys_pressed(2));
						else
							ctr3 := '1';
						end if;
					when X"25" => -- key 4, toggle value
						if(ctr4 = '1') then
							ctr4 := '0';
							int_keys_pressed(3) <= not(int_keys_pressed(3));
						else
							ctr4 := '1';
						end if;
					when X"15" => -- key Q
						int_keys_pressed(4) <= not(int_keys_pressed(4));
					when X"1C" => -- key A
						int_keys_pressed(5) <= not(int_keys_pressed(5));
					when X"2C" => -- key T
						int_keys_pressed(6) <= not(int_keys_pressed(6));
					when X"35" => -- key Y
						int_keys_pressed(7) <= not(int_keys_pressed(7));
					when X"44" => -- key O
						int_keys_pressed(8) <= not(int_keys_pressed(8));
					when X"4D" => -- key P
						int_keys_pressed(9) <= not(int_keys_pressed(9));
					when X"46" => -- key 6
						int_keys_pressed(10) <= not(int_keys_pressed(10));
					when X"36" => -- key 9
						int_keys_pressed(11) <= not(int_keys_pressed(11));
					when others =>
						int_keys_pressed <= int_keys_pressed;
					end case;
			end if;
		end if;
				
	end process;
end behavioral;
