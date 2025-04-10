LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY sdreg1 IS
PORT( d : IN std_logic;
	r : IN std_logic;
	c : IN std_logic;
	q1 : INOUT std_logic;
	q2 : OUT std_logic );
END sdreg1;
ARCHITECTURE behav OF sdreg1 IS
	SIGNAL q11:std_logic;
	SIGNAL q22:std_logic;
BEGIN
PROCESS (r, c)
BEGIN
	IF r = '0' THEN 
		q1<='0';
		q2<='0';
		q11<='0';
		q22<='0';	
	ELSE
		IF c = '1' THEN 
			q11<=d;
			q22<=q1;
		END IF;
		IF c = '0' THEN
			q1<=q11;
			q2<=q22;	
		END IF;
	END IF;
END PROCESS;
END behav;
