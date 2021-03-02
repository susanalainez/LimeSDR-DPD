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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/02/2021 09:40:45"

-- 
-- Device: Altera EP4CE40F23A7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DPD IS
    PORT (
	clk : IN std_logic;
	reset_n : IN std_logic;
	data_valid : IN std_logic;
	xpi : IN std_logic_vector(13 DOWNTO 0);
	xpq : IN std_logic_vector(13 DOWNTO 0);
	ypi : OUT std_logic_vector(13 DOWNTO 0);
	ypq : OUT std_logic_vector(13 DOWNTO 0)
	);
END DPD;

-- Design Ports Information
-- clk	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_valid	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[0]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[1]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[2]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[3]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[4]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[5]	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[6]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[7]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[8]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[9]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[10]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[11]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[12]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpi[13]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[0]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[1]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[3]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[4]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[5]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[6]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[7]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[8]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[9]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[10]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[11]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[12]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xpq[13]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[0]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[1]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[2]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[3]	=>  Location: PIN_H20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[4]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[5]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[6]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[7]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[8]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[9]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[10]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[11]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[12]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypi[13]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[1]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[2]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[3]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[4]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[5]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[6]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[7]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[8]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[9]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[10]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[11]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[12]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ypq[13]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DPD IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_data_valid : std_logic;
SIGNAL ww_xpi : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_xpq : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_ypi : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_ypq : std_logic_vector(13 DOWNTO 0);
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \data_valid~input_o\ : std_logic;
SIGNAL \xpi[0]~input_o\ : std_logic;
SIGNAL \xpi[1]~input_o\ : std_logic;
SIGNAL \xpi[2]~input_o\ : std_logic;
SIGNAL \xpi[3]~input_o\ : std_logic;
SIGNAL \xpi[4]~input_o\ : std_logic;
SIGNAL \xpi[5]~input_o\ : std_logic;
SIGNAL \xpi[6]~input_o\ : std_logic;
SIGNAL \xpi[7]~input_o\ : std_logic;
SIGNAL \xpi[8]~input_o\ : std_logic;
SIGNAL \xpi[9]~input_o\ : std_logic;
SIGNAL \xpi[10]~input_o\ : std_logic;
SIGNAL \xpi[11]~input_o\ : std_logic;
SIGNAL \xpi[12]~input_o\ : std_logic;
SIGNAL \xpi[13]~input_o\ : std_logic;
SIGNAL \xpq[0]~input_o\ : std_logic;
SIGNAL \xpq[1]~input_o\ : std_logic;
SIGNAL \xpq[2]~input_o\ : std_logic;
SIGNAL \xpq[3]~input_o\ : std_logic;
SIGNAL \xpq[4]~input_o\ : std_logic;
SIGNAL \xpq[5]~input_o\ : std_logic;
SIGNAL \xpq[6]~input_o\ : std_logic;
SIGNAL \xpq[7]~input_o\ : std_logic;
SIGNAL \xpq[8]~input_o\ : std_logic;
SIGNAL \xpq[9]~input_o\ : std_logic;
SIGNAL \xpq[10]~input_o\ : std_logic;
SIGNAL \xpq[11]~input_o\ : std_logic;
SIGNAL \xpq[12]~input_o\ : std_logic;
SIGNAL \xpq[13]~input_o\ : std_logic;
SIGNAL \ypi[0]~output_o\ : std_logic;
SIGNAL \ypi[1]~output_o\ : std_logic;
SIGNAL \ypi[2]~output_o\ : std_logic;
SIGNAL \ypi[3]~output_o\ : std_logic;
SIGNAL \ypi[4]~output_o\ : std_logic;
SIGNAL \ypi[5]~output_o\ : std_logic;
SIGNAL \ypi[6]~output_o\ : std_logic;
SIGNAL \ypi[7]~output_o\ : std_logic;
SIGNAL \ypi[8]~output_o\ : std_logic;
SIGNAL \ypi[9]~output_o\ : std_logic;
SIGNAL \ypi[10]~output_o\ : std_logic;
SIGNAL \ypi[11]~output_o\ : std_logic;
SIGNAL \ypi[12]~output_o\ : std_logic;
SIGNAL \ypi[13]~output_o\ : std_logic;
SIGNAL \ypq[0]~output_o\ : std_logic;
SIGNAL \ypq[1]~output_o\ : std_logic;
SIGNAL \ypq[2]~output_o\ : std_logic;
SIGNAL \ypq[3]~output_o\ : std_logic;
SIGNAL \ypq[4]~output_o\ : std_logic;
SIGNAL \ypq[5]~output_o\ : std_logic;
SIGNAL \ypq[6]~output_o\ : std_logic;
SIGNAL \ypq[7]~output_o\ : std_logic;
SIGNAL \ypq[8]~output_o\ : std_logic;
SIGNAL \ypq[9]~output_o\ : std_logic;
SIGNAL \ypq[10]~output_o\ : std_logic;
SIGNAL \ypq[11]~output_o\ : std_logic;
SIGNAL \ypq[12]~output_o\ : std_logic;
SIGNAL \ypq[13]~output_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset_n <= reset_n;
ww_data_valid <= data_valid;
ww_xpi <= xpi;
ww_xpq <= xpq;
ypi <= ww_ypi;
ypq <= ww_ypq;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X59_Y0_N2
\ypi[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N30
\ypi[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[1]~output_o\);

-- Location: IOOBUF_X48_Y43_N9
\ypi[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[2]~output_o\);

-- Location: IOOBUF_X67_Y34_N23
\ypi[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[3]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\ypi[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[4]~output_o\);

-- Location: IOOBUF_X50_Y0_N9
\ypi[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[5]~output_o\);

-- Location: IOOBUF_X52_Y43_N16
\ypi[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[6]~output_o\);

-- Location: IOOBUF_X67_Y10_N16
\ypi[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[7]~output_o\);

-- Location: IOOBUF_X45_Y43_N2
\ypi[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[8]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\ypi[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[9]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\ypi[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[10]~output_o\);

-- Location: IOOBUF_X67_Y9_N16
\ypi[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[11]~output_o\);

-- Location: IOOBUF_X67_Y10_N2
\ypi[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[12]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\ypi[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypi[13]~output_o\);

-- Location: IOOBUF_X11_Y43_N16
\ypq[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[0]~output_o\);

-- Location: IOOBUF_X59_Y43_N9
\ypq[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[1]~output_o\);

-- Location: IOOBUF_X0_Y41_N9
\ypq[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[2]~output_o\);

-- Location: IOOBUF_X67_Y7_N23
\ypq[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[3]~output_o\);

-- Location: IOOBUF_X61_Y0_N16
\ypq[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\ypq[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[5]~output_o\);

-- Location: IOOBUF_X59_Y43_N2
\ypq[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[6]~output_o\);

-- Location: IOOBUF_X1_Y0_N30
\ypq[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[7]~output_o\);

-- Location: IOOBUF_X45_Y43_N30
\ypq[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[8]~output_o\);

-- Location: IOOBUF_X25_Y43_N16
\ypq[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[9]~output_o\);

-- Location: IOOBUF_X0_Y18_N9
\ypq[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[10]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\ypq[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[11]~output_o\);

-- Location: IOOBUF_X67_Y37_N16
\ypq[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[12]~output_o\);

-- Location: IOOBUF_X50_Y0_N30
\ypq[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ypq[13]~output_o\);

-- Location: IOIBUF_X67_Y22_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X67_Y22_N1
\reset_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: IOIBUF_X5_Y43_N29
\data_valid~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_valid,
	o => \data_valid~input_o\);

-- Location: IOIBUF_X48_Y0_N22
\xpi[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(0),
	o => \xpi[0]~input_o\);

-- Location: IOIBUF_X38_Y0_N29
\xpi[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(1),
	o => \xpi[1]~input_o\);

-- Location: IOIBUF_X59_Y43_N15
\xpi[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(2),
	o => \xpi[2]~input_o\);

-- Location: IOIBUF_X63_Y43_N29
\xpi[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(3),
	o => \xpi[3]~input_o\);

-- Location: IOIBUF_X67_Y2_N15
\xpi[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(4),
	o => \xpi[4]~input_o\);

-- Location: IOIBUF_X67_Y37_N22
\xpi[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(5),
	o => \xpi[5]~input_o\);

-- Location: IOIBUF_X22_Y43_N1
\xpi[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(6),
	o => \xpi[6]~input_o\);

-- Location: IOIBUF_X38_Y43_N29
\xpi[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(7),
	o => \xpi[7]~input_o\);

-- Location: IOIBUF_X61_Y0_N22
\xpi[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(8),
	o => \xpi[8]~input_o\);

-- Location: IOIBUF_X3_Y0_N15
\xpi[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(9),
	o => \xpi[9]~input_o\);

-- Location: IOIBUF_X36_Y43_N15
\xpi[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(10),
	o => \xpi[10]~input_o\);

-- Location: IOIBUF_X54_Y0_N29
\xpi[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(11),
	o => \xpi[11]~input_o\);

-- Location: IOIBUF_X61_Y43_N29
\xpi[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(12),
	o => \xpi[12]~input_o\);

-- Location: IOIBUF_X48_Y0_N29
\xpi[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpi(13),
	o => \xpi[13]~input_o\);

-- Location: IOIBUF_X52_Y0_N22
\xpq[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(0),
	o => \xpq[0]~input_o\);

-- Location: IOIBUF_X18_Y0_N15
\xpq[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(1),
	o => \xpq[1]~input_o\);

-- Location: IOIBUF_X1_Y43_N8
\xpq[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(2),
	o => \xpq[2]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\xpq[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(3),
	o => \xpq[3]~input_o\);

-- Location: IOIBUF_X5_Y43_N1
\xpq[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(4),
	o => \xpq[4]~input_o\);

-- Location: IOIBUF_X67_Y19_N22
\xpq[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(5),
	o => \xpq[5]~input_o\);

-- Location: IOIBUF_X1_Y43_N22
\xpq[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(6),
	o => \xpq[6]~input_o\);

-- Location: IOIBUF_X27_Y43_N1
\xpq[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(7),
	o => \xpq[7]~input_o\);

-- Location: IOIBUF_X7_Y0_N8
\xpq[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(8),
	o => \xpq[8]~input_o\);

-- Location: IOIBUF_X56_Y43_N15
\xpq[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(9),
	o => \xpq[9]~input_o\);

-- Location: IOIBUF_X67_Y40_N22
\xpq[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(10),
	o => \xpq[10]~input_o\);

-- Location: IOIBUF_X59_Y0_N29
\xpq[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(11),
	o => \xpq[11]~input_o\);

-- Location: IOIBUF_X32_Y43_N15
\xpq[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(12),
	o => \xpq[12]~input_o\);

-- Location: IOIBUF_X56_Y43_N22
\xpq[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xpq(13),
	o => \xpq[13]~input_o\);

ww_ypi(0) <= \ypi[0]~output_o\;

ww_ypi(1) <= \ypi[1]~output_o\;

ww_ypi(2) <= \ypi[2]~output_o\;

ww_ypi(3) <= \ypi[3]~output_o\;

ww_ypi(4) <= \ypi[4]~output_o\;

ww_ypi(5) <= \ypi[5]~output_o\;

ww_ypi(6) <= \ypi[6]~output_o\;

ww_ypi(7) <= \ypi[7]~output_o\;

ww_ypi(8) <= \ypi[8]~output_o\;

ww_ypi(9) <= \ypi[9]~output_o\;

ww_ypi(10) <= \ypi[10]~output_o\;

ww_ypi(11) <= \ypi[11]~output_o\;

ww_ypi(12) <= \ypi[12]~output_o\;

ww_ypi(13) <= \ypi[13]~output_o\;

ww_ypq(0) <= \ypq[0]~output_o\;

ww_ypq(1) <= \ypq[1]~output_o\;

ww_ypq(2) <= \ypq[2]~output_o\;

ww_ypq(3) <= \ypq[3]~output_o\;

ww_ypq(4) <= \ypq[4]~output_o\;

ww_ypq(5) <= \ypq[5]~output_o\;

ww_ypq(6) <= \ypq[6]~output_o\;

ww_ypq(7) <= \ypq[7]~output_o\;

ww_ypq(8) <= \ypq[8]~output_o\;

ww_ypq(9) <= \ypq[9]~output_o\;

ww_ypq(10) <= \ypq[10]~output_o\;

ww_ypq(11) <= \ypq[11]~output_o\;

ww_ypq(12) <= \ypq[12]~output_o\;

ww_ypq(13) <= \ypq[13]~output_o\;
END structure;


