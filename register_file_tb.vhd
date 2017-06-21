--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:52:08 06/21/2017
-- Design Name:   
-- Module Name:   E:/Project/COA/ALU_32/register_file_tb.vhd
-- Project Name:  ALU_32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use iEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         rdA : OUT  unsigned(31 downto 0);
         rdB : OUT  unsigned(31 downto 0);
         data_in : IN  unsigned(31 downto 0);
         regwrite : IN  std_logic;
         sr1 : IN  unsigned(4 downto 0);
         sr2 : IN  unsigned(4 downto 0);
         dr : IN  unsigned(4 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : unsigned(31 downto 0) := (others => '0');
   signal regwrite : std_logic := '0';
   signal sr1 : unsigned(4 downto 0) := (others => '0');
   signal sr2 : unsigned(4 downto 0) := (others => '0');
   signal dr : unsigned(4 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal rdA : unsigned(31 downto 0);
   signal rdB : unsigned(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          rdA => rdA,
          rdB => rdB,
          data_in => data_in,
          regwrite => regwrite,
          sr1 => sr1,
          sr2 => sr2,
          dr => dr,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		regwrite <= '0';
		data_in <= x"00000001";
		dr <= "00001";
		sr1 <= "00000";
		sr2 <= "00001";
		wait for 100 ns;	
		regwrite <= '1';
		data_in <= x"00000001";
		dr <= "00001";
		sr1 <= "00000";
		sr2 <= "00001";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
