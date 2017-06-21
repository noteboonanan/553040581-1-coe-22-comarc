--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:05:39 06/21/2017
-- Design Name:   
-- Module Name:   E:/Project/COA/ALU_32/general_register_tb.vhd
-- Project Name:  ALU_32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: general_register
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY general_register_tb IS
END general_register_tb;
 
ARCHITECTURE behavior OF general_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT general_register
    PORT(
         d : IN  std_logic_vector(31 downto 0);
         ld : IN  std_logic;
         clr : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(31 downto 0) := (others => '0');
   signal ld : std_logic := '0';
   signal clr : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: general_register PORT MAP (
          d => d,
          ld => ld,
          clr => clr,
          clk => clk,
          q => q
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
		d <= x"0000000e";
		wait for 100 ns;
		ld <= '1';
		wait for 100 ns;
		clr <= '1';
		d <= x"0000000e";
		wait for 100 ns;
		ld <= '1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
