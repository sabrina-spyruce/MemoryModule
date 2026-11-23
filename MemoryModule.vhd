-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Sun Nov 01 13:47:00 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY MemoryModule IS 
	PORT
	(
		Clock :  IN  STD_LOGIC;
		Write :  IN  STD_LOGIC;
		Address :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		DataIn :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DataOut :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END MemoryModule;

ARCHITECTURE bdf_type OF MemoryModule IS 

COMPONENT ram32x4
	PORT(wren : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : ram32x4
PORT MAP(wren => Write,
		 clock => Clock,
		 address => Address,
		 data => DataIn,
		 q => DataOut);


END bdf_type;