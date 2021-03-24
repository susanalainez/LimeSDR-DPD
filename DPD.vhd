-------------------------------------------------------------------------------
-- FILE: DPD.vhd
-- DESCRIPTION: Quadrature predistorter model
-- DATE: Apr 26, 2016
-- AUTHOR (s): Borisav Jovanovic, Lime Microsystems
-- REVISIONS: everything is piple-plated, there is no square root, everything is made through generics
--------------------------------------------------- ----------------------------
-- the range of coefficients is from [-16, 16],
-- showing in potp. complement, 18 bits
-- aaaaa. bbbb bbbb bbbb b
-- the unit is 0x 0000 1000 0000 0000 0
--------------------------------------------------- ----------------------------	
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;	 
use ieee.std_logic_arith.all;

-- ----------------------------------------------------------------------------
-- Entity declaration
-- ----------------------------------------------------------------------------


entity DPD is
--constant BUS_WIDTH : real := 16;
	generic (
		n: natural:=5; -- memory depth
		m: natural:=3; -- nonlinearity
		BUS_WIDTH : natural := 47;
		mul_n: natural:=52); -- multiplier precision
	port (
		clk  		: in std_logic;
		--sclk  		: in std_logic;
		reset_n   	: in std_logic;
		data_valid	: in std_logic;
		xpi       	: in std_logic_vector(BUS_WIDTH downto 0); 	-- real
		xpq       	: in std_logic_vector(BUS_WIDTH downto 0); 	-- imaginary
		ypi       	: out std_logic_vector(BUS_WIDTH downto 0);  	-- real
		ypq       	: out std_logic_vector(BUS_WIDTH downto 0)--; 	-- imaginary
		--spi_ctrl  	: in std_logic_vector(15 downto 0); 
		--spi_data  	: in std_logic_vector(15 downto 0);
		--inp: in std_logic;
		--outp: out std_logic
		);
	
end entity DPD;

architecture structure of DPD is
	
	component Multiplier2 IS
		generic ( 
			dataa_n: natural:= mul_n-1;  -- number of results bits
			result_n: natural:= 2*mul_n-1);   -- addition addi == 1
		PORT
			(
			dataa		: IN STD_LOGIC_VECTOR (dataa_n DOWNTO 0);
			datab		: IN STD_LOGIC_VECTOR (dataa_n DOWNTO 0);
			result		: OUT STD_LOGIC_VECTOR (result_n DOWNTO 0)
			);
	END component Multiplier2;
	
	component adder is
		generic ( 
			res_n: natural:= mul_n;  -- number of results bits
			op_n: natural:=mul_n;   -- the number of bits of the operand
			addi: natural:=1);   -- addition addi == 1
		port(
			dataa		: in std_logic_vector (op_n-1 downto 0);
			datab		: in std_logic_vector (op_n-1 downto 0);
			res		: out std_logic_vector (res_n-1 downto 0));
	end component  Adder;
	
	type cols is array (M downto 0) of std_logic_vector(mul_n-1 downto 0);
	type matr is array (N downto 0) of cols;
	type matr4 is array (M downto 0) of cols;
	
	type cols2 is array (M downto 0) of std_logic_vector(2*mul_n-1 downto 0);
	type matr2 is array (N downto 0) of cols2;	
	
	type cols3 is array (M downto 0) of std_logic_vector(mul_n+46 downto 0);  -- bilo je 8
	type matr3 is array (N downto 0) of cols3;	
	
	signal epprim: cols; 
	
	constant extens: std_logic_vector(mul_n-mul_n downto 0):=(others=>'0'); 
	signal XIp, XQp, XIpp, XQpp: std_logic_vector(mul_n-1 downto 0);	
	signal sig1, sig2: std_logic_vector(2*mul_n-1 downto 0);
	signal sig3, sig4, ep, epp: std_logic_vector(mul_n-1 downto 0);
	
	signal xIep, xQep : matr;
	signal xIep_z, xQep_z : matr4;
	
	signal xIep_s, xQep_s : cols2; 

	signal res1, res2, res3, res4: matr2;
	signal res1_s, res2_s, res3_s, res4_s: matr3; 
	signal ijYpI,  ijYpQ, ijYpI_s,ijYpQ_s: matr2;   
	
	type row2 is array (N downto 0) of std_logic_vector(2*mul_n-1 downto 0);
	
	signal iYpI, iYpQ : row2;
	signal YpI_s2, YpQ_s2 : std_logic_vector(2*mul_n-1 downto 0);
	
	signal a, ap, b, bp: matr;
	--signal address_ij: std_logic_vector(7 downto 0);
	constant zer: std_logic_vector(mul_n-19 downto 0):=(others=>'0');  
	
	constant all_zeros: std_logic_vector(mul_n-5 downto 0):=(others=>'0'); -- it was mul_n-1 downto 0
	constant all_ones: std_logic_vector(mul_n-5 downto 0):=(others=>'1');  -- it was mul_n-1 downto 0 	
	signal sigI, sigQ: std_logic_vector(mul_n-5 downto 0);	-- was (mul_n-1 downto 0)  
	signal	ypi_s, ypq_s: std_logic_vector(BUS_WIDTH downto 0); 
	
	signal inpp: std_logic_vector(2*(N+M+5) downto 0); -- delay line
	signal address_i, address_j: std_logic_vector(3 downto 0);
begin   
	
	-- TO DO
	a(0)(0) <= (others=>'1'); -- std_logic_vector(mul_n-1 downto 0) 18 bit
	a(0)(1) <= (others=>'1');
	a(0)(2) <= (others=>'1');
	a(0)(3) <= (others=>'1');
	a(1)(0) <= (others=>'1');
	a(1)(1) <= (others=>'1');
	a(1)(2) <= (others=>'1');
	a(1)(3) <= (others=>'1');
	a(2)(0) <= (others=>'1');
	a(2)(1) <= (others=>'1');
	a(2)(2) <= (others=>'1');
	a(2)(3) <= (others=>'1');
	a(3)(0) <= (others=>'1');
	a(3)(1) <= (others=>'1');
	a(3)(2) <= (others=>'1');
	a(3)(3) <= (others=>'1');
	a(4)(0) <= (others=>'1');
	a(4)(1) <= (others=>'1');
	a(4)(2) <= (others=>'1');
	a(4)(3) <= (others=>'1');
	a(5)(0) <= (others=>'1');
	a(5)(1) <= (others=>'1');
	a(5)(2) <= (others=>'1');
	a(5)(3) <= (others=>'1');

	b(0)(0) <= (others=>'1'); -- std_logic_vector(mul_n-1 downto 0) 18 bit
	b(0)(1) <= (others=>'1');
	b(0)(2) <= (others=>'1');
	b(0)(3) <= (others=>'1');
	b(1)(0) <= (others=>'1');
	b(1)(1) <= (others=>'1');
	b(1)(2) <= (others=>'1');
	b(1)(3) <= (others=>'1');
	b(2)(0) <= (others=>'1');
	b(2)(1) <= (others=>'1');
	b(2)(2) <= (others=>'1');
	b(2)(3) <= (others=>'1');
	b(3)(0) <= (others=>'1');
	b(3)(1) <= (others=>'1');
	b(3)(2) <= (others=>'1');
	b(3)(3) <= (others=>'1');
	b(4)(0) <= (others=>'1');
	b(4)(1) <= (others=>'1');
	b(4)(2) <= (others=>'1');
	b(4)(3) <= (others=>'1');
	b(5)(0) <= (others=>'1');
	b(5)(1) <= (others=>'1');
	b(5)(2) <= (others=>'1');
	b(5)(3) <= (others=>'1');

	

	--process(reset_n, sclk) is  -- SPI STUFF
	--begin	
	--	if reset_n='0' then	
	--		for i in 0 to n loop
	--			for j in 0 to m loop
	--				a(i)(j)<=(others=>'0');
	--				ap(i)(j)<=(others=>'0');
	--				b(i)(j)<=(others=>'0');
	--				bp(i)(j)<=(others=>'0');	
	--			end loop;
	--		end loop;
	--		a(0)(0)<=x"0800"&zer;  -- unit coefficient, was: x "2000" & zer
	--		ap(0)(0)<=x"0800"&zer;
	--	elsif (sclk'event and sclk='1') then
	--		if (spi_ctrl(15 downto 12)="0011") then	
	--			
	--			ap(CONV_INTEGER(address_i))(CONV_INTEGER(address_j))<= spi_data&spi_ctrl(9 downto 8);
	--		elsif  (spi_ctrl(15 downto 12)= "1100") then -- update b coeff					
	--			bp(CONV_INTEGER(address_i))(CONV_INTEGER(address_j))<= spi_data&spi_ctrl(9 downto 8);
	--		elsif	(spi_ctrl(15 downto 12)= "1111") then -- update a and b coeff				
	--			for i in 0 to n loop
	--				for j in 0 to m loop
	--					a(i)(j)<=ap(i)(j);
	--					b(i)(j)<=bp(i)(j);	
	--				end loop;
	--			end loop;				  
	--		end if;		  
	--	end if;
	--end process; 	
	
	--inpp(0)<=inp;
	--lab4: process (clk, reset_n) is  -- 
	--begin
	--	if reset_n='0' then			
	--		l1: for k in 1 to 2*(N+M+5) loop
	--			inpp(k)<='0';
	--		end loop;			
	--		ypi<=(others=>'0');
	--		ypq<=(others=>'0');
	--	elsif (clk'event and clk='1') then	-- pipeline				
	--		-- total delay
	--		l2: for k in 1 to 2*(N+M+5) loop
	--			inpp(k)<=inpp(k-1);
	--		end loop;
	--		-- delay 2 bars
	--		if (data_valid='1') then
	--			ypi <=  ypi_s;
	--			ypq <=  ypq_s;
	--		end if;
	--	end if;			
	--end process;	
	--outp<=inpp(2*(N+M+5)); -- for delay
	
	
	lab_IN: process (clk, reset_n) is  -- sign extension from 14 bit to 18 bit
	begin	
		if reset_n='0' then	
			XIp<= (others=>'0');
			XQp<= (others=>'0');
		elsif   (clk'event and clk='1') then		
			XIp<=xpi(BUS_WIDTH)&xpi(BUS_WIDTH)&xpi(BUS_WIDTH)&xpi&extens;   --xpi, xpq 14-bit numbers, belong to the range [-8191,8192]
			--XIp<=xpi(BUS_WIDTH)&xpi(BUS_WIDTH)&xpi(BUS_WIDTH)&xpi&extens;   --xpi, xpq 14-bit numbers, belong to the range [-8191,8192]
			XQp<=xpq(BUS_WIDTH)&xpq(BUS_WIDTH)&xpq(BUS_WIDTH)&xpq&extens;   
		end if;
	end process;
	
	-- 00010...000=1.0 (three zeros in front)  2**14	(OK)
	
	Mult1: multiplier2 
	port map (dataa=>XIp, datab=>XIp, result=>sig1);  -- sig1 is 36 bit
	sig3(mul_n-1 downto 0)<=sig1(2*mul_n-5 downto mul_n-4);  -- normalized to FS	 (31 downto 14)
	-- sig3:00010..000 = 1.0	   2**14   sig3 18 bit num
	
	Mult2: multiplier2 
	port map (dataa=>XQp, datab=>XQp, result=>sig2);
	sig4(mul_n-1 downto 0)<=sig2(2*mul_n-5 downto mul_n-4);  -- normalized to FS	
	-- sig4:00010..000 = 1.0	  2**14	
	-- ep: 00010..000 = 1.0		  2**14
	
	Adder1: adder  generic map( res_n=> mul_n, op_n=> mul_n, addi=> 1) 
	port map (dataa=>sig3, datab=>sig4, res=>ep);  -- sum of squares	 
	
	-- delay 2 bars
	labX0: process (clk, reset_n) is
	begin
		if reset_n='0' then  
			xIpp<=(others=>'0');
			xQpp<=(others=>'0');
			epp<=(others=>'0');
		elsif (clk'event and clk='1') then -- pipeline
			if (data_valid='1') then   
				xIpp<=xIp;
				xQpp<=xQp;
				epp<=ep;
			end if;			
		end if;			
	end process; 	
	
	-- delay M * 2 = 3 * 2 = 6 cycles
	xIep_z(0)(0)<=XIpp;  
	xQep_z(0)(0)<=XQpp;  
	epprim(0)<=epp;	
	
	lab5: for j in 1 to M generate
		Mult3:  multiplier2 
		port map (dataa=>xIep_z(j-1)(j-1), datab=>epprim(j-1), result=>xIep_s(j-1));	 -- any epic	
		Mult4:  multiplier2 
		port map (dataa=>xQep_z(j-1)(j-1), datab=>epprim(j-1), result=>xQep_s(j-1));	-- any epic
		
		lab6: process (clk, reset_n) is
		begin
			if reset_n='0' then  
				xIep_z(j)(j)<=(others=>'0');
				xQep_z(j)(j)<=(others=>'0');
				epprim(j)<=(others=>'0');
			elsif (clk'event and clk='1') then -- pipeline
				if (data_valid='1') then   
					xIep_z(j)(j)<=xIep_s(j-1)(2*mul_n-5 downto mul_n-4);
					xQep_z(j)(j)<=xQep_s(j-1)(2*mul_n-5 downto mul_n-4);
					epprim(j)<=epprim(j-1);
				end if;			
			end if;			
		end process;				-- algorithm
		-- 00010..000 = 1.0	  2**14			
		labX1: for k in 0 to j-1 generate			
			labX2: process (clk, reset_n) is
			begin
				if reset_n='0' then  
					xIep_z(j)(k)<=(others=>'0');
					xQep_z(j)(k)<=(others=>'0');
				elsif (clk'event and clk='1') then -- pipeline
					if (data_valid='1') then   
						xIep_z(j)(k)<=xIep_z(j-1)(k); 
						xQep_z(j)(k)<=xQep_z(j-1)(k);					
					end if;			
				end if;			
			end process;               	
		end generate;
	end generate;
	
	labX3: for j in 0 to M generate -- nonlinearity		
		xIep(0)(j)<=xIep_z(M)(j); 
		xQep(0)(j)<=xQep_z(M)(j);		
	end generate;
	
	-- delay 2 * N = 2 * 3 = 6 cycles
	lab1: for i in N downto 1 generate
		lab2: for j in 0 to M generate			
			lab3: process (clk, reset_n) is
			begin
				if reset_n='0' then  
					xIep(i)(j)<=(others=>'0');
					xQep(i)(j)<=(others=>'0');
				elsif (clk'event and clk='1') then
					if (data_valid='1') then
						xIep(i)(j) <= xIep(i-1)(j);
						xQep(i)(j) <= xQep(i-1)(j);	
					end if;
				end if;			
			end process;		
		end generate;
	end generate;
--------------------------------------------------- 
-- coefficients are in the range of [-16, 16]
-- 16 bit values
-- 8192 * [- 4, 4] = [- 32768, 32767]
-- 000010 .... 00 = 1.0


-- delay 2 + 2 + 2 = 6 cycles
	lab7: for i in 0 to N generate 	
		lab8: for j in 0 to M generate
			
			--    YpI  += a[i][j]* xIep[i][j] - b[i][j]* xQep[i][j]; // 19.11.2015
			--    YpQ  += a[i][j]* xQep[i][j] + b[i][j]* xIep[i][j]; // 19.11.2015 
			
			-- 00010..000 = 1.0	  2**14  xIep
			-- 0000 1000 0000 0000 00 = 1.0	  2**BUS_WIDTH	 koeficijent
			
			Mult5:  multiplier2 
			port map (dataa=>a(i)(j), datab=>xIep(i)(j), result=>res1(i)(j));
			
			Mult6:  multiplier2 
			port map (dataa=>b(i)(j), datab=>xQep(i)(j), result=>res2(i)(j));		
			
			res1_s(i)(j)<=res1(i)(j)(2*mul_n-1 downto mul_n-BUS_WIDTH); -- normalization HERE
			res2_s(i)(j)<=res2(i)(j)(2*mul_n-1 downto mul_n-BUS_WIDTH); 	   
			
			Adder3: adder generic map (res_n=>2*mul_n, op_n=>mul_n+BUS_WIDTH, addi=>0) -- subtraction 
			port map (dataa=>res1_s(i)(j), datab=>res2_s(i)(j), res=>ijYpI(i)(j)); 
			
			Mult7:  multiplier2 
			port map (dataa=>a(i)(j), datab=>xQep(i)(j), result=>res3(i)(j));
			
			Mult8:  multiplier2 
			port map (dataa=>b(i)(j), datab=>xIep(i)(j), result=>res4(i)(j));
			
			res3_s(i)(j)<=res3(i)(j)(2*mul_n-1 downto mul_n-BUS_WIDTH); -- normalization HERE
			res4_s(i)(j)<=res4(i)(j)(2*mul_n-1 downto mul_n-BUS_WIDTH); 
			
			Adder4: adder generic map (res_n=>2*mul_n, op_n=>mul_n+BUS_WIDTH, addi=>1) -- addition
			port map (dataa=>res3_s(i)(j), datab=>res4_s(i)(j), res=>ijYpQ(i)(j)); 
			
			lab9: process (clk, reset_n) is
			begin
				if reset_n='0' then  
					ijYpI_s(i)(j)<=(others=>'0');
					ijYpQ_s(i)(j)<=(others=>'0');
				elsif (clk'event and clk='1') then  -- pipeline
					if (data_valid='1') then
						ijYpI_s(i)(j)<=ijYpI(i)(j); 
						ijYpQ_s(i)(j)<=ijYpQ(i)(j);	 
					end if;
				end if;			
			end process;			
		end generate;
		
		lab10: process (clk, reset_n) is
			variable iYpI_s,iYpQ_s: std_logic_vector(2*mul_n-1 downto 0);
		begin
			if reset_n='0' then  
				iYpI_s:=(others=>'0');
				iYpQ_s:=(others=>'0');
			elsif (clk'event and clk='1') then	-- pipeline
				if (data_valid='1') then
					iYpI_s:=(others=>'0');	
					iYpQ_s:=(others=>'0');					
					for j in 0 to M loop
						iYpI_s:=iYpI_s + ijYpI_s(i)(j); 
						iYpQ_s:=iYpQ_s + ijYpQ_s(i)(j);
					end loop;
				end if;				
			end if;
			iYpI(i)<=iYpI_s;
			iYpQ(i)<=iYpQ_s;           		   
		end process;
	end generate;
	
	lab11: process (clk, reset_n) is
		variable YpI_s,YpQ_s: std_logic_vector(2*mul_n-1 downto 0);
	begin
		if reset_n='0' then  
			YpI_s:=(others=>'0');
			YpQ_s:=(others=>'0');
		elsif (clk'event and clk='1') then	 -- pipeline
			if (data_valid='1') then
				YpI_s:=(others=>'0');
				YpQ_s:=(others=>'0');				
				for i in 0 to N loop
					YpI_s:=YpI_s + iYpI(i); 
					YpQ_s:=YpQ_s + iYpQ(i);
				end loop;
			end if;			  
		end if;
		YpI_s2<=YpI_s;
		YpQ_s2<=YpQ_s;  		   
	end process;	
	
	sigI<= YpI_s2(2*mul_n-1 downto mul_n+4);  
	sigQ<= YpQ_s2(2*mul_n-1 downto mul_n+4);
	
	comp_I: process (YpI_s2, sigI)is
	begin		
		if 	(sigI= all_zeros) then
			ypi_s<=YpI_s2(mul_n+21 downto mul_n-26); 
		elsif  (sigI= all_ones) then
			ypi_s<=YpI_s2(mul_n+21 downto mul_n-26); 
		elsif sigI(mul_n-5)='0' then 
			ypi_s<=(BUS_WIDTH=>'0', others=>'1'); 
		else
			ypi_s<=(BUS_WIDTH=>'1', others=>'0'); 
		end if;
		
	end process;
	
	comp_Q: process (YpQ_s2, sigQ)is
	begin		
		if 	(sigQ= all_zeros) then
			ypq_s<=YpQ_s2(mul_n+21 downto mul_n-26); 
		elsif  (sigQ= all_ones)  then
			ypq_s<=YpQ_s2(mul_n+21 downto mul_n-26); 
		elsif sigQ(mul_n-5)='0'  then 
			ypq_s<=(BUS_WIDTH=>'0', others=>'1'); 
		else
			ypq_s<=(BUS_WIDTH=>'1', others=>'0'); 
		end if;		
	end process;	
	
end architecture structure;