-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    fpga_0_RS232_Uart_1_RX_pin : in std_logic;
    fpga_0_RS232_Uart_1_TX_pin : out std_logic;
    fpga_0_DIP_Switches_8Bits_GPIO_IO_I_pin : in std_logic_vector(0 to 7);
    fpga_0_LEDs_8Bits_GPIO_IO_O_pin : out std_logic_vector(0 to 7);
    fpga_0_Digilent_Usb_Epp_IFCLK_pin : in std_logic;
    fpga_0_Digilent_Usb_Epp_STMEN_pin : in std_logic;
    fpga_0_Digilent_Usb_Epp_FLAGA_pin : in std_logic;
    fpga_0_Digilent_Usb_Epp_FLAGB_pin : in std_logic;
    fpga_0_Digilent_Usb_Epp_FLAGC_pin : in std_logic;
    fpga_0_Digilent_Usb_Epp_SLRD_pin : out std_logic;
    fpga_0_Digilent_Usb_Epp_SLWR_pin : out std_logic;
    fpga_0_Digilent_Usb_Epp_SLOE_pin : out std_logic;
    fpga_0_Digilent_Usb_Epp_FIFOADR_pin : out std_logic_vector(1 downto 0);
    fpga_0_Digilent_Usb_Epp_PKTEND_pin : out std_logic;
    fpga_0_Digilent_Usb_Epp_EPPRST_pin : in std_logic;
    fpga_0_Digilent_Usb_Epp_DB_pin : inout std_logic_vector(7 downto 0);
    fpga_0_Digilent_SevSeg_Disp_AN_pin : out std_logic_vector(3 downto 0);
    fpga_0_Digilent_SevSeg_Disp_SEG_pin : out std_logic_vector(7 downto 0);
    fpga_0_mem_bus_mux_0_MEM_ADDR_pin : out std_logic_vector(0 to 22);
    fpga_0_mem_bus_mux_0_DQ_pin : inout std_logic_vector(0 to 15);
    fpga_0_mem_bus_mux_0_MEM_OEN_pin : out std_logic;
    fpga_0_mem_bus_mux_0_MEM_WEN_pin : out std_logic;
    fpga_0_mem_bus_mux_0_RAM_CEN_O_pin : out std_logic;
    fpga_0_mem_bus_mux_0_RAM_BEN_O_pin : out std_logic_vector(0 to 1);
    fpga_0_mem_bus_mux_0_FLASH_ADDR_pin : out std_logic_vector(5 to 7);
    fpga_0_mem_bus_mux_0_FLASH_CEN_O_pin : out std_logic;
    fpga_0_mem_bus_mux_0_FLASH_RPN_O_pin : out std_logic;
    fpga_0_mem_bus_mux_0_QUAD_SPI_C_O_pin : out std_logic;
    fpga_0_mem_bus_mux_0_QUAD_SPI_S_O_pin : out std_logic;
    fpga_0_mem_bus_mux_0_MOSI_QUAD_SPI_pin : inout std_logic;
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic;
    ps2_keyboard_0_ext_kb_clk_pin : inout std_logic;
    ps2_keyboard_0_ext_kb_data_pin : inout std_logic;
    ps2_keyboard_0_ext_keys_pressed_pin : out std_logic_vector(31 downto 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      fpga_0_RS232_Uart_1_RX_pin : in std_logic;
      fpga_0_RS232_Uart_1_TX_pin : out std_logic;
      fpga_0_DIP_Switches_8Bits_GPIO_IO_I_pin : in std_logic_vector(0 to 7);
      fpga_0_LEDs_8Bits_GPIO_IO_O_pin : out std_logic_vector(0 to 7);
      fpga_0_Digilent_Usb_Epp_IFCLK_pin : in std_logic;
      fpga_0_Digilent_Usb_Epp_STMEN_pin : in std_logic;
      fpga_0_Digilent_Usb_Epp_FLAGA_pin : in std_logic;
      fpga_0_Digilent_Usb_Epp_FLAGB_pin : in std_logic;
      fpga_0_Digilent_Usb_Epp_FLAGC_pin : in std_logic;
      fpga_0_Digilent_Usb_Epp_SLRD_pin : out std_logic;
      fpga_0_Digilent_Usb_Epp_SLWR_pin : out std_logic;
      fpga_0_Digilent_Usb_Epp_SLOE_pin : out std_logic;
      fpga_0_Digilent_Usb_Epp_FIFOADR_pin : out std_logic_vector(1 downto 0);
      fpga_0_Digilent_Usb_Epp_PKTEND_pin : out std_logic;
      fpga_0_Digilent_Usb_Epp_EPPRST_pin : in std_logic;
      fpga_0_Digilent_Usb_Epp_DB_pin : inout std_logic_vector(7 downto 0);
      fpga_0_Digilent_SevSeg_Disp_AN_pin : out std_logic_vector(3 downto 0);
      fpga_0_Digilent_SevSeg_Disp_SEG_pin : out std_logic_vector(7 downto 0);
      fpga_0_mem_bus_mux_0_MEM_ADDR_pin : out std_logic_vector(0 to 22);
      fpga_0_mem_bus_mux_0_DQ_pin : inout std_logic_vector(0 to 15);
      fpga_0_mem_bus_mux_0_MEM_OEN_pin : out std_logic;
      fpga_0_mem_bus_mux_0_MEM_WEN_pin : out std_logic;
      fpga_0_mem_bus_mux_0_RAM_CEN_O_pin : out std_logic;
      fpga_0_mem_bus_mux_0_RAM_BEN_O_pin : out std_logic_vector(0 to 1);
      fpga_0_mem_bus_mux_0_FLASH_ADDR_pin : out std_logic_vector(5 to 7);
      fpga_0_mem_bus_mux_0_FLASH_CEN_O_pin : out std_logic;
      fpga_0_mem_bus_mux_0_FLASH_RPN_O_pin : out std_logic;
      fpga_0_mem_bus_mux_0_QUAD_SPI_C_O_pin : out std_logic;
      fpga_0_mem_bus_mux_0_QUAD_SPI_S_O_pin : out std_logic;
      fpga_0_mem_bus_mux_0_MOSI_QUAD_SPI_pin : inout std_logic;
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic;
      ps2_keyboard_0_ext_kb_clk_pin : inout std_logic;
      ps2_keyboard_0_ext_kb_data_pin : inout std_logic;
      ps2_keyboard_0_ext_keys_pressed_pin : out std_logic_vector(31 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      fpga_0_RS232_Uart_1_RX_pin => fpga_0_RS232_Uart_1_RX_pin,
      fpga_0_RS232_Uart_1_TX_pin => fpga_0_RS232_Uart_1_TX_pin,
      fpga_0_DIP_Switches_8Bits_GPIO_IO_I_pin => fpga_0_DIP_Switches_8Bits_GPIO_IO_I_pin,
      fpga_0_LEDs_8Bits_GPIO_IO_O_pin => fpga_0_LEDs_8Bits_GPIO_IO_O_pin,
      fpga_0_Digilent_Usb_Epp_IFCLK_pin => fpga_0_Digilent_Usb_Epp_IFCLK_pin,
      fpga_0_Digilent_Usb_Epp_STMEN_pin => fpga_0_Digilent_Usb_Epp_STMEN_pin,
      fpga_0_Digilent_Usb_Epp_FLAGA_pin => fpga_0_Digilent_Usb_Epp_FLAGA_pin,
      fpga_0_Digilent_Usb_Epp_FLAGB_pin => fpga_0_Digilent_Usb_Epp_FLAGB_pin,
      fpga_0_Digilent_Usb_Epp_FLAGC_pin => fpga_0_Digilent_Usb_Epp_FLAGC_pin,
      fpga_0_Digilent_Usb_Epp_SLRD_pin => fpga_0_Digilent_Usb_Epp_SLRD_pin,
      fpga_0_Digilent_Usb_Epp_SLWR_pin => fpga_0_Digilent_Usb_Epp_SLWR_pin,
      fpga_0_Digilent_Usb_Epp_SLOE_pin => fpga_0_Digilent_Usb_Epp_SLOE_pin,
      fpga_0_Digilent_Usb_Epp_FIFOADR_pin => fpga_0_Digilent_Usb_Epp_FIFOADR_pin,
      fpga_0_Digilent_Usb_Epp_PKTEND_pin => fpga_0_Digilent_Usb_Epp_PKTEND_pin,
      fpga_0_Digilent_Usb_Epp_EPPRST_pin => fpga_0_Digilent_Usb_Epp_EPPRST_pin,
      fpga_0_Digilent_Usb_Epp_DB_pin => fpga_0_Digilent_Usb_Epp_DB_pin,
      fpga_0_Digilent_SevSeg_Disp_AN_pin => fpga_0_Digilent_SevSeg_Disp_AN_pin,
      fpga_0_Digilent_SevSeg_Disp_SEG_pin => fpga_0_Digilent_SevSeg_Disp_SEG_pin,
      fpga_0_mem_bus_mux_0_MEM_ADDR_pin => fpga_0_mem_bus_mux_0_MEM_ADDR_pin,
      fpga_0_mem_bus_mux_0_DQ_pin => fpga_0_mem_bus_mux_0_DQ_pin,
      fpga_0_mem_bus_mux_0_MEM_OEN_pin => fpga_0_mem_bus_mux_0_MEM_OEN_pin,
      fpga_0_mem_bus_mux_0_MEM_WEN_pin => fpga_0_mem_bus_mux_0_MEM_WEN_pin,
      fpga_0_mem_bus_mux_0_RAM_CEN_O_pin => fpga_0_mem_bus_mux_0_RAM_CEN_O_pin,
      fpga_0_mem_bus_mux_0_RAM_BEN_O_pin => fpga_0_mem_bus_mux_0_RAM_BEN_O_pin,
      fpga_0_mem_bus_mux_0_FLASH_ADDR_pin => fpga_0_mem_bus_mux_0_FLASH_ADDR_pin,
      fpga_0_mem_bus_mux_0_FLASH_CEN_O_pin => fpga_0_mem_bus_mux_0_FLASH_CEN_O_pin,
      fpga_0_mem_bus_mux_0_FLASH_RPN_O_pin => fpga_0_mem_bus_mux_0_FLASH_RPN_O_pin,
      fpga_0_mem_bus_mux_0_QUAD_SPI_C_O_pin => fpga_0_mem_bus_mux_0_QUAD_SPI_C_O_pin,
      fpga_0_mem_bus_mux_0_QUAD_SPI_S_O_pin => fpga_0_mem_bus_mux_0_QUAD_SPI_S_O_pin,
      fpga_0_mem_bus_mux_0_MOSI_QUAD_SPI_pin => fpga_0_mem_bus_mux_0_MOSI_QUAD_SPI_pin,
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin,
      ps2_keyboard_0_ext_kb_clk_pin => ps2_keyboard_0_ext_kb_clk_pin,
      ps2_keyboard_0_ext_kb_data_pin => ps2_keyboard_0_ext_kb_data_pin,
      ps2_keyboard_0_ext_keys_pressed_pin => ps2_keyboard_0_ext_keys_pressed_pin
    );

end architecture STRUCTURE;

