-- Copyright (C) 1991-2008 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 8.1 Build 163 10/28/2008 SJ Web Edition"

-- DATE "04/16/2023 01:06:23"

-- 
-- Device: Altera EPF10K30ETC144-1 Package TQFP144
-- 

-- 
-- This VHDL file should be used for Custom VHDL only
-- 

LIBRARY IEEE, flex10ke;
USE IEEE.std_logic_1164.all;
USE flex10ke.flex10ke_components.all;

ENTITY 	project IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	C : OUT std_logic_vector(3 DOWNTO 0);
	opcode : IN std_logic_vector(2 DOWNTO 0);
	clk : IN std_logic;
	ZF : OUT std_logic;
	SF : OUT std_logic;
	CF : OUT std_logic
	);
END project;

ARCHITECTURE structure OF project IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_C : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_ZF : std_logic;
SIGNAL ww_SF : std_logic;
SIGNAL ww_CF : std_logic;
SIGNAL \Add9~134_combout\ : std_logic;
SIGNAL \Mux4~908_combout\ : std_logic;
SIGNAL \Mux0~103_combout\ : std_logic;
SIGNAL \Add9~135_combout\ : std_logic;
SIGNAL \car~677_combout\ : std_logic;
SIGNAL \car~680_combout\ : std_logic;
SIGNAL \car~681_combout\ : std_logic;
SIGNAL \Mux3~1072_combout\ : std_logic;
SIGNAL \Mux2~874_combout\ : std_logic;
SIGNAL \Mux2~877_combout\ : std_logic;
SIGNAL \Mux1~865_combout\ : std_logic;
SIGNAL \Mux1~868_combout\ : std_logic;
SIGNAL \take~502_combout\ : std_logic;
SIGNAL \take~503_combout\ : std_logic;
SIGNAL \take~504_combout\ : std_logic;
SIGNAL \take~505_combout\ : std_logic;
SIGNAL \Mux9~236_combout\ : std_logic;
SIGNAL \clk~dataout\ : std_logic;
SIGNAL \count.00~regout\ : std_logic;
SIGNAL \Mux4~905_combout\ : std_logic;
SIGNAL \Mux4~906_combout\ : std_logic;
SIGNAL \Mux4~907_combout\ : std_logic;
SIGNAL \Mux4~917\ : std_logic;
SIGNAL \Mux4~911_combout\ : std_logic;
SIGNAL \C[0]~reg0_regout\ : std_logic;
SIGNAL \count.01~regout\ : std_logic;
SIGNAL \Mux3~1064_combout\ : std_logic;
SIGNAL \Mux3~1065_combout\ : std_logic;
SIGNAL \Mux3~1066_combout\ : std_logic;
SIGNAL \Mux0~102_combout\ : std_logic;
SIGNAL \count.10~regout\ : std_logic;
SIGNAL \count.11~regout\ : std_logic;
SIGNAL \car~678_combout\ : std_logic;
SIGNAL \Mux10~335_combout\ : std_logic;
SIGNAL \car~679_combout\ : std_logic;
SIGNAL \Add7~94_combout\ : std_logic;
SIGNAL \car~682_combout\ : std_logic;
SIGNAL \car~683_combout\ : std_logic;
SIGNAL \car~684_combout\ : std_logic;
SIGNAL \Mux0~104_combout\ : std_logic;
SIGNAL \Add1~76_combout\ : std_logic;
SIGNAL \Mux0~105_combout\ : std_logic;
SIGNAL \Mux0~106_combout\ : std_logic;
SIGNAL \car~regout\ : std_logic;
SIGNAL \Mux4~910_combout\ : std_logic;
SIGNAL \Mux3~1080\ : std_logic;
SIGNAL \Mux3~1074_combout\ : std_logic;
SIGNAL \C[1]~reg0_regout\ : std_logic;
SIGNAL \Mux2~884\ : std_logic;
SIGNAL \Mux2~879_combout\ : std_logic;
SIGNAL \Mux2~876_combout\ : std_logic;
SIGNAL \Mux2~888\ : std_logic;
SIGNAL \Mux2~880_combout\ : std_logic;
SIGNAL \C[2]~reg0_regout\ : std_logic;
SIGNAL \Mux1~875\ : std_logic;
SIGNAL \Mux1~870_combout\ : std_logic;
SIGNAL \Add7~93_combout\ : std_logic;
SIGNAL \Mux1~867_combout\ : std_logic;
SIGNAL \Mux1~879\ : std_logic;
SIGNAL \Mux1~871_combout\ : std_logic;
SIGNAL \C[3]~reg0_regout\ : std_logic;
SIGNAL \Equal0~29_combout\ : std_logic;
SIGNAL \C[3]~254_regout\ : std_logic;
SIGNAL \Mux10~337_combout\ : std_logic;
SIGNAL \Mux9~238_combout\ : std_logic;
SIGNAL \Mux9~237_combout\ : std_logic;
SIGNAL \take~497_combout\ : std_logic;
SIGNAL \take~506_combout\ : std_logic;
SIGNAL \take~507_combout\ : std_logic;
SIGNAL \take~regout\ : std_logic;
SIGNAL \Mux10~334_combout\ : std_logic;
SIGNAL \Mux10~336_combout\ : std_logic;
SIGNAL \CF~reg0_regout\ : std_logic;
SIGNAL \A~dataout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \B~dataout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \opcode~dataout\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_A <= A;
ww_B <= B;
C <= ww_C;
ww_opcode <= opcode;
ww_clk <= clk;
ZF <= ww_ZF;
SF <= ww_SF;
CF <= ww_CF;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Add9~134\ : flex10ke_lcell
-- Equation(s):
-- \Add9~134_combout\ = \car~regout\ $ \A~dataout\(1) $ \B~dataout\(0) $ \B~dataout\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~regout\,
	datab => \A~dataout\(1),
	datac => \B~dataout\(0),
	datad => \B~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add9~134_combout\);

\Mux0~103\ : flex10ke_lcell
-- Equation(s):
-- \Mux0~103_combout\ = \A~dataout\(0) & \Mux0~102_combout\ & \B~dataout\(0) & !\count.00~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \A~dataout\(0),
	datab => \Mux0~102_combout\,
	datac => \B~dataout\(0),
	datad => \count.00~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~103_combout\);

\Add9~135\ : flex10ke_lcell
-- Equation(s):
-- \Add9~135_combout\ = \car~regout\ & (\A~dataout\(1) # \B~dataout\(0) $ \B~dataout\(1)) # !\car~regout\ & \A~dataout\(1) & (\B~dataout\(0) $ \B~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~regout\,
	datab => \A~dataout\(1),
	datac => \B~dataout\(0),
	datad => \B~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add9~135_combout\);

\car~677\ : flex10ke_lcell
-- Equation(s):
-- \car~677_combout\ = \A~dataout\(2) & \count.10~regout\ & (\car~regout\ # \B~dataout\(2))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "8880",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \A~dataout\(2),
	datab => \count.10~regout\,
	datac => \car~regout\,
	datad => \B~dataout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~677_combout\);

\car~680\ : flex10ke_lcell
-- Equation(s):
-- \car~680_combout\ = \car~regout\ # \A~dataout\(3) & \count.11~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "fccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \car~regout\,
	datac => \A~dataout\(3),
	datad => \count.11~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~680_combout\);

\car~681\ : flex10ke_lcell
-- Equation(s):
-- \car~681_combout\ = \Add7~93_combout\ & \car~680_combout\ & !\count.10~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Add7~93_combout\,
	datac => \car~680_combout\,
	datad => \count.10~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~681_combout\);

\take~502\ : flex10ke_lcell
-- Equation(s):
-- \take~502_combout\ = \A~dataout\(1) & \take~regout\ & !\B~dataout\(1) # !\A~dataout\(1) & !\take~regout\ & \B~dataout\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "03c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \A~dataout\(1),
	datac => \take~regout\,
	datad => \B~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~502_combout\);

\take~503\ : flex10ke_lcell
-- Equation(s):
-- \take~503_combout\ = \take~502_combout\ & \count.00~regout\ & \count.01~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \take~502_combout\,
	datac => \count.00~regout\,
	datad => \count.01~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~503_combout\);

\take~504\ : flex10ke_lcell
-- Equation(s):
-- \take~504_combout\ = \take~503_combout\ # \B~dataout\(0) & !\A~dataout\(0) & !\count.00~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "aaae",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \take~503_combout\,
	datab => \B~dataout\(0),
	datac => \A~dataout\(0),
	datad => \count.00~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~504_combout\);

\take~505\ : flex10ke_lcell
-- Equation(s):
-- \take~505_combout\ = \A~dataout\(2) & \take~regout\ & !\B~dataout\(2) # !\A~dataout\(2) & !\take~regout\ & \B~dataout\(2)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "03c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \A~dataout\(2),
	datac => \take~regout\,
	datad => \B~dataout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~505_combout\);

\opcode[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_opcode(1),
	dataout => \opcode~dataout\(1));

\opcode[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_opcode(0),
	dataout => \opcode~dataout\(0));

\Mux9~236\ : flex10ke_lcell
-- Equation(s):
-- \Mux9~236_combout\ = !\opcode~dataout\(1) & !\opcode~dataout\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux9~236_combout\);

\opcode[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_opcode(2),
	dataout => \opcode~dataout\(2));

\clk~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_clk,
	dataout => \clk~dataout\);

\count.00\ : flex10ke_lcell
-- Equation(s):
-- \count.00~regout\ = DFFEA(\Mux9~236_combout\ & !\count.11~regout\ & (\opcode~dataout\(2)) # !\Mux9~236_combout\ & (\opcode~dataout\(2) & (\count.00~regout\) # !\opcode~dataout\(2) & !\count.11~regout\), GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "7411",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.11~regout\,
	datab => \Mux9~236_combout\,
	datac => \count.00~regout\,
	datad => \opcode~dataout\(2),
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \count.00~regout\);

\B[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_B(0),
	dataout => \B~dataout\(0));

\A[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_A(0),
	dataout => \A~dataout\(0));

\Mux4~905\ : flex10ke_lcell
-- Equation(s):
-- \Mux4~905_combout\ = !\opcode~dataout\(2) & (\opcode~dataout\(1) & (\B~dataout\(0) # \A~dataout\(0)) # !\opcode~dataout\(1) & (!\A~dataout\(0) # !\B~dataout\(0)))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00bd",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~dataout\(1),
	datab => \B~dataout\(0),
	datac => \A~dataout\(0),
	datad => \opcode~dataout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~905_combout\);

\Mux4~906\ : flex10ke_lcell
-- Equation(s):
-- \Mux4~906_combout\ = \opcode~dataout\(2) & \Mux9~236_combout\ # !\opcode~dataout\(2) & (\opcode~dataout\(1) & !\opcode~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "88b8",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~236_combout\,
	datab => \opcode~dataout\(2),
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~906_combout\);

\Mux4~907\ : flex10ke_lcell
-- Equation(s):
-- \Mux4~907_combout\ = \Mux4~906_combout\ & (\B~dataout\(0) $ \A~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0cc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Mux4~906_combout\,
	datac => \B~dataout\(0),
	datad => \A~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~907_combout\);

\Mux4~908\ : flex10ke_lcell
-- Equation(s):
-- \Mux4~917\ = \count.00~regout\ # !\Mux4~907_combout\ & (!\Mux4~905_combout\ # !\opcode~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "aabf",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.00~regout\,
	datab => \opcode~dataout\(0),
	datac => \Mux4~905_combout\,
	datad => \Mux4~907_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~908_combout\,
	cascout => \Mux4~917\);

\Mux4~911\ : flex10ke_lcell
-- Equation(s):
-- \Mux4~911_combout\ = (\Mux9~236_combout\ & (!\opcode~dataout\(2) # !\count.00~regout\) # !\Mux9~236_combout\ & !\count.00~regout\ & !\opcode~dataout\(2) # !\C[0]~reg0_regout\) & CASCADE(\Mux4~917\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "2bff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~236_combout\,
	datab => \count.00~regout\,
	datac => \opcode~dataout\(2),
	datad => \C[0]~reg0_regout\,
	cascin => \Mux4~917\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~911_combout\);

\C[0]~reg0\ : flex10ke_lcell
-- Equation(s):
-- \C[0]~reg0_regout\ = DFFEA(!\Mux4~911_combout\, GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Mux4~911_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \C[0]~reg0_regout\);

\count.01\ : flex10ke_lcell
-- Equation(s):
-- \count.01~regout\ = DFFEA(\opcode~dataout\(2) & (\Mux9~236_combout\ & (!\count.00~regout\) # !\Mux9~236_combout\ & \count.01~regout\) # !\opcode~dataout\(2) & (!\Mux9~236_combout\ & !\count.00~regout\), GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "08ad",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~dataout\(2),
	datab => \count.01~regout\,
	datac => \Mux9~236_combout\,
	datad => \count.00~regout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \count.01~regout\);

\Mux3~1064\ : flex10ke_lcell
-- Equation(s):
-- \Mux3~1064_combout\ = \C[1]~reg0_regout\ & !\count.01~regout\ & (\opcode~dataout\(2) # !\Mux9~236_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "008a",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \C[1]~reg0_regout\,
	datab => \opcode~dataout\(2),
	datac => \Mux9~236_combout\,
	datad => \count.01~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~1064_combout\);

\Mux3~1065\ : flex10ke_lcell
-- Equation(s):
-- \Mux3~1065_combout\ = \Mux9~236_combout\ & \Add9~134_combout\ & \count.01~regout\ # !\Mux9~236_combout\ & (\C[1]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "88f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~134_combout\,
	datab => \count.01~regout\,
	datac => \C[1]~reg0_regout\,
	datad => \Mux9~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~1065_combout\);

\Mux3~1066\ : flex10ke_lcell
-- Equation(s):
-- \Mux3~1066_combout\ = \Mux3~1064_combout\ # \opcode~dataout\(2) & \Mux3~1065_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "fccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Mux3~1064_combout\,
	datac => \opcode~dataout\(2),
	datad => \Mux3~1065_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~1066_combout\);

\Mux0~102\ : flex10ke_lcell
-- Equation(s):
-- \Mux0~102_combout\ = !\opcode~dataout\(0) & (\opcode~dataout\(2) $ \opcode~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "003c",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \opcode~dataout\(2),
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~102_combout\);

\B[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_B(2),
	dataout => \B~dataout\(2));

\count.10\ : flex10ke_lcell
-- Equation(s):
-- \count.10~regout\ = DFFEA(\opcode~dataout\(2) & (\Mux9~236_combout\ & \count.01~regout\ # !\Mux9~236_combout\ & (\count.10~regout\)) # !\opcode~dataout\(2) & \count.01~regout\ & (!\Mux9~236_combout\), GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "88e2",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.01~regout\,
	datab => \opcode~dataout\(2),
	datac => \count.10~regout\,
	datad => \Mux9~236_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \count.10~regout\);

\count.11\ : flex10ke_lcell
-- Equation(s):
-- \count.11~regout\ = DFFEA(\opcode~dataout\(2) & (\Mux9~236_combout\ & \count.10~regout\ # !\Mux9~236_combout\ & (\count.11~regout\)) # !\opcode~dataout\(2) & \count.10~regout\ & (!\Mux9~236_combout\), GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "88e2",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.10~regout\,
	datab => \opcode~dataout\(2),
	datac => \count.11~regout\,
	datad => \Mux9~236_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \count.11~regout\);

\car~678\ : flex10ke_lcell
-- Equation(s):
-- \car~678_combout\ = \car~regout\ & (\count.10~regout\ & \B~dataout\(2) # !\count.10~regout\ & (!\count.11~regout\))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "808a",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~regout\,
	datab => \B~dataout\(2),
	datac => \count.10~regout\,
	datad => \count.11~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~678_combout\);

\B[3]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_B(3),
	dataout => \B~dataout\(3));

\A[3]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_A(3),
	dataout => \A~dataout\(3));

\Mux10~335\ : flex10ke_lcell
-- Equation(s):
-- \Mux10~335_combout\ = \count.11~regout\ & (\B~dataout\(3) & (\A~dataout\(3) # \car~regout\) # !\B~dataout\(3) & \A~dataout\(3) & \car~regout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "a880",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.11~regout\,
	datab => \B~dataout\(3),
	datac => \A~dataout\(3),
	datad => \car~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~335_combout\);

\car~679\ : flex10ke_lcell
-- Equation(s):
-- \car~679_combout\ = \car~677_combout\ # \car~678_combout\ # \Mux10~335_combout\ & !\count.10~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "eefe",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~677_combout\,
	datab => \car~678_combout\,
	datac => \Mux10~335_combout\,
	datad => \count.10~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~679_combout\);

\B[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_B(1),
	dataout => \B~dataout\(1));

\Add7~94\ : flex10ke_lcell
-- Equation(s):
-- \Add7~94_combout\ = \B~dataout\(2) $ (\B~dataout\(0) # \B~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "03fc",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \B~dataout\(0),
	datac => \B~dataout\(1),
	datad => \B~dataout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add7~94_combout\);

\car~682\ : flex10ke_lcell
-- Equation(s):
-- \car~682_combout\ = \A~dataout\(2) & \count.10~regout\ & (\car~regout\ # \Add7~94_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "8880",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \A~dataout\(2),
	datab => \count.10~regout\,
	datac => \car~regout\,
	datad => \Add7~94_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~682_combout\);

\car~683\ : flex10ke_lcell
-- Equation(s):
-- \car~683_combout\ = \count.10~regout\ & \Add7~94_combout\ # !\count.10~regout\ & (\A~dataout\(3) # !\count.11~regout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "aacf",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~94_combout\,
	datab => \A~dataout\(3),
	datac => \count.11~regout\,
	datad => \count.10~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~683_combout\);

\car~684\ : flex10ke_lcell
-- Equation(s):
-- \car~684_combout\ = \car~681_combout\ # \car~682_combout\ # \car~regout\ & \car~683_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "feee",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~681_combout\,
	datab => \car~682_combout\,
	datac => \car~regout\,
	datad => \car~683_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \car~684_combout\);

\Mux0~104\ : flex10ke_lcell
-- Equation(s):
-- \Mux0~104_combout\ = \count.01~regout\ & (\opcode~dataout\(1)) # !\count.01~regout\ & (\opcode~dataout\(1) & \car~679_combout\ # !\opcode~dataout\(1) & (\car~684_combout\))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "e5e0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.01~regout\,
	datab => \car~679_combout\,
	datac => \opcode~dataout\(1),
	datad => \car~684_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~104_combout\);

\A[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_A(1),
	dataout => \A~dataout\(1));

\Add1~76\ : flex10ke_lcell
-- Equation(s):
-- \Add1~76_combout\ = \car~regout\ & (\A~dataout\(1) # \B~dataout\(1)) # !\car~regout\ & \A~dataout\(1) & \B~dataout\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "fcc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \car~regout\,
	datac => \A~dataout\(1),
	datad => \B~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add1~76_combout\);

\Mux0~105\ : flex10ke_lcell
-- Equation(s):
-- \Mux0~105_combout\ = \count.01~regout\ & (\Mux0~104_combout\ & (\Add1~76_combout\) # !\Mux0~104_combout\ & \Add9~135_combout\) # !\count.01~regout\ & (\Mux0~104_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f838",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~135_combout\,
	datab => \count.01~regout\,
	datac => \Mux0~104_combout\,
	datad => \Add1~76_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~105_combout\);

\Mux0~106\ : flex10ke_lcell
-- Equation(s):
-- \Mux0~106_combout\ = \Mux0~103_combout\ # \count.00~regout\ & \Mux0~102_combout\ & \Mux0~105_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "eaaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~103_combout\,
	datab => \count.00~regout\,
	datac => \Mux0~102_combout\,
	datad => \Mux0~105_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~106_combout\);

car : flex10ke_lcell
-- Equation(s):
-- \car~regout\ = DFFEA(\Mux0~106_combout\, GLOBAL(\clk~dataout\), , , \Mux10~337_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~337_combout\,
	datad => \Mux0~106_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \car~regout\);

\Mux4~910\ : flex10ke_lcell
-- Equation(s):
-- \Mux4~910_combout\ = \opcode~dataout\(1) & !\opcode~dataout\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~910_combout\);

\Mux3~1072\ : flex10ke_lcell
-- Equation(s):
-- \Mux3~1080\ = \B~dataout\(1) & \A~dataout\(1) & !\opcode~dataout\(1) # !\B~dataout\(1) & !\A~dataout\(1) & \opcode~dataout\(1) # !\opcode~dataout\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "18ff",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(1),
	datab => \A~dataout\(1),
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~1072_combout\,
	cascout => \Mux3~1080\);

\Mux3~1074\ : flex10ke_lcell
-- Equation(s):
-- \Mux3~1074_combout\ = (\B~dataout\(1) $ \car~regout\ $ !\A~dataout\(1) # !\Mux4~910_combout\) & CASCADE(\Mux3~1080\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "69ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(1),
	datab => \car~regout\,
	datac => \A~dataout\(1),
	datad => \Mux4~910_combout\,
	cascin => \Mux3~1080\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~1074_combout\);

\C[1]~reg0\ : flex10ke_lcell
-- Equation(s):
-- \C[1]~reg0_regout\ = DFFEA(\Mux3~1066_combout\ # \count.01~regout\ & !\Mux3~1074_combout\ & !\opcode~dataout\(2), GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "aaae",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1066_combout\,
	datab => \count.01~regout\,
	datac => \Mux3~1074_combout\,
	datad => \opcode~dataout\(2),
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \C[1]~reg0_regout\);

\A[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_A(2),
	dataout => \A~dataout\(2));

\Mux2~874\ : flex10ke_lcell
-- Equation(s):
-- \Mux2~884\ = \B~dataout\(2) & \A~dataout\(2) & !\opcode~dataout\(1) # !\B~dataout\(2) & !\A~dataout\(2) & \opcode~dataout\(1) # !\opcode~dataout\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "18ff",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(2),
	datab => \A~dataout\(2),
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~874_combout\,
	cascout => \Mux2~884\);

\Mux2~879\ : flex10ke_lcell
-- Equation(s):
-- \Mux2~879_combout\ = (\B~dataout\(2) $ \car~regout\ $ !\A~dataout\(2) # !\Mux4~910_combout\) & CASCADE(\Mux2~884\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "69ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(2),
	datab => \car~regout\,
	datac => \A~dataout\(2),
	datad => \Mux4~910_combout\,
	cascin => \Mux2~884\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~879_combout\);

\Mux2~876\ : flex10ke_lcell
-- Equation(s):
-- \Mux2~876_combout\ = \opcode~dataout\(2) & \Mux9~236_combout\ & \count.10~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \opcode~dataout\(2),
	datac => \Mux9~236_combout\,
	datad => \count.10~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~876_combout\);

\Mux2~877\ : flex10ke_lcell
-- Equation(s):
-- \Mux2~888\ = \car~regout\ $ \A~dataout\(2) $ !\Add7~94_combout\ # !\Mux2~876_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "69ff",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~regout\,
	datab => \A~dataout\(2),
	datac => \Add7~94_combout\,
	datad => \Mux2~876_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~877_combout\,
	cascout => \Mux2~888\);

\Mux2~880\ : flex10ke_lcell
-- Equation(s):
-- \Mux2~880_combout\ = (\count.10~regout\ & (\Mux9~236_combout\ # !\opcode~dataout\(2)) # !\count.10~regout\ & \Mux9~236_combout\ & !\opcode~dataout\(2) # !\C[2]~reg0_regout\) & CASCADE(\Mux2~888\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "8eff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.10~regout\,
	datab => \Mux9~236_combout\,
	datac => \opcode~dataout\(2),
	datad => \C[2]~reg0_regout\,
	cascin => \Mux2~888\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~880_combout\);

\C[2]~reg0\ : flex10ke_lcell
-- Equation(s):
-- \C[2]~reg0_regout\ = DFFEA(\count.10~regout\ & !\Mux2~879_combout\ & !\opcode~dataout\(2) # !\Mux2~880_combout\, GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "02ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.10~regout\,
	datab => \Mux2~879_combout\,
	datac => \opcode~dataout\(2),
	datad => \Mux2~880_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \C[2]~reg0_regout\);

\Mux1~865\ : flex10ke_lcell
-- Equation(s):
-- \Mux1~875\ = \B~dataout\(3) & \A~dataout\(3) & !\opcode~dataout\(1) # !\B~dataout\(3) & !\A~dataout\(3) & \opcode~dataout\(1) # !\opcode~dataout\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "18ff",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(3),
	datab => \A~dataout\(3),
	datac => \opcode~dataout\(1),
	datad => \opcode~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~865_combout\,
	cascout => \Mux1~875\);

\Mux1~870\ : flex10ke_lcell
-- Equation(s):
-- \Mux1~870_combout\ = (\B~dataout\(3) $ \car~regout\ $ !\A~dataout\(3) # !\Mux4~910_combout\) & CASCADE(\Mux1~875\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "69ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(3),
	datab => \car~regout\,
	datac => \A~dataout\(3),
	datad => \Mux4~910_combout\,
	cascin => \Mux1~875\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~870_combout\);

\Add7~93\ : flex10ke_lcell
-- Equation(s):
-- \Add7~93_combout\ = \B~dataout\(3) $ (\B~dataout\(2) # \B~dataout\(0) # \B~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "01fe",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \B~dataout\(2),
	datab => \B~dataout\(0),
	datac => \B~dataout\(1),
	datad => \B~dataout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add7~93_combout\);

\Mux1~867\ : flex10ke_lcell
-- Equation(s):
-- \Mux1~867_combout\ = \opcode~dataout\(2) & \Mux9~236_combout\ & \count.11~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \opcode~dataout\(2),
	datac => \Mux9~236_combout\,
	datad => \count.11~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~867_combout\);

\Mux1~868\ : flex10ke_lcell
-- Equation(s):
-- \Mux1~879\ = \car~regout\ $ \A~dataout\(3) $ !\Add7~93_combout\ # !\Mux1~867_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "69ff",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \car~regout\,
	datab => \A~dataout\(3),
	datac => \Add7~93_combout\,
	datad => \Mux1~867_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~868_combout\,
	cascout => \Mux1~879\);

\Mux1~871\ : flex10ke_lcell
-- Equation(s):
-- \Mux1~871_combout\ = (\count.11~regout\ & (\Mux9~236_combout\ # !\opcode~dataout\(2)) # !\count.11~regout\ & \Mux9~236_combout\ & !\opcode~dataout\(2) # !\C[3]~reg0_regout\) & CASCADE(\Mux1~879\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "8eff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.11~regout\,
	datab => \Mux9~236_combout\,
	datac => \opcode~dataout\(2),
	datad => \C[3]~reg0_regout\,
	cascin => \Mux1~879\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~871_combout\);

\C[3]~reg0\ : flex10ke_lcell
-- Equation(s):
-- \C[3]~reg0_regout\ = DFFEA(\count.11~regout\ & !\Mux1~870_combout\ & !\opcode~dataout\(2) # !\Mux1~871_combout\, GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "02ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.11~regout\,
	datab => \Mux1~870_combout\,
	datac => \opcode~dataout\(2),
	datad => \Mux1~871_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \C[3]~reg0_regout\);

\Equal0~29\ : flex10ke_lcell
-- Equation(s):
-- \Equal0~29_combout\ = !\C[0]~reg0_regout\ & !\C[1]~reg0_regout\ & !\C[2]~reg0_regout\ & !\C[3]~reg0_regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~reg0_regout\,
	datab => \C[1]~reg0_regout\,
	datac => \C[2]~reg0_regout\,
	datad => \C[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~29_combout\);

\C[3]~254\ : flex10ke_lcell
-- Equation(s):
-- \C[3]~254_regout\ = DFFEA(\count.11~regout\ & !\Mux1~870_combout\ & !\opcode~dataout\(2) # !\Mux1~871_combout\, GLOBAL(\clk~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "02ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.11~regout\,
	datab => \Mux1~870_combout\,
	datac => \opcode~dataout\(2),
	datad => \Mux1~871_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \C[3]~254_regout\);

\Mux10~337\ : flex10ke_lcell
-- Equation(s):
-- \Mux10~337_combout\ = !\opcode~dataout\(0) & (!\opcode~dataout\(1) # !\opcode~dataout\(2))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0333",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \opcode~dataout\(0),
	datac => \opcode~dataout\(2),
	datad => \opcode~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~337_combout\);

\Mux9~238\ : flex10ke_lcell
-- Equation(s):
-- \Mux9~238_combout\ = \opcode~dataout\(2) & \Mux9~236_combout\ & \take~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \opcode~dataout\(2),
	datac => \Mux9~236_combout\,
	datad => \take~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux9~238_combout\);

\Mux9~237\ : flex10ke_lcell
-- Equation(s):
-- \Mux9~237_combout\ = \opcode~dataout\(2) & \Mux9~236_combout\ & (!\take~regout\ # !\count.00~regout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0888",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~dataout\(2),
	datab => \Mux9~236_combout\,
	datac => \count.00~regout\,
	datad => \take~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux9~237_combout\);

\take~497\ : flex10ke_lcell
-- Equation(s):
-- \take~497_combout\ = \A~dataout\(3) & \take~regout\ & !\B~dataout\(3) # !\A~dataout\(3) & !\take~regout\ & \B~dataout\(3)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "03c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \A~dataout\(3),
	datac => \take~regout\,
	datad => \B~dataout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~497_combout\);

\take~506\ : flex10ke_lcell
-- Equation(s):
-- \take~506_combout\ = \count.10~regout\ & \take~505_combout\ # !\count.10~regout\ & (\take~497_combout\ & \count.11~regout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "aac0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \take~505_combout\,
	datab => \take~497_combout\,
	datac => \count.11~regout\,
	datad => \count.10~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~506_combout\);

\take~507\ : flex10ke_lcell
-- Equation(s):
-- \take~507_combout\ = \take~504_combout\ # \take~506_combout\ & \count.00~regout\ & !\count.01~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "aaea",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \take~504_combout\,
	datab => \take~506_combout\,
	datac => \count.00~regout\,
	datad => \count.01~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \take~507_combout\);

take : flex10ke_lcell
-- Equation(s):
-- \take~regout\ = DFFEA(\take~507_combout\ & (\Mux9~237_combout\) # !\take~507_combout\ & \Mux9~238_combout\, GLOBAL(\clk~dataout\), , , \Mux9~236_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "f0cc",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~236_combout\,
	datab => \Mux9~238_combout\,
	datac => \Mux9~237_combout\,
	datad => \take~507_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \take~regout\);

\Mux10~334\ : flex10ke_lcell
-- Equation(s):
-- \Mux10~334_combout\ = \count.11~regout\ & !\opcode~dataout\(1) & (\take~regout\ $ \take~497_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0028",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \count.11~regout\,
	datab => \take~regout\,
	datac => \take~497_combout\,
	datad => \opcode~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~334_combout\);

\Mux10~336\ : flex10ke_lcell
-- Equation(s):
-- \Mux10~336_combout\ = \opcode~dataout\(1) & (\Mux10~335_combout\ # \CF~reg0_regout\ & !\count.11~regout\) # !\opcode~dataout\(1) & (\CF~reg0_regout\ & !\count.11~regout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "88f8",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~dataout\(1),
	datab => \Mux10~335_combout\,
	datac => \CF~reg0_regout\,
	datad => \count.11~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~336_combout\);

\CF~reg0\ : flex10ke_lcell
-- Equation(s):
-- \CF~reg0_regout\ = DFFEA(\Mux0~102_combout\ & (\Mux10~334_combout\ # \Mux10~336_combout\), GLOBAL(\clk~dataout\), , , \Mux10~337_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "fc00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~337_combout\,
	datab => \Mux10~334_combout\,
	datac => \Mux10~336_combout\,
	datad => \Mux0~102_combout\,
	clk => \clk~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CF~reg0_regout\);

\C[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \C[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_C(0));

\C[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \C[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_C(1));

\C[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \C[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_C(2));

\C[3]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \C[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_C(3));

\ZF~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Equal0~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_ZF);

\SF~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \C[3]~254_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_SF);

\CF~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \CF~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_CF);
END structure;


