library ieee;
library work;

use ieee.std_logic_1164.all;
use work.Gates.all; 

entity detect_prime is
   port (A,B,C,D: in std_logic; Y: out std_logic);
end entity detect_prime;

architecture structural of detect_prime is

	signal w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11: std_logic;
	
	component and_3 is 
			port(A, B, C: in std_logic; Y: out std_logic);
	end component;
	
begin

	IN1: INVERTER PORT MAP(A => A, Y => w1);
	IN2: INVERTER PORT MAP(A => B, Y => w2); 
	AN1: and_3 PORT MAP(A => w1, B => w2, C => C, Y => w3); 
	
	IN3: INVERTER PORT MAP(A => A, Y => w4);
	AN2: and_3 PORT MAP(A => w4, B => C, C => D, Y => w5);
	
	OR1: OR_2 PORT MAP(A => w3, B => w5, Y => w6);
	
	-----------------------------------------------------------------
	
	IN4: INVERTER PORT MAP(A => B, Y => w7);
	AN3: and_3 PORT MAP(A => w7, B => C, C => D, Y => w8); 
	
	IN5: INVERTER PORT MAP(A => C, Y => w9);
	AN4: and_3 PORT MAP(A => B, B => w9, C => D, Y => w10);	
	
	OR2: OR_2 PORT MAP(A => w8, B => w10, Y => w11); 
	
	----------------------------------------------------------------- 
	
	OR3: OR_2 PORT MAP(A => w6, B => w11, Y => Y);
		 
end structural;