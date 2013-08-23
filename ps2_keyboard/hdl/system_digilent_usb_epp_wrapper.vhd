-------------------------------------------------------------------------------
-- system_digilent_usb_epp_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library d_usb_epp_dstm_v1_00_a;
use d_usb_epp_dstm_v1_00_a.all;

entity system_digilent_usb_epp_wrapper is
  port (
    IFCLK : in std_logic;
    STMEN : in std_logic;
    FLAGA : in std_logic;
    FLAGB : in std_logic;
    FLAGC : in std_logic;
    SLRD : out std_logic;
    SLWR : out std_logic;
    SLOE : out std_logic;
    FIFOADR : out std_logic_vector(1 downto 0);
    PKTEND : out std_logic;
    EPPRST : in std_logic;
    int_usb : out std_logic;
    DB_I : in std_logic_vector(7 downto 0);
    DB_O : out std_logic_vector(7 downto 0);
    DB_T : out std_logic_vector(7 downto 0);
    IRQ_EPP : out std_logic;
    SPLB_Clk : in std_logic;
    SPLB_Rst : in std_logic;
    PLB_ABus : in std_logic_vector(0 to 31);
    PLB_UABus : in std_logic_vector(0 to 31);
    PLB_PAValid : in std_logic;
    PLB_SAValid : in std_logic;
    PLB_rdPrim : in std_logic;
    PLB_wrPrim : in std_logic;
    PLB_masterID : in std_logic_vector(0 to 0);
    PLB_abort : in std_logic;
    PLB_busLock : in std_logic;
    PLB_RNW : in std_logic;
    PLB_BE : in std_logic_vector(0 to 3);
    PLB_MSize : in std_logic_vector(0 to 1);
    PLB_size : in std_logic_vector(0 to 3);
    PLB_type : in std_logic_vector(0 to 2);
    PLB_lockErr : in std_logic;
    PLB_wrDBus : in std_logic_vector(0 to 31);
    PLB_wrBurst : in std_logic;
    PLB_rdBurst : in std_logic;
    PLB_wrPendReq : in std_logic;
    PLB_rdPendReq : in std_logic;
    PLB_wrPendPri : in std_logic_vector(0 to 1);
    PLB_rdPendPri : in std_logic_vector(0 to 1);
    PLB_reqPri : in std_logic_vector(0 to 1);
    PLB_TAttribute : in std_logic_vector(0 to 15);
    Sl_addrAck : out std_logic;
    Sl_SSize : out std_logic_vector(0 to 1);
    Sl_wait : out std_logic;
    Sl_rearbitrate : out std_logic;
    Sl_wrDAck : out std_logic;
    Sl_wrComp : out std_logic;
    Sl_wrBTerm : out std_logic;
    Sl_rdDBus : out std_logic_vector(0 to 31);
    Sl_rdWdAddr : out std_logic_vector(0 to 3);
    Sl_rdDAck : out std_logic;
    Sl_rdComp : out std_logic;
    Sl_rdBTerm : out std_logic;
    Sl_MBusy : out std_logic_vector(0 to 1);
    Sl_MWrErr : out std_logic_vector(0 to 1);
    Sl_MRdErr : out std_logic_vector(0 to 1);
    Sl_MIRQ : out std_logic_vector(0 to 1)
  );
end system_digilent_usb_epp_wrapper;

architecture STRUCTURE of system_digilent_usb_epp_wrapper is

  component d_usb_epp_dstm is
    generic (
      C_NUM_USER_REGS : INTEGER;
      FIFO_ADDR_WIDTH : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_SPLB_AWIDTH : INTEGER;
      C_SPLB_DWIDTH : INTEGER;
      C_SPLB_NUM_MASTERS : INTEGER;
      C_SPLB_MID_WIDTH : INTEGER;
      C_SPLB_NATIVE_DWIDTH : INTEGER;
      C_SPLB_P2P : INTEGER;
      C_SPLB_SUPPORT_BURSTS : INTEGER;
      C_SPLB_SMALLEST_MASTER : INTEGER;
      C_SPLB_CLK_PERIOD_PS : INTEGER;
      C_INCLUDE_DPHASE_TIMER : INTEGER;
      C_FAMILY : STRING
    );
    port (
      IFCLK : in std_logic;
      STMEN : in std_logic;
      FLAGA : in std_logic;
      FLAGB : in std_logic;
      FLAGC : in std_logic;
      SLRD : out std_logic;
      SLWR : out std_logic;
      SLOE : out std_logic;
      FIFOADR : out std_logic_vector(1 downto 0);
      PKTEND : out std_logic;
      EPPRST : in std_logic;
      int_usb : out std_logic;
      DB_I : in std_logic_vector(7 downto 0);
      DB_O : out std_logic_vector(7 downto 0);
      DB_T : out std_logic_vector(7 downto 0);
      IRQ_EPP : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to (C_SPLB_MID_WIDTH-1));
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to ((C_SPLB_DWIDTH/8)-1));
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to (C_SPLB_DWIDTH-1));
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to (C_SPLB_DWIDTH-1));
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MWrErr : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MRdErr : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MIRQ : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1))
    );
  end component;

begin

  Digilent_Usb_Epp : d_usb_epp_dstm
    generic map (
      C_NUM_USER_REGS => 256,
      FIFO_ADDR_WIDTH => 11,
      C_BASEADDR => X"cbc00000",
      C_HIGHADDR => X"cbc0ffff",
      C_SPLB_AWIDTH => 32,
      C_SPLB_DWIDTH => 32,
      C_SPLB_NUM_MASTERS => 2,
      C_SPLB_MID_WIDTH => 1,
      C_SPLB_NATIVE_DWIDTH => 32,
      C_SPLB_P2P => 0,
      C_SPLB_SUPPORT_BURSTS => 0,
      C_SPLB_SMALLEST_MASTER => 32,
      C_SPLB_CLK_PERIOD_PS => 20000,
      C_INCLUDE_DPHASE_TIMER => 1,
      C_FAMILY => "spartan6"
    )
    port map (
      IFCLK => IFCLK,
      STMEN => STMEN,
      FLAGA => FLAGA,
      FLAGB => FLAGB,
      FLAGC => FLAGC,
      SLRD => SLRD,
      SLWR => SLWR,
      SLOE => SLOE,
      FIFOADR => FIFOADR,
      PKTEND => PKTEND,
      EPPRST => EPPRST,
      int_usb => int_usb,
      DB_I => DB_I,
      DB_O => DB_O,
      DB_T => DB_T,
      IRQ_EPP => IRQ_EPP,
      SPLB_Clk => SPLB_Clk,
      SPLB_Rst => SPLB_Rst,
      PLB_ABus => PLB_ABus,
      PLB_UABus => PLB_UABus,
      PLB_PAValid => PLB_PAValid,
      PLB_SAValid => PLB_SAValid,
      PLB_rdPrim => PLB_rdPrim,
      PLB_wrPrim => PLB_wrPrim,
      PLB_masterID => PLB_masterID,
      PLB_abort => PLB_abort,
      PLB_busLock => PLB_busLock,
      PLB_RNW => PLB_RNW,
      PLB_BE => PLB_BE,
      PLB_MSize => PLB_MSize,
      PLB_size => PLB_size,
      PLB_type => PLB_type,
      PLB_lockErr => PLB_lockErr,
      PLB_wrDBus => PLB_wrDBus,
      PLB_wrBurst => PLB_wrBurst,
      PLB_rdBurst => PLB_rdBurst,
      PLB_wrPendReq => PLB_wrPendReq,
      PLB_rdPendReq => PLB_rdPendReq,
      PLB_wrPendPri => PLB_wrPendPri,
      PLB_rdPendPri => PLB_rdPendPri,
      PLB_reqPri => PLB_reqPri,
      PLB_TAttribute => PLB_TAttribute,
      Sl_addrAck => Sl_addrAck,
      Sl_SSize => Sl_SSize,
      Sl_wait => Sl_wait,
      Sl_rearbitrate => Sl_rearbitrate,
      Sl_wrDAck => Sl_wrDAck,
      Sl_wrComp => Sl_wrComp,
      Sl_wrBTerm => Sl_wrBTerm,
      Sl_rdDBus => Sl_rdDBus,
      Sl_rdWdAddr => Sl_rdWdAddr,
      Sl_rdDAck => Sl_rdDAck,
      Sl_rdComp => Sl_rdComp,
      Sl_rdBTerm => Sl_rdBTerm,
      Sl_MBusy => Sl_MBusy,
      Sl_MWrErr => Sl_MWrErr,
      Sl_MRdErr => Sl_MRdErr,
      Sl_MIRQ => Sl_MIRQ
    );

end architecture STRUCTURE;

