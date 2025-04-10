LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dtr IS
PORT( d : IN std_logic;
	l : IN std_logic;
	q : INOUT std_logic;
	qb : INOUT std_logic );
END dtr;
ARCHITECTURE behav OF dtr IS
COMPONENT notand
PORT( a : IN std_logic;
	 b: IN std_logic;
	 c: INOUT std_logic);
END COMPONENT;
COMPONENT rstr
PORT( s : IN std_logic;
	r : IN std_logic;
	q : INOUT std_logic;
	qb : INOUT std_logic );
END COMPONENT;
	SIGNAL dq:std_logic;
	SIGNAL lqb:std_logic;
BEGIN
u1: notand
	PORT MAP ( d, l, dq );
u2: notand
	PORT MAP ( l, dq, lqb );
u3: rstr
	PORT MAP ( dq, lqb, q, qb );
END behav;
CONFIGURATION con OF dtr IS
	FOR behav
		FOR u1, u2: notand
			USE ENTITY work.notand (behavior);
		END FOR;
		FOR u3: rstr
			USE ENTITY work.rstr (behavior);
		END FOR;
	END FOR;
END con;
