library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

    entity sync_keyboard is
		Port(
			kb_clk  : in  std_logic;
			kb_data : in  std_logic;
			clk     : in  std_logic;
			rst     : in  std_logic;
			sync_kb_clk   : out std_logic;
			sync_kb_data  : out std_logic);
	 end sync_keyboard;
	 
architecture behavioral of sync_keyboard is
    
begin
    process(clk, kb_data, kb_clk, rst)
        begin
            if (rst = '0') then
                sync_kb_data <= '0';
                sync_kb_clk <= '0';
            else
               if (clk'event and clk = '1') then
                  sync_kb_data <= kb_data;
                  sync_kb_clk  <= kb_clk;
               end if;
            end if;
    end process;

end behavioral;
