entity evenparityGate is 
	generic(prop_delay: Time := 10 ns);
	port(a_in,b_in,c_in: in bit;
             result: out bit);
end entity evenparityGate; 


architecture behavior1 of evenparityGate is
begin
	xnorProcess : process(a_in,b_in,c_in) is
	
	begin
	  	if (a_in = '0' and b_in = '0' and c_in = '0') or (a_in = '0' and b_in = '1' and c_in = '1') or (a_in = '1' and b_in = '0' and c_in = '1') or (a_in = '0' and b_in = '1' and c_in = '1') then
		result <= '1';
		
		else if (a_in = '1' and b_in = '1' and c_in ='1') or (a_in = '0' and b_in = '0' and c_in = '1') or (a_in = '0' and b_in = '1' and c_in = '0') or (a_in = '1' and b_in = '0' and c_in = '0') then
		result <= '0';

		end if;
		end if;

	end process xnorProcess;
end architecture behavior1;
