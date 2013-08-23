library ieee;
use ieee.std_logic_1164.all;

entity keyboard_top is
	port(
		rst					: in  std_logic;
		clk					: in  std_logic;
		kb_clk				: in  std_logic;
		kb_data				: in  std_logic;
		tmp_scan_code		: out	std_logic_vector(7 downto 0);
		tmp_kb_clk			: out std_logic;
		tmp_kb_data			: out std_logic;
		keys_pressed		: out std_logic_vector(31 downto 0);--TODO:REMOVE
		sync_kb_clk_out		: out std_logic;
		sync_kb_data_out	: out std_logic);--TODO:REMOVE
end keyboard_top;

architecture structural of keyboard_top is
	component sync_keyboard
		Port(
			kb_clk       : in  std_logic;
			kb_data      : in  std_logic;
			clk          : in  std_logic;
			rst          : in  std_logic;
			sync_kb_clk  : out std_logic;
			sync_kb_data : out std_logic);
	end component;

	component detect_falling_edge
		Port(
			sync_kb_clk : in  std_logic;
			clk         : in  std_logic;
			rst         : in  std_logic;
			edge_found  : out std_logic);
	end component;

	component convert_scancode
		Port(
			rst          : in  std_logic;
			clk          : in  std_logic;
			edge_found   : in  std_logic;
			sync_kb_data : in  std_logic;
			scan_code    : out std_logic_vector(7 downto 0));
	end component;
	
	component output_logic
		Port(
			rst				: in  std_logic;
			clk				: in  std_logic;
			scan_code		: in  std_logic_vector(7 downto 0);
			keys_pressed	: out std_logic_vector(31 downto 0));
	end component;

	-- top signals
--	signal kb_clk			: std_logic;
--	signal kb_data			: std_logic;
--	signal clk				: std_logic;
--	signal rst				: std_logic;
	signal scan_code		: std_logic_vector(7 downto 0);
	signal sync_kb_clk	: std_logic;
	signal sync_kb_data	: std_logic;
	signal edge_found	: std_logic;
--	signal keys_pressed	: std_logic_vector(31 downto 0);

begin
   SYNC_KB : sync_keyboard
		port map(
			kb_clk       => kb_clk,
			kb_data      => kb_data,
			clk          => clk,
			rst          => rst,
			sync_kb_clk  => sync_kb_clk,
			sync_kb_data => sync_kb_data);
			
	DETECT_FALLING_EDG : detect_falling_edge
	   port map(
	      sync_kb_clk  => sync_kb_clk,
	      edge_found   => edge_found,
	      clk          => clk,
	      rst          => rst);

	CONV_SCANCODE : convert_scancode
	   port map(
	      edge_found	=> edge_found,
	      sync_kb_data	=> sync_kb_data,
	      clk			=> clk,
	      rst			=> rst,
	      scan_code		=> scan_code);
	      
   OUT_LOGIC : output_logic
	   port map(
	      scan_code		=> scan_code,
	      clk			=> clk,
	      rst			=> rst,
	      keys_pressed	=> keys_pressed);
			
	process(clk, scan_code)
	begin
		if(clk'event and clk='1') then
			tmp_scan_code <= scan_code;
			tmp_kb_clk <= kb_clk;
			tmp_kb_data <= kb_data;
		end if;			
	end process;
	
	sync_kb_clk_out <= sync_kb_clk;--TODO:REMOVE
	sync_kb_data_out <= sync_kb_data;--TODO:REMOVE
	
end structural;