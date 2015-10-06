#!quartus_sh -t
#
# mkproj-DE0
#
# 2013-07-10 Created for DE0 board

package require cmdline
set options {
	{ "project.arg" "" "project name" }
	{ "script.arg" "" "script file" }
}
set usage "\[options\] \[files...\]"
array set opt [::cmdline::getoptions ::argv $options $usage]

if {$opt(project) == ""} {
	return -code error "Usage: $argv0 $usage"
}

########

project_new $opt(project) -overwrite

set_global_assignment -name TOP_LEVEL_ENTITY $opt(project)
foreach arg $argv {
	set_global_assignment -name VERILOG_FILE $arg
}

if {$opt(script) != ""} {
	set_global_assignment -name PRE_FLOW_SCRIPT_FILE "quartus_sh:$opt(script)"
}

########
set_global_assignment -name TOP_LEVEL_ENTITY NS13

#set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
#set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"
#set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name FMAX_REQUIREMENT 100MHz

# From Cycron II errata sheet for M4K memory
#set_parameter -name CYCLONEII_SAFE_WRITE "\"RESTRUCTURE\""

create_base_clock -fmax 50MHz -duty_cycle 50 m_clock

#set_location_assignment PIN_AD15 -to m_clock
#set_location_assignment PIN_T29  -to p_reset

#set_location_assignment PIN_G3 -to BUTTON[1]
#set_location_assignment PIN_H2 -to BUTTON[0]
# set BUTTON[1] to m_clock
set_location_assignment PIN_G3 -to m_clock 
# set BUTTON[0] to p_reset
set_location_assignment PIN_H2 -to p_reset 

set_location_assignment PIN_B1 -to LEDG[9]
set_location_assignment PIN_B2 -to LEDG[8]
set_location_assignment PIN_C2 -to LEDG[7]
set_location_assignment PIN_C1 -to LEDG[6]
set_location_assignment PIN_E1 -to LEDG[5]
set_location_assignment PIN_F2 -to f[4]
set_location_assignment PIN_H1 -to f[3]
set_location_assignment PIN_J3 -to f[2]
set_location_assignment PIN_J2 -to f[1]
set_location_assignment PIN_J1 -to f[0]
set_location_assignment PIN_D2 -to do
set_location_assignment PIN_E4 -to SW[8]
set_location_assignment PIN_E3 -to b[3]
set_location_assignment PIN_H7 -to b[2]
set_location_assignment PIN_J7 -to b[1]
set_location_assignment PIN_G5 -to b[0]
set_location_assignment PIN_G4 -to a[3]
set_location_assignment PIN_H6 -to a[2]
set_location_assignment PIN_H5 -to a[1]
set_location_assignment PIN_J6 -to a[0]
set_location_assignment PIN_F1 -to BUTTON[2]
#set_location_assignment PIN_G3 -to BUTTON[1]
#set_location_assignment PIN_H2 -to BUTTON[0]


#============================================================
# Build by Terasic System Builder V1.0.0
#============================================================
set_global_assignment -name FAMILY "Cyclone III"
set_global_assignment -name DEVICE EP3C16F484C6
set_global_assignment -name USE_GENERATED_PHYSICAL_CONSTRAINTS OFF -section_id eda_palace
set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
set_global_assignment -name PARTITION_COLOR 14622752 -section_id Top
set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"

######## Pin assignemnt

# Pin & Location Assignments
# ==========================
set_location_assignment PIN_R2 -to FL_ADDR[21]
set_location_assignment PIN_P3 -to FL_ADDR[20]
set_location_assignment PIN_P1 -to FL_ADDR[19]
set_location_assignment PIN_M6 -to FL_ADDR[18]
set_location_assignment PIN_M5 -to FL_ADDR[17]
set_location_assignment PIN_AA2 -to FL_ADDR[16]
set_location_assignment PIN_L6 -to FL_ADDR[15]
set_location_assignment PIN_L7 -to FL_ADDR[14]
set_location_assignment PIN_M1 -to FL_ADDR[13]
set_location_assignment PIN_M2 -to FL_ADDR[12]
set_location_assignment PIN_M3 -to FL_ADDR[11]
set_location_assignment PIN_N1 -to FL_ADDR[10]
set_location_assignment PIN_N2 -to FL_ADDR[9]
set_location_assignment PIN_P2 -to FL_ADDR[8]
set_location_assignment PIN_M4 -to FL_ADDR[7]
set_location_assignment PIN_M8 -to FL_ADDR[6]
set_location_assignment PIN_N6 -to FL_ADDR[5]
set_location_assignment PIN_N5 -to FL_ADDR[4]
set_location_assignment PIN_N7 -to FL_ADDR[3]
set_location_assignment PIN_P6 -to FL_ADDR[2]
set_location_assignment PIN_P5 -to FL_ADDR[1]
set_location_assignment PIN_P7 -to FL_ADDR[0]
set_location_assignment PIN_AA1 -to FL_BYTE_N
set_location_assignment PIN_N8 -to FL_CE_N
set_location_assignment PIN_R7 -to FL_DQ[0]
set_location_assignment PIN_P8 -to FL_DQ[1]
set_location_assignment PIN_R8 -to FL_DQ[2]
set_location_assignment PIN_U1 -to FL_DQ[3]
set_location_assignment PIN_V2 -to FL_DQ[4]
set_location_assignment PIN_V3 -to FL_DQ[5]
set_location_assignment PIN_W1 -to FL_DQ[6]
set_location_assignment PIN_Y1 -to FL_DQ[7]
set_location_assignment PIN_T5 -to FL_DQ[8]
set_location_assignment PIN_T7 -to FL_DQ[9]
set_location_assignment PIN_T4 -to FL_DQ[10]
set_location_assignment PIN_U2 -to FL_DQ[11]
set_location_assignment PIN_V1 -to FL_DQ[12]
set_location_assignment PIN_V4 -to FL_DQ[13]
set_location_assignment PIN_W2 -to FL_DQ[14]
set_location_assignment PIN_R6 -to FL_OE_N
set_location_assignment PIN_R1 -to FL_RST_N
set_location_assignment PIN_M7 -to FL_RY
set_location_assignment PIN_P4 -to FL_WE_N
set_location_assignment PIN_T3 -to FL_WP_N
set_location_assignment PIN_Y2 -to FL_DQ15_AM1
set_location_assignment PIN_U7 -to GPIO0_D[31]
set_location_assignment PIN_V5 -to GPIO0_D[30]
set_location_assignment PIN_W6 -to GPIO0_D[29]
set_location_assignment PIN_W7 -to GPIO0_D[28]
set_location_assignment PIN_V8 -to GPIO0_D[27]
set_location_assignment PIN_T8 -to GPIO0_D[26]
set_location_assignment PIN_W10 -to GPIO0_D[25]
set_location_assignment PIN_Y10 -to GPIO0_D[24]
set_location_assignment PIN_V11 -to GPIO0_D[23]
set_location_assignment PIN_R10 -to GPIO0_D[22]
set_location_assignment PIN_V12 -to GPIO0_D[21]
set_location_assignment PIN_U13 -to GPIO0_D[20]
set_location_assignment PIN_W13 -to GPIO0_D[19]
set_location_assignment PIN_Y13 -to GPIO0_D[18]
set_location_assignment PIN_U14 -to GPIO0_D[17]
set_location_assignment PIN_V14 -to GPIO0_D[16]
set_location_assignment PIN_AA4 -to GPIO0_D[15]
set_location_assignment PIN_AB4 -to GPIO0_D[14]
set_location_assignment PIN_AA5 -to GPIO0_D[13]
set_location_assignment PIN_AB5 -to GPIO0_D[12]
set_location_assignment PIN_AA8 -to GPIO0_D[11]
set_location_assignment PIN_AB8 -to GPIO0_D[10]
set_location_assignment PIN_AA10 -to GPIO0_D[9]
set_location_assignment PIN_AB10 -to GPIO0_D[8]
set_location_assignment PIN_AA13 -to GPIO0_D[7]
set_location_assignment PIN_AB13 -to GPIO0_D[6]
set_location_assignment PIN_AB14 -to GPIO0_D[5]
set_location_assignment PIN_AA14 -to GPIO0_D[4]
set_location_assignment PIN_AB15 -to GPIO0_D[3]
set_location_assignment PIN_AA15 -to GPIO0_D[2]
set_location_assignment PIN_AA16 -to GPIO0_D[1]
set_location_assignment PIN_AB16 -to GPIO0_D[0]
set_location_assignment PIN_AB12 -to GPIO0_CLKIN[0]
set_location_assignment PIN_AA12 -to GPIO0_CLKIN[1]
set_location_assignment PIN_AB3 -to GPIO0_CLKOUT[0]
set_location_assignment PIN_AA3 -to GPIO0_CLKOUT[1]
set_location_assignment PIN_AA11 -to GPIO1_CLKIN[1]
set_location_assignment PIN_AB11 -to GPIO1_CLKIN[0]
set_location_assignment PIN_T16 -to GPIO1_CLKOUT[1]
set_location_assignment PIN_R16 -to GPIO1_CLKOUT[0]
set_location_assignment PIN_V7 -to GPIO1_D[31]
set_location_assignment PIN_V6 -to GPIO1_D[30]
set_location_assignment PIN_U8 -to GPIO1_D[29]
set_location_assignment PIN_Y7 -to GPIO1_D[28]
set_location_assignment PIN_T9 -to GPIO1_D[27]
set_location_assignment PIN_U9 -to GPIO1_D[26]
set_location_assignment PIN_T10 -to GPIO1_D[25]
set_location_assignment PIN_U10 -to GPIO1_D[24]
set_location_assignment PIN_R12 -to GPIO1_D[23]
set_location_assignment PIN_R11 -to GPIO1_D[22]
set_location_assignment PIN_T12 -to GPIO1_D[21]
set_location_assignment PIN_U12 -to GPIO1_D[20]
set_location_assignment PIN_R14 -to GPIO1_D[19]
set_location_assignment PIN_T14 -to GPIO1_D[18]
set_location_assignment PIN_AB7 -to GPIO1_D[17]
set_location_assignment PIN_AA7 -to GPIO1_D[16]
set_location_assignment PIN_AA9 -to GPIO1_D[15]
set_location_assignment PIN_AB9 -to GPIO1_D[14]
set_location_assignment PIN_V15 -to GPIO1_D[13]
set_location_assignment PIN_W15 -to GPIO1_D[12]
set_location_assignment PIN_T15 -to GPIO1_D[11]
set_location_assignment PIN_U15 -to GPIO1_D[10]
set_location_assignment PIN_W17 -to GPIO1_D[9]
set_location_assignment PIN_Y17 -to GPIO1_D[8]
set_location_assignment PIN_AB17 -to GPIO1_D[7]
set_location_assignment PIN_AA17 -to GPIO1_D[6]
set_location_assignment PIN_AA18 -to GPIO1_D[5]
set_location_assignment PIN_AB18 -to GPIO1_D[4]
set_location_assignment PIN_AB19 -to GPIO1_D[3]
set_location_assignment PIN_AA19 -to GPIO1_D[2]
set_location_assignment PIN_AB20 -to GPIO1_D[1]
set_location_assignment PIN_AA20 -to GPIO1_D[0]
set_location_assignment PIN_P22 -to PS2_KBCLK
set_location_assignment PIN_P21 -to PS2_KBDAT
set_location_assignment PIN_R21 -to PS2_MSCLK
set_location_assignment PIN_R22 -to PS2_MSDAT
set_location_assignment PIN_U22 -to UART_RXD
set_location_assignment PIN_U21 -to UART_TXD
set_location_assignment PIN_V22 -to UART_RTS
set_location_assignment PIN_V21 -to UART_CTS
set_location_assignment PIN_Y21 -to SD_CLK
set_location_assignment PIN_Y22 -to SD_CMD
set_location_assignment PIN_AA22 -to SD_DAT0
set_location_assignment PIN_W21 -to SD_DAT3
set_location_assignment PIN_W20 -to SD_WP_N
set_location_assignment PIN_C20 -to LCD_DATA[7]
set_location_assignment PIN_D20 -to LCD_DATA[6]
set_location_assignment PIN_B21 -to LCD_DATA[5]
set_location_assignment PIN_B22 -to LCD_DATA[4]
set_location_assignment PIN_C21 -to LCD_DATA[3]
set_location_assignment PIN_C22 -to LCD_DATA[2]
set_location_assignment PIN_D21 -to LCD_DATA[1]
set_location_assignment PIN_D22 -to LCD_DATA[0]
set_location_assignment PIN_E22 -to LCD_RW
set_location_assignment PIN_F22 -to LCD_RS
set_location_assignment PIN_E21 -to LCD_EN
set_location_assignment PIN_F21 -to LCD_BLON
set_location_assignment PIN_J21 -to VGA_G[3]
set_location_assignment PIN_K17 -to VGA_G[2]
set_location_assignment PIN_J17 -to VGA_G[1]
set_location_assignment PIN_H22 -to VGA_G[0]
set_location_assignment PIN_L21 -to VGA_HS
set_location_assignment PIN_L22 -to VGA_VS
set_location_assignment PIN_H21 -to VGA_R[3]
set_location_assignment PIN_H20 -to VGA_R[2]
set_location_assignment PIN_H17 -to VGA_R[1]
set_location_assignment PIN_H19 -to VGA_R[0]
set_location_assignment PIN_K18 -to VGA_B[3]
set_location_assignment PIN_J22 -to VGA_B[2]
set_location_assignment PIN_K21 -to VGA_B[1]
set_location_assignment PIN_K22 -to VGA_B[0]
#set_location_assignment PIN_G21 -to CLOCK_50
set_location_assignment PIN_E11 -to HEX0_D[0]
set_location_assignment PIN_F11 -to HEX0_D[1]
set_location_assignment PIN_H12 -to HEX0_D[2]
set_location_assignment PIN_H13 -to HEX0_D[3]
set_location_assignment PIN_G12 -to HEX0_D[4]
set_location_assignment PIN_F12 -to HEX0_D[5]
set_location_assignment PIN_F13 -to HEX0_D[6]
set_location_assignment PIN_D13 -to HEX0_DP
set_location_assignment PIN_A15 -to HEX1_D[6]
set_location_assignment PIN_E14 -to HEX1_D[5]
set_location_assignment PIN_B14 -to HEX1_D[4]
set_location_assignment PIN_A14 -to HEX1_D[3]
set_location_assignment PIN_C13 -to HEX1_D[2]
set_location_assignment PIN_B13 -to HEX1_D[1]
set_location_assignment PIN_A13 -to HEX1_D[0]
set_location_assignment PIN_B15 -to HEX1_DP
set_location_assignment PIN_F14 -to HEX2_D[6]
set_location_assignment PIN_B17 -to HEX2_D[5]
set_location_assignment PIN_A17 -to HEX2_D[4]
set_location_assignment PIN_E15 -to HEX2_D[3]
set_location_assignment PIN_B16 -to HEX2_D[2]
set_location_assignment PIN_A16 -to HEX2_D[1]
set_location_assignment PIN_D15 -to HEX2_D[0]
set_location_assignment PIN_A18 -to HEX2_DP
set_location_assignment PIN_G15 -to HEX3_D[6]
set_location_assignment PIN_D19 -to HEX3_D[5]
set_location_assignment PIN_C19 -to HEX3_D[4]
set_location_assignment PIN_B19 -to HEX3_D[3]
set_location_assignment PIN_A19 -to HEX3_D[2]
set_location_assignment PIN_F15 -to HEX3_D[1]
set_location_assignment PIN_B18 -to HEX3_D[0]
set_location_assignment PIN_G16 -to HEX3_DP
set_location_assignment PIN_G8 -to DRAM_CAS_N
set_location_assignment PIN_G7 -to DRAM_CS_N
set_location_assignment PIN_E5 -to DRAM_CLK
set_location_assignment PIN_E6 -to DRAM_CKE
set_location_assignment PIN_B5 -to DRAM_BA_0
set_location_assignment PIN_A4 -to DRAM_BA_1
set_location_assignment PIN_F10 -to DRAM_DQ[15]
set_location_assignment PIN_E10 -to DRAM_DQ[14]
set_location_assignment PIN_A10 -to DRAM_DQ[13]
set_location_assignment PIN_B10 -to DRAM_DQ[12]
set_location_assignment PIN_C10 -to DRAM_DQ[11]
set_location_assignment PIN_A9 -to DRAM_DQ[10]
set_location_assignment PIN_B9 -to DRAM_DQ[9]
set_location_assignment PIN_A8 -to DRAM_DQ[8]
set_location_assignment PIN_F8 -to DRAM_DQ[7]
set_location_assignment PIN_H9 -to DRAM_DQ[6]
set_location_assignment PIN_G9 -to DRAM_DQ[5]
set_location_assignment PIN_F9 -to DRAM_DQ[4]
set_location_assignment PIN_E9 -to DRAM_DQ[3]
set_location_assignment PIN_H10 -to DRAM_DQ[2]
set_location_assignment PIN_G10 -to DRAM_DQ[1]
set_location_assignment PIN_D10 -to DRAM_DQ[0]
set_location_assignment PIN_E7 -to DRAM_LDQM
set_location_assignment PIN_B8 -to DRAM_UDQM
set_location_assignment PIN_F7 -to DRAM_RAS_N
set_location_assignment PIN_D6 -to DRAM_WE_N
set_location_assignment PIN_B12 -to CLOCK_50_2
set_location_assignment PIN_C8 -to DRAM_ADDR[12]
set_location_assignment PIN_A7 -to DRAM_ADDR[11]
set_location_assignment PIN_B4 -to DRAM_ADDR[10]
set_location_assignment PIN_B7 -to DRAM_ADDR[9]
set_location_assignment PIN_C7 -to DRAM_ADDR[8]
set_location_assignment PIN_A6 -to DRAM_ADDR[7]
set_location_assignment PIN_B6 -to DRAM_ADDR[6]
set_location_assignment PIN_C6 -to DRAM_ADDR[5]
set_location_assignment PIN_A5 -to DRAM_ADDR[4]
set_location_assignment PIN_C3 -to DRAM_ADDR[3]
set_location_assignment PIN_B3 -to DRAM_ADDR[2]
set_location_assignment PIN_A3 -to DRAM_ADDR[1]
set_location_assignment PIN_C4 -to DRAM_ADDR[0]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_CE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_BYTE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_ADDR[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_UDQM
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_LDQM
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKOUT[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKOUT[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKIN[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_CLKIN[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_D[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_CLKOUT[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_CLKOUT[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_CLKIN[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO0_CLKIN[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_WP_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_WE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_RY
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_RST_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_OE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ15_AM1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FL_DQ[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO1_D[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_BLON
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_DP
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_DP
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_DP
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_DP
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_CTS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_WP_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_DAT3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_DAT0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_CMD
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_MSDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_MSCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_KBDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_KBCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_RW
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_RS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_EN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LCD_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_VS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_HS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_TXD
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_RXD
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to UART_RTS

set_global_assignment -name ENABLE_ADVANCED_IO_TIMING ON
set_global_assignment -name FORCE_CONFIGURATION_VCCIO ON
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

project_close