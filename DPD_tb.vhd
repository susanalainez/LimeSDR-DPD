-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT DPD
          PORT(
                  clk : IN std_logic;
                  reset_n : IN std_logic; 
            data_valid : IN std_logic; 
            xpi : IN std_logic_vector(15 downto 0);
            xpq : IN std_logic_vector(15 downto 0);
                  ypi : OUT std_logic_vector(15 downto 0);
            ypq : OUT std_logic_vector(15 downto 0)
                  );
          END COMPONENT;

            signal clk : std_logic := '0';
            signal reset_n : std_logic := '0';
            signal data_valid : std_logic := '1'; 
            signal xpi : std_logic_vector(15 downto 0) := (others=>'0');
            signal xpq : std_logic_vector(15 downto 0) := (others=>'0');
            signal ypi : std_logic_vector(15 downto 0);
            signal ypq : std_logic_vector(15 downto 0);
          

  BEGIN

  -- Component Instantiation
          uut: DPD PORT MAP(
                  clk => clk,
            reset_n => reset_n,
            data_valid => data_valid,
            xpi => xpi,
            xpq => xpq,
            ypi => ypi,
            ypq => ypq
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
      reset_n <= '1';
        -- Add user defined stimulus here
      loop
      clk <= '1';
      wait for 100 ns;
      clk <= '0';
      wait for 100 ns;
      end loop;
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
