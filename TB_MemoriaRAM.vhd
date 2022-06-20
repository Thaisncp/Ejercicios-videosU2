LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_MemoriaRAM IS
END TB_MemoriaRAM;
 
ARCHITECTURE behavior OF TB_MemoriaRAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemoriaR
    PORT(
         clk : IN  std_logic;
         datoEntrada : IN  std_logic_vector(1 downto 0);
         direccion : IN  std_logic_vector(1 downto 0);
         CE : IN  std_logic;
         OE : IN  std_logic;
         WE : IN  std_logic;
         datoSalida : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal datoEntrada : std_logic_vector(1 downto 0) := (others => '0');
   signal direccion : std_logic_vector(1 downto 0) := (others => '0');
   signal CE : std_logic := '0';
   signal OE : std_logic := '0';
   signal WE : std_logic := '0';

 	--Outputs
   signal datoSalida : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoriaR PORT MAP (
          clk => clk,
          datoEntrada => datoEntrada,
          direccion => direccion,
          CE => CE,
          OE => OE,
          WE => WE,
          datoSalida => datoSalida
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
      CE <= '0';
		WE <= '0';
		OE <= '1';
		datoEntrada <= "11";
		direccion <= "00";
      wait for clk_period;
		WE <= '1';
		OE <= '0';
		direccion <= "00";		
      wait;
   end process;

END;