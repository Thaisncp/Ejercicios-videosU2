library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Alu8Bits is
	Port ( a_i : in  STD_LOGIC_VECTOR (7 downto 0);
           b_i : in  STD_LOGIC_VECTOR (7 downto 0);
           opc_i : in  STD_LOGIC_VECTOR (1 downto 0);
           d_o: out  STD_LOGIC_VECTOR (7 downto 0));
end Alu8Bits;

architecture Behavioral of Alu8Bits is

begin

process(a_i, b_i, opc_i)
		begin
			case opc_i is
			when "00" =>
				d_o <= STD_LOGIC_VECTOR(unsigned(a_i) + unsigned(b_i));
			when "01" =>
				d_o <= STD_LOGIC_VECTOR(unsigned(a_i) - unsigned(b_i));
			when "10" =>
				d_o <= a_i and b_i;
			when others =>
				d_o <= a_i or b_i; 
			end case;
	end process; 

end Behavioral;
