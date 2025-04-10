LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY sreg IS
PORT( d : IN std_logic;
	c : IN std_logic;
	q1 : OUT std_logic;
	q2 : OUT std_logic );
END sreg;
ARCHITECTURE behav OF sreg IS
	SIGNAL q11:std_logic;
	SIGNAL q22:std_logic;
BEGIN
PROCESS (c)
	BEGIN
		IF c ='0' THEN q11<=q1, q22<=q2
		ELSE d<=q11, q1<=q22;
		END IF;
END PROCESS;
END behav;
