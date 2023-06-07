library ieee;
library work;
use ieee.std_logic_1164.all;
use work.Gates.all; 

entity and_3 is 
	
	port(A, B, C: in std_logic;
		  Y      :   out std_logic);
	
end entity; 

architecture structural of and_3 is
	
	signal w1: std_logic;
	
	begin 
		
	A1: AND_2 port map(A => A, B => B, Y => w1);	
	A2: AND_2 port map(A => w1, B => C, Y => Y);	
		
end structural;