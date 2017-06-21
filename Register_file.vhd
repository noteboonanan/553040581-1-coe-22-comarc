----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:41 06/19/2017 
-- Design Name: 
-- Module Name:    Register_file - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use iEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
	port(
		 rdA        : out unsigned(31 downto 0);
		 rdB        : out unsigned(31 downto 0);
		 data_in    : in  unsigned(31 downto 0);
		 regwrite 	: in  std_logic;
		 sr1      	: in  unsigned(4 downto 0);
		 sr2	     	: in  unsigned(4 downto 0);
		 dr			: in  unsigned(4 downto 0);
		 clk        : in  std_logic
		 
		 );
end register_file;

architecture Behavioral of Register_file is
	type registerFile is array(0 to 31) of unsigned(31 downto 0);
	signal registers : registerFile := (others => (others =>'1')); -- set all reg	 bit to 1
begin
	regFile : process (clk) is
	begin
		if clk = '1' and clk'event then
			if regwrite = '1' then
				registers(to_integer(dr)) <= data_in;
			end if;
		end if;
	end process;
	rdA <= registers(to_integer(sr1));
	rdB <= registers(to_integer(sr2));
end Behavioral;

