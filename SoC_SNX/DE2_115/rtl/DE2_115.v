/*
 Produced by NSL Core(version=20130407), IP ARCH, Inc. Mon Aug 11 15:53:55 2014
 Licensed to :500 line EVALUATION USER
*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module DE2_115 ( p_reset , m_clock , KEY , SW , HEX0 , HEX1 , HEX2 , HEX3 , HEX4 , HEX5 , HEX6 , HEX7 , LEDG , LEDR , LCD_DATA , LCD_ON , LCD_BLON , LCD_RW , LCD_EN , LCD_RS , PS2_CLK , PS2_DAT , PS2_CLK2 , PS2_DAT2 , VGA_R , VGA_G , VGA_B , VGA_HS , VGA_VS , VGA_SYNC , VGA_BLANK , VGA_CLK );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [3:0] KEY;
  wire [3:0] KEY;
  input [17:0] SW;
  wire [17:0] SW;
  output [6:0] HEX0;
  wire [6:0] HEX0;
  output [6:0] HEX1;
  wire [6:0] HEX1;
  output [6:0] HEX2;
  wire [6:0] HEX2;
  output [6:0] HEX3;
  wire [6:0] HEX3;
  output [6:0] HEX4;
  wire [6:0] HEX4;
  output [6:0] HEX5;
  wire [6:0] HEX5;
  output [6:0] HEX6;
  wire [6:0] HEX6;
  output [6:0] HEX7;
  wire [6:0] HEX7;
  output [8:0] LEDG;
  wire [8:0] LEDG;
  output [17:0] LEDR;
  wire [17:0] LEDR;
inout [7:0] LCD_DATA;
wire [7:0] LCD_DATA;
  output LCD_ON;
  wire LCD_ON;
  output LCD_BLON;
  wire LCD_BLON;
  output LCD_RW;
  wire LCD_RW;
  output LCD_EN;
  wire LCD_EN;
  output LCD_RS;
  wire LCD_RS;
inout PS2_CLK;
wire PS2_CLK;
inout PS2_DAT;
wire PS2_DAT;
inout PS2_CLK2;
wire PS2_CLK2;
inout PS2_DAT2;
wire PS2_DAT2;
  output [9:0] VGA_R;
  wire [9:0] VGA_R;
  output [9:0] VGA_G;
  wire [9:0] VGA_G;
  output [9:0] VGA_B;
  wire [9:0] VGA_B;
  output VGA_HS;
  wire VGA_HS;
  output VGA_VS;
  wire VGA_VS;
  output VGA_SYNC;
  wire VGA_SYNC;
  output VGA_BLANK;
  wire VGA_BLANK;
  output VGA_CLK;
  wire VGA_CLK;
  reg [15:0] adrs_reg;
  wire read_imem;
  wire read_dmem;
  wire read_hex;
  wire read_key;
  wire read_lcd;
  wire read_led;
  wire read_sw;
  wire read_vga;
  wire read_ps2in;
  wire read_timer;
  wire debug0;
  wire debug1;
  wire _imem_i_clock;
  wire [11:0] _imem_i_address;
  wire [15:0] _imem_i_data;
  wire _imem_i_wren;
  wire [15:0] _imem_i_q;
  wire _dmem_i_clock;
  wire [11:0] _dmem_i_address;
  wire [15:0] _dmem_i_data;
  wire _dmem_i_wren;
  wire [15:0] _dmem_i_q;
  wire [2:0] _hex_i_adrs;
  wire [15:0] _hex_i_datai;
  wire [15:0] _hex_i_datao;
  wire [7:0] _hex_i_HEX0;
  wire [7:0] _hex_i_HEX1;
  wire [7:0] _hex_i_HEX2;
  wire [7:0] _hex_i_HEX3;
  wire [7:0] _hex_i_HEX4;
  wire [7:0] _hex_i_HEX5;
  wire [7:0] _hex_i_HEX6;
  wire [7:0] _hex_i_HEX7;
  wire _hex_i_write;
  wire _hex_i_read;
  wire _hex_i_p_reset;
  wire _hex_i_m_clock;
  wire [15:0] _key_i_datai;
  wire [15:0] _key_i_datao;
  wire [3:0] _key_i_KEY;
  wire _key_i_read;
  wire _key_i_p_reset;
  wire _key_i_m_clock;
  wire _lcd_i_cpu_clk;
  wire _lcd_i_sys_clk;
  wire _lcd_i_rst;
  wire [4:0] _lcd_i_adrs;
  wire [15:0] _lcd_i_from_cpu;
  wire [15:0] _lcd_i_to_cpu;
  wire _lcd_i_we;
  wire _lcd_i_cs;
  wire [7:0] _lcd_i_LCD_DATA;
  wire _lcd_i_LCD_RW;
  wire _lcd_i_LCD_EN;
  wire _lcd_i_LCD_RS;
  wire _led_i_adrs;
  wire [15:0] _led_i_datai;
  wire [15:0] _led_i_datao;
  wire [15:0] _led_i_LEDR;
  wire [8:0] _led_i_LEDG;
  wire _led_i_write;
  wire _led_i_read;
  wire _led_i_p_reset;
  wire _led_i_m_clock;
  wire [15:0] _snx_i_datai;
  wire [15:0] _snx_i_datao;
  wire [15:0] _snx_i_adrs;
  wire _snx_i_intr;
  wire _snx_i_memory_read;
  wire _snx_i_memory_write;
  wire _snx_i_p_reset;
  wire _snx_i_m_clock;
  wire [15:0] _sw_i_datai;
  wire [15:0] _sw_i_datao;
  wire [15:0] _sw_i_SW;
  wire _sw_i_read;
  wire _sw_i_p_reset;
  wire _sw_i_m_clock;
  wire [3:0] _vga_i_R;
  wire [3:0] _vga_i_G;
  wire [3:0] _vga_i_B;
  wire _vga_i_HS;
  wire _vga_i_VS;
  wire _vga_i_CLOCK;
  wire _vga_i_BLANK;
  wire _vga_i_SYNC;
  wire [11:0] _vga_i_adrs;
  wire [15:0] _vga_i_w_data;
  wire [15:0] _vga_i_r_data;
  wire _vga_i_write;
  wire _vga_i_read;
  wire _vga_i_p_reset;
  wire _vga_i_m_clock;
  wire _ps2in_i_rxd;
  wire _ps2in_i_rxc;
  wire [7:0] _ps2in_i_data;
  wire _ps2in_i_port_read;
  wire _ps2in_i_rxready;
  wire _ps2in_i_p_reset;
  wire _ps2in_i_m_clock;
  wire [1:0] _timer_i_adrs;
  wire [15:0] _timer_i_datai;
  wire [15:0] _timer_i_datao;
  wire [31:0] _timer_i_debug;
  wire _timer_i_read;
  wire _timer_i_write;
  wire _timer_i_intr;
  wire _timer_i_p_reset;
  wire _timer_i_m_clock;
  wire [15:0] _net_0;
  wire _net_1;
  wire [15:0] _net_2;
  wire _net_3;
  wire [15:0] _net_4;
  wire _net_5;
  wire [15:0] _net_6;
  wire _net_7;
  wire [15:0] _net_8;
  wire _net_9;
  wire [15:0] _net_10;
  wire _net_11;
  wire [15:0] _net_12;
  wire _net_13;
  wire [15:0] _net_14;
  wire _net_15;
  wire [15:0] _net_16;
  wire _net_17;
  wire [15:0] _net_18;
  wire _net_19;
  reg _reg_20;
  reg _reg_21;
  reg _reg_22;
  reg _reg_23;
  reg _reg_24;
  reg _reg_25;
  reg _reg_26;
  reg _reg_27;
  reg _reg_28;
  reg _reg_29;
  reg _reg_30;
  reg _reg_31;
  reg _reg_32;
  reg _reg_33;
  reg _reg_34;
  reg _reg_35;
  wire [15:0] _net_36;
  wire _net_37;
  reg _reg_38;
  reg _reg_39;
  reg _reg_40;
  reg _reg_41;
  wire [15:0] _net_42;
  wire [15:0] _net_43;
  wire _net_44;
  wire [15:0] _net_45;
  wire _net_46;
  wire [15:0] _net_47;
  wire _net_48;
  wire [15:0] _net_49;
  wire _net_50;
  wire [15:0] _net_51;
  wire _net_52;
  wire [15:0] _net_53;
  wire _net_54;
timer timer_i (.p_reset(_timer_i_p_reset), .m_clock(_timer_i_m_clock), .intr(_timer_i_intr), .write(_timer_i_write), .read(_timer_i_read), .debug(_timer_i_debug), .datao(_timer_i_datao), .datai(_timer_i_datai), .adrs(_timer_i_adrs));
ps2_in ps2in_i (.p_reset(_ps2in_i_p_reset), .m_clock(_ps2in_i_m_clock), .rxready(_ps2in_i_rxready), .port_read(_ps2in_i_port_read), .data(_ps2in_i_data), .rxc(_ps2in_i_rxc), .rxd(_ps2in_i_rxd));
VGA_ctrl vga_i (.p_reset(_vga_i_p_reset), .m_clock(_vga_i_m_clock), .read(_vga_i_read), .write(_vga_i_write), .r_data(_vga_i_r_data), .adrs(_vga_i_adrs), .w_data(_vga_i_w_data), .CLOCK(_vga_i_CLOCK), .BLANK(_vga_i_BLANK), .SYNC(_vga_i_SYNC), .R(_vga_i_R), .G(_vga_i_G), .B(_vga_i_B), .HS(_vga_i_HS), .VS(_vga_i_VS));
sw sw_i (.p_reset(_sw_i_p_reset), .m_clock(_sw_i_m_clock), .read(_sw_i_read), .SW(_sw_i_SW), .datao(_sw_i_datao), .datai(_sw_i_datai));
snx_system snx_i (.p_reset(_snx_i_p_reset), .m_clock(_snx_i_m_clock), .memory_write(_snx_i_memory_write), .memory_read(_snx_i_memory_read), .intr(_snx_i_intr), .adrs(_snx_i_adrs), .datao(_snx_i_datao), .datai(_snx_i_datai));
LED led_i (.p_reset(_led_i_p_reset), .m_clock(_led_i_m_clock), .read(_led_i_read), .write(_led_i_write), .LEDG(_led_i_LEDG), .LEDR(_led_i_LEDR), .datao(_led_i_datao), .datai(_led_i_datai), .adrs(_led_i_adrs));
LCD_controller lcd_i (.LCD_RS(_lcd_i_LCD_RS), .LCD_EN(_lcd_i_LCD_EN), .LCD_RW(_lcd_i_LCD_RW), .LCD_DATA(_lcd_i_LCD_DATA), .cs(_lcd_i_cs), .we(_lcd_i_we), .to_cpu(_lcd_i_to_cpu), .from_cpu(_lcd_i_from_cpu), .adrs(_lcd_i_adrs), .rst(_lcd_i_rst), .sys_clk(_lcd_i_sys_clk), .cpu_clk(_lcd_i_cpu_clk));
key key_i (.p_reset(_key_i_p_reset), .m_clock(_key_i_m_clock), .read(_key_i_read), .KEY(_key_i_KEY), .datao(_key_i_datao), .datai(_key_i_datai));
HEX hex_i (.p_reset(_hex_i_p_reset), .m_clock(_hex_i_m_clock), .read(_hex_i_read), .write(_hex_i_write), .HEX7(_hex_i_HEX7), .HEX6(_hex_i_HEX6), .HEX5(_hex_i_HEX5), .HEX4(_hex_i_HEX4), .HEX3(_hex_i_HEX3), .HEX2(_hex_i_HEX2), .HEX1(_hex_i_HEX1), .HEX0(_hex_i_HEX0), .datao(_hex_i_datao), .datai(_hex_i_datai), .adrs(_hex_i_adrs));
dmem dmem_i (.q(_dmem_i_q), .wren(_dmem_i_wren), .data(_dmem_i_data), .address(_dmem_i_address), .clock(_dmem_i_clock));
imem imem_i (.q(_imem_i_q), .wren(_imem_i_wren), .data(_imem_i_data), .address(_imem_i_address), .clock(_imem_i_clock));


// synthesis translate_off
// synopsys translate_off
always @(posedge read_imem)
  begin
#1 if (read_imem===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_imem) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_19))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_19) || 1'b1) line 173 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_imem = (_snx_i_memory_read&_net_19);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_dmem)
  begin
#1 if (read_dmem===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_dmem) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_17))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_17) || 1'b1) line 174 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_dmem = (_snx_i_memory_read&_net_17);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_hex)
  begin
#1 if (read_hex===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_hex) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_15))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_15) || 1'b1) line 175 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_hex = (_snx_i_memory_read&_net_15);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_key)
  begin
#1 if (read_key===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_key) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_13))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_13) || 1'b1) line 176 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_key = (_snx_i_memory_read&_net_13);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_lcd)
  begin
#1 if (read_lcd===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_lcd) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_11))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_11) || 1'b1) line 177 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_lcd = (_snx_i_memory_read&_net_11);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_led)
  begin
#1 if (read_led===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_led) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_9))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_9) || 1'b1) line 178 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_led = (_snx_i_memory_read&_net_9);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_sw)
  begin
#1 if (read_sw===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_sw) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_7))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_7) || 1'b1) line 179 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_sw = (_snx_i_memory_read&_net_7);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_vga)
  begin
#1 if (read_vga===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_vga) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_1))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_1) || 1'b1) line 182 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_vga = (_snx_i_memory_read&_net_1);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_ps2in)
  begin
#1 if (read_ps2in===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_ps2in) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_5))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_5) || 1'b1) line 180 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_ps2in = (_snx_i_memory_read&_net_5);

// synthesis translate_off
// synopsys translate_off
always @(posedge read_timer)
  begin
#1 if (read_timer===1'bx)
 begin
$display("Warning: control hazard(DE2_115:read_timer) at %d",$time);
 end
#1 if ((((_snx_i_memory_read&_net_3))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_read&_net_3) || 1'b1) line 181 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  read_timer = (_snx_i_memory_read&_net_3);
   assign  debug0 = 1'b0;
   assign  debug1 = 1'b0;
   assign  _imem_i_clock = m_clock;
   assign  _imem_i_address = 
// synthesis translate_off
// synopsys translate_off
((read_imem|_reg_21))? 
// synthesis translate_on
// synopsys translate_on
(((read_imem|_reg_21))?(_snx_i_adrs[11:0]):12'b0)
// synthesis translate_off
// synopsys translate_off
:12'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _imem_i_wren = 1'b0;
   assign  _dmem_i_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_snx_i_memory_write&_net_54)&(read_dmem|_reg_23)))
 begin $display("Warning: assign collision(DE2_115:_dmem_i_address) at %d",$time);
if ((_snx_i_memory_write&_net_54)) $display("assert ((_snx_i_memory_write&_net_54)) line 233 at %d\n",$time);
if ((read_dmem|_reg_23)) $display("assert ((read_dmem|_reg_23)) line 191 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _dmem_i_address = 
// synthesis translate_off
// synopsys translate_off
(((_snx_i_memory_write&_net_54)&(read_dmem|_reg_23)))? 12'bx :(((_snx_i_memory_write&_net_54)|(read_dmem|_reg_23)))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_54))?(_snx_i_adrs[11:0]):12'b0)|
    (((read_dmem|_reg_23))?(_snx_i_adrs[11:0]):12'b0)
// synthesis translate_off
// synopsys translate_off
:12'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _dmem_i_data = 
// synthesis translate_off
// synopsys translate_off
((_snx_i_memory_write&_net_54))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_54))?_snx_i_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _dmem_i_wren)
  begin
#1 if (_dmem_i_wren===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_dmem_i_wren) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_54))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_54) || 1'b1) line 233 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _dmem_i_wren = (_snx_i_memory_write&_net_54);

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_snx_i_memory_write&_net_52)&_reg_24))
 begin $display("Warning: assign collision(DE2_115:_hex_i_adrs) at %d",$time);
if ((_snx_i_memory_write&_net_52)) $display("assert ((_snx_i_memory_write&_net_52)) line 235 at %d\n",$time);
if (_reg_24) $display("assert (_reg_24) line 196 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _hex_i_adrs = 
// synthesis translate_off
// synopsys translate_off
(((_snx_i_memory_write&_net_52)&_reg_24))? 3'bx :(((_snx_i_memory_write&_net_52)|_reg_24))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_52))?(_snx_i_adrs[2:0]):3'b0)|
    ((_reg_24)?(adrs_reg[2:0]):3'b0)
// synthesis translate_off
// synopsys translate_off
:3'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _hex_i_datai = 
// synthesis translate_off
// synopsys translate_off
((_snx_i_memory_write&_net_52))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_52))?_snx_i_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _hex_i_write)
  begin
#1 if (_hex_i_write===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_hex_i_write) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_52))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_52) || 1'b1) line 235 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _hex_i_write = (_snx_i_memory_write&_net_52);

// synthesis translate_off
// synopsys translate_off
always @(posedge _hex_i_read)
  begin
#1 if (_hex_i_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_hex_i_read) at %d",$time);
 end
#1 if (((_reg_24)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_24 || 1'b1) line 196 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _hex_i_read = _reg_24;
   assign  _hex_i_p_reset = p_reset;
   assign  _hex_i_m_clock = m_clock;
   assign  _key_i_KEY = KEY;

// synthesis translate_off
// synopsys translate_off
always @(posedge _key_i_read)
  begin
#1 if (_key_i_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_key_i_read) at %d",$time);
 end
#1 if (((_reg_26)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_26 || 1'b1) line 200 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _key_i_read = _reg_26;
   assign  _key_i_p_reset = p_reset;
   assign  _key_i_m_clock = m_clock;
   assign  _lcd_i_cpu_clk = m_clock;
   assign  _lcd_i_sys_clk = m_clock;
   assign  _lcd_i_rst = p_reset;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_snx_i_memory_write&_net_50)&(read_lcd|_reg_29)))
 begin $display("Warning: assign collision(DE2_115:_lcd_i_adrs) at %d",$time);
if ((_snx_i_memory_write&_net_50)) $display("assert ((_snx_i_memory_write&_net_50)) line 237 at %d\n",$time);
if ((read_lcd|_reg_29)) $display("assert ((read_lcd|_reg_29)) line 203 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _lcd_i_adrs = 
// synthesis translate_off
// synopsys translate_off
(((_snx_i_memory_write&_net_50)&(read_lcd|_reg_29)))? 5'bx :(((_snx_i_memory_write&_net_50)|(read_lcd|_reg_29)))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_50))?(_snx_i_adrs[4:0]):5'b0)|
    (((read_lcd|_reg_29))?(_snx_i_adrs[4:0]):5'b0)
// synthesis translate_off
// synopsys translate_off
:5'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _lcd_i_from_cpu = 
// synthesis translate_off
// synopsys translate_off
((_snx_i_memory_write&_net_50))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_50))?_snx_i_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _lcd_i_we)
  begin
#1 if (_lcd_i_we===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_lcd_i_we) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_50))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_50) || 1'b1) line 237 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _lcd_i_we = (_snx_i_memory_write&_net_50);

// synthesis translate_off
// synopsys translate_off
always @(posedge _lcd_i_cs)
  begin
#1 if (_lcd_i_cs===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_lcd_i_cs) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_50))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_50) || 1'b1) line 237 at %d\n",$time);
#1 if ((((read_lcd|_reg_29))===1'bx) || (1'b1)===1'bx) $display("hazard ((read_lcd|_reg_29) || 1'b1) line 203 at %d\n",$time);
#1 if (((_reg_28)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_28 || 1'b1) line 204 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _lcd_i_cs = (_snx_i_memory_write&_net_50)|
    (read_lcd|_reg_29)|
    _reg_28;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_snx_i_memory_write&_net_48)&_reg_30))
 begin $display("Warning: assign collision(DE2_115:_led_i_adrs) at %d",$time);
if ((_snx_i_memory_write&_net_48)) $display("assert ((_snx_i_memory_write&_net_48)) line 239 at %d\n",$time);
if (_reg_30) $display("assert (_reg_30) line 208 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _led_i_adrs = 
// synthesis translate_off
// synopsys translate_off
(((_snx_i_memory_write&_net_48)&_reg_30))? 1'bx :(((_snx_i_memory_write&_net_48)|_reg_30))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_48))?(_snx_i_adrs[0:0]):1'b0)|
    ((_reg_30)?(adrs_reg[0:0]):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _led_i_datai = 
// synthesis translate_off
// synopsys translate_off
((_snx_i_memory_write&_net_48))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_48))?_snx_i_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _led_i_write)
  begin
#1 if (_led_i_write===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_led_i_write) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_48))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_48) || 1'b1) line 239 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _led_i_write = (_snx_i_memory_write&_net_48);

// synthesis translate_off
// synopsys translate_off
always @(posedge _led_i_read)
  begin
#1 if (_led_i_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_led_i_read) at %d",$time);
 end
#1 if (((_reg_30)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_30 || 1'b1) line 208 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _led_i_read = _reg_30;
   assign  _led_i_p_reset = p_reset;
   assign  _led_i_m_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((((((((_reg_40&_reg_38)|((_reg_40|_reg_38)&_reg_34))|(((_reg_40|_reg_38)|_reg_34)&_reg_32))|((((_reg_40|_reg_38)|_reg_34)|_reg_32)&_reg_30))|(((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)&_reg_28))|((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)&_reg_26))|(((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)&_reg_24))|((((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)|_reg_24)&_reg_22))|(((((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)|_reg_24)|_reg_22)&_reg_20)))
 begin $display("Warning: assign collision(DE2_115:_snx_i_datai) at %d",$time);
if (_reg_40) $display("assert (_reg_40) line 225 at %d\n",$time);
if (_reg_38) $display("assert (_reg_38) line 221 at %d\n",$time);
if (_reg_34) $display("assert (_reg_34) line 217 at %d\n",$time);
if (_reg_32) $display("assert (_reg_32) line 212 at %d\n",$time);
if (_reg_30) $display("assert (_reg_30) line 208 at %d\n",$time);
if (_reg_28) $display("assert (_reg_28) line 204 at %d\n",$time);
if (_reg_26) $display("assert (_reg_26) line 200 at %d\n",$time);
if (_reg_24) $display("assert (_reg_24) line 196 at %d\n",$time);
if (_reg_22) $display("assert (_reg_22) line 192 at %d\n",$time);
if (_reg_20) $display("assert (_reg_20) line 187 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _snx_i_datai = 
// synthesis translate_off
// synopsys translate_off
((((((((((_reg_40&_reg_38)|((_reg_40|_reg_38)&_reg_34))|(((_reg_40|_reg_38)|_reg_34)&_reg_32))|((((_reg_40|_reg_38)|_reg_34)|_reg_32)&_reg_30))|(((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)&_reg_28))|((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)&_reg_26))|(((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)&_reg_24))|((((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)|_reg_24)&_reg_22))|(((((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)|_reg_24)|_reg_22)&_reg_20)))? 16'bx :((((((((((_reg_40|_reg_38)|_reg_34)|_reg_32)|_reg_30)|_reg_28)|_reg_26)|_reg_24)|_reg_22)|_reg_20))? 
// synthesis translate_on
// synopsys translate_on
((_reg_40)?_net_42:16'b0)|
    ((_reg_38)?_timer_i_datao:16'b0)|
    ((_reg_34)?_net_36:16'b0)|
    ((_reg_32)?_sw_i_datao:16'b0)|
    ((_reg_30)?_led_i_datao:16'b0)|
    ((_reg_28)?_lcd_i_to_cpu:16'b0)|
    ((_reg_26)?_key_i_datao:16'b0)|
    ((_reg_24)?_hex_i_datao:16'b0)|
    ((_reg_22)?_dmem_i_q:16'b0)|
    ((_reg_20)?_imem_i_q:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _snx_i_intr)
  begin
#1 if (_snx_i_intr===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_snx_i_intr) at %d",$time);
 end
#1 if (((_timer_i_intr)===1'bx) || (1'b1)===1'bx) $display("hazard (_timer_i_intr || 1'b1) line 168 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _snx_i_intr = _timer_i_intr;
   assign  _snx_i_p_reset = p_reset;
   assign  _snx_i_m_clock = m_clock;
   assign  _sw_i_SW = (SW[15:0]);

// synthesis translate_off
// synopsys translate_off
always @(posedge _sw_i_read)
  begin
#1 if (_sw_i_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_sw_i_read) at %d",$time);
 end
#1 if (((_reg_32)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_32 || 1'b1) line 212 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sw_i_read = _reg_32;
   assign  _sw_i_p_reset = p_reset;
   assign  _sw_i_m_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_snx_i_memory_write&_net_44)&_reg_40))
 begin $display("Warning: assign collision(DE2_115:_vga_i_adrs) at %d",$time);
if ((_snx_i_memory_write&_net_44)) $display("assert ((_snx_i_memory_write&_net_44)) line 243 at %d\n",$time);
if (_reg_40) $display("assert (_reg_40) line 225 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _vga_i_adrs = 
// synthesis translate_off
// synopsys translate_off
(((_snx_i_memory_write&_net_44)&_reg_40))? 12'bx :(((_snx_i_memory_write&_net_44)|_reg_40))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_44))?(_snx_i_adrs[11:0]):12'b0)|
    ((_reg_40)?(adrs_reg[11:0]):12'b0)
// synthesis translate_off
// synopsys translate_off
:12'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _vga_i_w_data = 
// synthesis translate_off
// synopsys translate_off
((_snx_i_memory_write&_net_44))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_44))?_snx_i_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _vga_i_write)
  begin
#1 if (_vga_i_write===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_vga_i_write) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_44))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_44) || 1'b1) line 243 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _vga_i_write = (_snx_i_memory_write&_net_44);

// synthesis translate_off
// synopsys translate_off
always @(posedge _vga_i_read)
  begin
#1 if (_vga_i_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_vga_i_read) at %d",$time);
 end
#1 if (((_reg_40)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_40 || 1'b1) line 225 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _vga_i_read = _reg_40;
   assign  _vga_i_p_reset = p_reset;
   assign  _vga_i_m_clock = m_clock;
   assign  _ps2in_i_rxd = PS2_DAT;
   assign  _ps2in_i_rxc = PS2_CLK;

// synthesis translate_off
// synopsys translate_off
always @(posedge _ps2in_i_port_read)
  begin
#1 if (_ps2in_i_port_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_ps2in_i_port_read) at %d",$time);
 end
#1 if ((((_reg_34&_net_37))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_34&_net_37) || 1'b1) line 216 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _ps2in_i_port_read = (_reg_34&_net_37);
   assign  _ps2in_i_p_reset = p_reset;
   assign  _ps2in_i_m_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_snx_i_memory_write&_net_46)&_reg_38))
 begin $display("Warning: assign collision(DE2_115:_timer_i_adrs) at %d",$time);
if ((_snx_i_memory_write&_net_46)) $display("assert ((_snx_i_memory_write&_net_46)) line 241 at %d\n",$time);
if (_reg_38) $display("assert (_reg_38) line 221 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _timer_i_adrs = 
// synthesis translate_off
// synopsys translate_off
(((_snx_i_memory_write&_net_46)&_reg_38))? 2'bx :(((_snx_i_memory_write&_net_46)|_reg_38))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_46))?(_snx_i_adrs[1:0]):2'b0)|
    ((_reg_38)?(adrs_reg[1:0]):2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _timer_i_datai = 
// synthesis translate_off
// synopsys translate_off
((_snx_i_memory_write&_net_46))? 
// synthesis translate_on
// synopsys translate_on
(((_snx_i_memory_write&_net_46))?_snx_i_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _timer_i_read)
  begin
#1 if (_timer_i_read===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_timer_i_read) at %d",$time);
 end
#1 if (((_reg_38)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_38 || 1'b1) line 221 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _timer_i_read = _reg_38;

// synthesis translate_off
// synopsys translate_off
always @(posedge _timer_i_write)
  begin
#1 if (_timer_i_write===1'bx)
 begin
$display("Warning: control hazard(DE2_115:_timer_i_write) at %d",$time);
 end
#1 if ((((_snx_i_memory_write&_net_46))===1'bx) || (1'b1)===1'bx) $display("hazard ((_snx_i_memory_write&_net_46) || 1'b1) line 241 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _timer_i_write = (_snx_i_memory_write&_net_46);
   assign  _timer_i_p_reset = p_reset;
   assign  _timer_i_m_clock = m_clock;
   assign  _net_0 = (16'b1100000000000000>>12);
   assign  _net_1 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:12])==(_net_0[3:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_2 = (16'b1010000100000000>>2);
   assign  _net_3 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:2])==(_net_2[13:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_4 = (16'b1010000000000100>>1);
   assign  _net_5 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:1])==(_net_4[14:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_6 = (16'b1010000000000001>>0);
   assign  _net_7 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:0])==(_net_6[15:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_8 = (16'b1010000000000010>>1);
   assign  _net_9 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:1])==(_net_8[14:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_10 = (16'b1010000000100000>>5);
   assign  _net_11 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:5])==(_net_10[10:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_12 = (16'b1010000000000000>>0);
   assign  _net_13 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:0])==(_net_12[15:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_14 = (16'b1010000000001000>>3);
   assign  _net_15 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:3])==(_net_14[12:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_16 = (16'b0001000000000000>>12);
   assign  _net_17 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:12])==(_net_16[3:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_18 = (16'b0000000000000000>>12);
   assign  _net_19 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_read)?((_snx_i_adrs[15:12])==(_net_18[3:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_34&(~_net_37))&(_reg_34&_net_37)))
 begin $display("Warning: assign collision(DE2_115:_net_36) at %d",$time);
if ((_reg_34&(~_net_37))) $display("assert ((_reg_34&(~_net_37))) line 217 at %d\n",$time);
if ((_reg_34&_net_37)) $display("assert ((_reg_34&_net_37)) line 217 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _net_36 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_34&(~_net_37))&(_reg_34&_net_37)))? 16'bx :(((_reg_34&(~_net_37))|(_reg_34&_net_37)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_34&(~_net_37)))?({8'b00000000,_ps2in_i_rxready,7'b0000000}):16'b0)|
    (((_reg_34&_net_37))?({8'b00000000,_ps2in_i_data}):16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_37 = 
// synthesis translate_off
// synopsys translate_off
(_reg_34)? 
// synthesis translate_on
// synopsys translate_on
((_reg_34)?(~(adrs_reg[0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_42 = _vga_i_r_data;
   assign  _net_43 = (16'b1100000000000000>>12);
   assign  _net_44 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_write)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_write)?((_snx_i_adrs[15:12])==(_net_43[3:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_45 = (16'b1010000100000000>>2);
   assign  _net_46 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_write)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_write)?((_snx_i_adrs[15:2])==(_net_45[13:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_47 = (16'b1010000000000010>>1);
   assign  _net_48 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_write)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_write)?((_snx_i_adrs[15:1])==(_net_47[14:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_49 = (16'b1010000000100000>>5);
   assign  _net_50 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_write)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_write)?((_snx_i_adrs[15:5])==(_net_49[10:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_51 = (16'b1010000000001000>>3);
   assign  _net_52 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_write)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_write)?((_snx_i_adrs[15:3])==(_net_51[12:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_53 = (16'b0001000000000000>>12);
   assign  _net_54 = 
// synthesis translate_off
// synopsys translate_off
(_snx_i_memory_write)? 
// synthesis translate_on
// synopsys translate_on
((_snx_i_memory_write)?((_snx_i_adrs[15:12])==(_net_53[3:0])):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  HEX0 = (_hex_i_HEX0[6:0]);
   assign  HEX1 = (_hex_i_HEX1[6:0]);
   assign  HEX2 = (_hex_i_HEX2[6:0]);
   assign  HEX3 = (_hex_i_HEX3[6:0]);
   assign  HEX4 = (_hex_i_HEX4[6:0]);
   assign  HEX5 = (_hex_i_HEX5[6:0]);
   assign  HEX6 = (_hex_i_HEX6[6:0]);
   assign  HEX7 = (_hex_i_HEX7[6:0]);
   assign  LEDG = _led_i_LEDG;
   assign  LEDR = ({(~m_clock),m_clock,_led_i_LEDR});
   assign  LCD_DATA = _lcd_i_LCD_DATA;
   assign  LCD_ON = 1'b1;
   assign  LCD_BLON = 1'b0;
   assign  LCD_RW = _lcd_i_LCD_RW;
   assign  LCD_EN = _lcd_i_LCD_EN;
   assign  LCD_RS = _lcd_i_LCD_RS;
   assign  VGA_R = ({_vga_i_R,6'b000000});
   assign  VGA_G = ({_vga_i_G,6'b000000});
   assign  VGA_B = ({_vga_i_B,6'b000000});
   assign  VGA_HS = _vga_i_HS;
   assign  VGA_VS = _vga_i_VS;
   assign  VGA_SYNC = (~_vga_i_SYNC);
   assign  VGA_BLANK = (~_vga_i_BLANK);
   assign  VGA_CLK = _vga_i_CLOCK;
always @(posedge m_clock)
  begin

// synthesis translate_off
// synopsys translate_off
if ((((((((read_vga|_reg_41)&(read_timer|_reg_39))|(((read_vga|_reg_41)|(read_timer|_reg_39))&(read_ps2in|_reg_35)))|((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))&(read_sw|_reg_33)))|(((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))&(read_led|_reg_31)))|((((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))|(read_led|_reg_31))&(read_key|_reg_27)))|(((((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))|(read_led|_reg_31))|(read_key|_reg_27))&(read_hex|_reg_25))))   adrs_reg <= 16'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((read_vga|_reg_41))
      adrs_reg <= _snx_i_adrs;
else if ((read_timer|_reg_39))
      adrs_reg <= _snx_i_adrs;
else if ((read_ps2in|_reg_35))
      adrs_reg <= _snx_i_adrs;
else if ((read_sw|_reg_33))
      adrs_reg <= _snx_i_adrs;
else if ((read_led|_reg_31))
      adrs_reg <= _snx_i_adrs;
else if ((read_key|_reg_27))
      adrs_reg <= _snx_i_adrs;
else if ((read_hex|_reg_25))
      adrs_reg <= _snx_i_adrs;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))|(read_led|_reg_31))|(read_key|_reg_27))|(read_hex|_reg_25))==1'b1) ||
 ((((((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))|(read_led|_reg_31))|(read_key|_reg_27))|(read_hex|_reg_25))==1'b0) ) begin
 if ((((((((read_vga|_reg_41)&(read_timer|_reg_39))|(((read_vga|_reg_41)|(read_timer|_reg_39))&(read_ps2in|_reg_35)))|((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))&(read_sw|_reg_33)))|(((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))&(read_led|_reg_31)))|((((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))|(read_led|_reg_31))&(read_key|_reg_27)))|(((((((read_vga|_reg_41)|(read_timer|_reg_39))|(read_ps2in|_reg_35))|(read_sw|_reg_33))|(read_led|_reg_31))|(read_key|_reg_27))&(read_hex|_reg_25))))
 begin $display("Warning: assign collision(DE2_115:adrs_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(DE2_115:adrs_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_20 <= 1'b0;
else if ((read_imem|(_reg_20|_reg_21)))
      _reg_20 <= (_reg_21|read_imem);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_21 <= 1'b0;
else if (_reg_21)
      _reg_21 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_22 <= 1'b0;
else if ((read_dmem|(_reg_22|_reg_23)))
      _reg_22 <= (_reg_23|read_dmem);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_23 <= 1'b0;
else if (_reg_23)
      _reg_23 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_24 <= 1'b0;
else if ((read_hex|(_reg_24|_reg_25)))
      _reg_24 <= (_reg_25|read_hex);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_25 <= 1'b0;
else if (_reg_25)
      _reg_25 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_26 <= 1'b0;
else if ((read_key|(_reg_26|_reg_27)))
      _reg_26 <= (_reg_27|read_key);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_27 <= 1'b0;
else if (_reg_27)
      _reg_27 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_28 <= 1'b0;
else if ((read_lcd|(_reg_28|_reg_29)))
      _reg_28 <= (_reg_29|read_lcd);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_29 <= 1'b0;
else if (_reg_29)
      _reg_29 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_30 <= 1'b0;
else if ((read_led|(_reg_30|_reg_31)))
      _reg_30 <= (_reg_31|read_led);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_31 <= 1'b0;
else if (_reg_31)
      _reg_31 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_32 <= 1'b0;
else if ((read_sw|(_reg_32|_reg_33)))
      _reg_32 <= (_reg_33|read_sw);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_33 <= 1'b0;
else if (_reg_33)
      _reg_33 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_34 <= 1'b0;
else if ((read_ps2in|(_reg_34|_reg_35)))
      _reg_34 <= (_reg_35|read_ps2in);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_35 <= 1'b0;
else if (_reg_35)
      _reg_35 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_38 <= 1'b0;
else if ((read_timer|(_reg_38|_reg_39)))
      _reg_38 <= (_reg_39|read_timer);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_39 <= 1'b0;
else if (_reg_39)
      _reg_39 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_40 <= 1'b0;
else if ((read_vga|(_reg_40|_reg_41)))
      _reg_40 <= (_reg_41|read_vga);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_41 <= 1'b0;
else if (_reg_41)
      _reg_41 <= 1'b0;
end
endmodule
/*
 Produced by NSL Core(version=20130407), IP ARCH, Inc. Mon Aug 11 15:53:55 2014
 Licensed to :500 line EVALUATION USER
*/
