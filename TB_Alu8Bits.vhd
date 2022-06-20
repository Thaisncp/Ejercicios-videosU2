library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Alu8Bits is
end TB_Alu8Bits;

architecture Behavioral of TB_Alu8Bits is

component Alu8Bits is
	port(
		a_i: in STD_LOGIC_VECTOR(7 downto 0);
		b_i: in STD_LOGIC_VECTOR(7 downto 0);
		opc_i: in STD_LOGIC_VECTOR(1 downto 0);
		d_o: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

signal a_s: STD_LOGIC_VECTOR(7 downto 0);
signal b_s: STD_LOGIC_VECTOR(7 downto 0);
signal opc_s: STD_LOGIC_VECTOR(1 downto 0);
signal d_s: STD_LOGIC_VECTOR(7 downto 0);
 
begin

UUT: Alu8Bits port map(a_s, b_s, opc_s, d_s);

a_s <= "00010001", "01100101" after 5 ns;
b_s <= "00100011", "00000010" after 5 ns, "00111001" after 20 ns;
opc_s <= "00", "01" after 5 ns;
 
end Behavioral;
