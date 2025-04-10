LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY memreg2 IS
PORT( x1 : IN std_logic;
	x2 : IN std_logic;
	x3 : IN std_logic;
	x4 : IN std_logic;
	reset : IN std_logic;
	write : IN std_logic;
	read : IN std_logic;
	q1 : OUT std_logic;
	q2 : OUT std_logic;
	q3 : OUT std_logic;
	q4 : OUT std_logic );
END memreg2;
ARCHITECTURE behav OF memreg2 IS
	SIGNAL q11:std_logic;
	SIGNAL q22:std_logic;
	SIGNAL q33:std_logic;
	SIGNAL q44:std_logic;
BEGIN
PROCESS (reset, write, read)
BEGIN
	IF reset = '0' THEN
		q11<='0';
		q22<='0';
		q33<='0';
		q44<='0';
	ELSIF write = '1' THEN
		q11<=x1;
		q22<=x2;
		q33<=x3;
		q44<=x4;		
	END IF;

	IF read = '1' THEN
		q1<=q11;
		q2<=q22;
		q3<=q33;
		q4<=q44;
	ELSE
		q1<='0';
		q2<='0';
		q3<='0';
		q4<='0';	
	END IF;
END PROCESS;
END behav;
