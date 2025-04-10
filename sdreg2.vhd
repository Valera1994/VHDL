LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY sdreg2 IS
PORT( d : IN std_logic;
	r : IN std_logic;
	c1 : IN std_logic;
	c2 : IN std_logic;
	q1 : INOUT std_logic;
	q2 : OUT std_logic );
END sdreg2;
ARCHITECTURE behav OF sdreg2 IS
	SIGNAL q11:std_logic:='0';
	SIGNAL q22:std_logic:='0';
BEGIN
PROCESS (r, c1, c2)
BEGIN
	IF r = '0' THEN 
		q1<='0';
		q2<='0';	
	ELSE
		IF c1 = '1' THEN 
			q11<=d;
			q22<=q1;
		END IF;
		IF c2 = '1' THEN
			q1<=q11;
			q2<=q22;	
		END IF;
	END IF;
END PROCESS;
END behav;
