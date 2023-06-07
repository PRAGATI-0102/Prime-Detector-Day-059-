-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  _gate.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   
	component detect_prime is
		port (A,B,C,D: in std_logic; Y: out std_logic);		  
   end component;
	
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: detect_prime 
			port map(
			
					A   => input_vector(3),  --MSB
					B   => input_vector(2),
					C   => input_vector(1),
					D   => input_vector(0),  --LSB

					Y   => output_vector(0));
					

end DutWrap;
