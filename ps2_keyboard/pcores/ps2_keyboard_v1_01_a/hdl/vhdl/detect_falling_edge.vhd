library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detect_falling_edge is
	Port(
		sync_kb_clk : in  std_logic;
		clk         : in  std_logic;
		rst         : in  std_logic;
		edge_found  : out std_logic);
end detect_falling_edge;

--architecture behavioral of detect_falling_edge is
--	signal prev_kb_clk : std_logic;
--
--begin
--	process(sync_kb_clk, rst, clk)
--	begin
--		if(rst = '0') then
--			prev_kb_clk <= '1';
--		else
--			if(clk'event and clk = '1') then
--				prev_kb_clk <= sync_kb_clk;
--			end if;
--		end if;
--	end process;
--
--	process(prev_kb_clk, sync_kb_clk, clk, rst)
--	begin
--		if(rst = '0') then
--			edge_found <= 0;
--		else
--			if(clk'event and clk = '1' and prev_kb_clk = not sync_kb_clk and sync_kb_clk = '0') then
--				edge_found <= '1';
--			else
--				edge_found <= '0';
--			end if;
--		end if;
--	end process;
--end behavioral;

architecture behavioral of detect_falling_edge is
	type state_type is (one, zero, edge);

	signal n_state : state_type := one;
	signal state   : state_type := one;

begin
	process(n_state, clk, rst)
	begin
		if(clk'event and clk = '1') then
			if(rst = '0') then
				state <= zero;
			else
				state <= n_state;
			end if;
		end if;
	end process;

	process(state, rst, sync_kb_clk)
	begin
		if(rst = '0') then
			n_state <= zero;
		else
			if(sync_kb_clk = '1') then
				case state is
					when zero   => n_state <= one;
					when one    => n_state <= one;
					when edge   => n_state <= zero;
					when others => n_state <= zero; -- default
				end case;
			else
				case state is
					when zero   => n_state <= zero;
					when one    => n_state <= edge;
					when edge   => n_state <= zero;
					when others => n_state <= zero; -- default
				end case;
			end if;
		end if;

	end process;

	process(state)
	begin
		case state is
			when one | zero => edge_found <= '0';
			when edge       => edge_found <= '1';
			when others     => edge_found <= '0';
		end case;
	end process;

end behavioral;
