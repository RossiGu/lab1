library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CSA_EAC is
	generic (n : natural);
  	 port(I0 : in STD_LOGIC_VECTOR((n-1) downto 0);
			I1 : in STD_LOGIC_VECTOR((n-1) downto 0);
			I2 : in STD_LOGIC_VECTOR((n-1) downto 0);
			S : out STD_LOGIC_VECTOR((n-1) downto 0);
			C : out STD_LOGIC_VECTOR((n-1) downto 0));
end CSA_EAC;
  
architecture Structural of CSA_EAC is
 component fulladder is
 	 port(A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
 end component;
 
signal c_intermed : STD_LOGIC_VECTOR(n downto 0);

begin
  	
    c_intermed(0) <= '0';

    gen_fulladders: for i in 0 to n-1 generate
        FA_inst : fulladder
            port map (
                A => I0(i),
                B => I1(i),
                Cin => I2(i),
                S => S(i),
                Cout => c_intermed(i+1)
            );
    end generate;
    
    C <= c_intermed(n downto 1);	
  		
end Structural;