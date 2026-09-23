/*
 Produced by NSL Core(version=20130407), IP ARCH, Inc. Mon Aug 11 15:48:46 2014
 Licensed to :500 line EVALUATION USER
*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module snx_system ( p_reset , m_clock , datai , datao , adrs , intr , memory_read , memory_write );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [15:0] datai;
  wire [15:0] datai;
  output [15:0] datao;
  wire [15:0] datao;
  output [15:0] adrs;
  wire [15:0] adrs;
  input intr;
  wire intr;
  output memory_read;
  wire memory_read;
  output memory_write;
  wire memory_write;
  reg st0;
  reg st1;
  reg st2;
  wire [15:0] _cpu_inst;
  wire [15:0] _cpu_datai;
  wire [15:0] _cpu_datao;
  wire [15:0] _cpu_iadrs;
  wire [15:0] _cpu_adrs;
  wire _cpu_start;
  wire _cpu_IntReq;
  wire _cpu_inst_ok;
  wire _cpu_mem_ok;
  wire _cpu_inst_adr;
  wire _cpu_inst_read;
  wire _cpu_memory_adr;
  wire _cpu_memory_read;
  wire _cpu_memory_write;
  wire _cpu_IntAck;
  wire _cpu_wb;
  wire _cpu_hlt;
  wire _cpu_p_reset;
  wire _cpu_m_clock;
  wire _net_0;
snx cpu (.p_reset(_cpu_p_reset), .m_clock(_cpu_m_clock), .hlt(_cpu_hlt), .wb(_cpu_wb), .IntAck(_cpu_IntAck), .memory_write(_cpu_memory_write), .memory_read(_cpu_memory_read), .memory_adr(_cpu_memory_adr), .inst_read(_cpu_inst_read), .inst_adr(_cpu_inst_adr), .mem_ok(_cpu_mem_ok), .inst_ok(_cpu_inst_ok), .IntReq(_cpu_IntReq), .start(_cpu_start), .adrs(_cpu_adrs), .iadrs(_cpu_iadrs), .datao(_cpu_datao), .datai(_cpu_datai), .inst(_cpu_inst));

   assign  _cpu_inst = 
// synthesis translate_off
// synopsys translate_off
((((~_cpu_memory_read)&(~_cpu_memory_write))&_cpu_inst_read))? 
// synthesis translate_on
// synopsys translate_on
(((((~_cpu_memory_read)&(~_cpu_memory_write))&_cpu_inst_read))?datai:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _cpu_datai = 
// synthesis translate_off
// synopsys translate_off
(_cpu_memory_read)? 
// synthesis translate_on
// synopsys translate_on
((_cpu_memory_read)?datai:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _cpu_start)
  begin
#1 if (_cpu_start===1'bx)
 begin
$display("Warning: control hazard(snx_system:_cpu_start) at %d",$time);
 end
#1 if (((_net_0)===1'bx) || (1'b1)===1'bx) $display("hazard (_net_0 || 1'b1) line 13 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _cpu_start = _net_0;

// synthesis translate_off
// synopsys translate_off
always @(posedge _cpu_IntReq)
  begin
#1 if (_cpu_IntReq===1'bx)
 begin
$display("Warning: control hazard(snx_system:_cpu_IntReq) at %d",$time);
 end
#1 if (((intr)===1'bx) || (1'b1)===1'bx) $display("hazard (intr || 1'b1) line 18 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _cpu_IntReq = intr;

// synthesis translate_off
// synopsys translate_off
always @(posedge _cpu_inst_ok)
  begin
#1 if (_cpu_inst_ok===1'bx)
 begin
$display("Warning: control hazard(snx_system:_cpu_inst_ok) at %d",$time);
 end
#1 if ((((((~_cpu_memory_read)&(~_cpu_memory_write))&_cpu_inst_read))===1'bx) || (1'b1)===1'bx) $display("hazard ((((~_cpu_memory_read)&(~_cpu_memory_write))&_cpu_inst_read) || 1'b1) line 23 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _cpu_inst_ok = (((~_cpu_memory_read)&(~_cpu_memory_write))&_cpu_inst_read);

// synthesis translate_off
// synopsys translate_off
always @(posedge _cpu_mem_ok)
  begin
#1 if (_cpu_mem_ok===1'bx)
 begin
$display("Warning: control hazard(snx_system:_cpu_mem_ok) at %d",$time);
 end
#1 if (((((~_cpu_memory_read)&_cpu_memory_write))===1'bx) || (1'b1)===1'bx) $display("hazard (((~_cpu_memory_read)&_cpu_memory_write) || 1'b1) line 22 at %d\n",$time);
#1 if (((_cpu_memory_read)===1'bx) || (1'b1)===1'bx) $display("hazard (_cpu_memory_read || 1'b1) line 21 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _cpu_mem_ok = ((~_cpu_memory_read)&_cpu_memory_write)|
    _cpu_memory_read;
   assign  _cpu_p_reset = p_reset;
   assign  _cpu_m_clock = m_clock;
   assign  _net_0 = ((~st2)&st1);
   assign  datao = 
// synthesis translate_off
// synopsys translate_off
(((~_cpu_memory_read)&_cpu_memory_write))? 
// synthesis translate_on
// synopsys translate_on
((((~_cpu_memory_read)&_cpu_memory_write))?_cpu_datao:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((((~_cpu_memory_read)&_cpu_memory_write)&_cpu_inst_adr)|((((~_cpu_memory_read)&_cpu_memory_write)|_cpu_inst_adr)&_cpu_memory_adr)))
 begin $display("Warning: assign collision(snx_system:adrs) at %d",$time);
if (((~_cpu_memory_read)&_cpu_memory_write)) $display("assert (((~_cpu_memory_read)&_cpu_memory_write)) line 22 at %d\n",$time);
if (_cpu_inst_adr) $display("assert (_cpu_inst_adr) line 17 at %d\n",$time);
if (_cpu_memory_adr) $display("assert (_cpu_memory_adr) line 16 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  adrs = 
// synthesis translate_off
// synopsys translate_off
(((((~_cpu_memory_read)&_cpu_memory_write)&_cpu_inst_adr)|((((~_cpu_memory_read)&_cpu_memory_write)|_cpu_inst_adr)&_cpu_memory_adr)))? 16'bx :(((((~_cpu_memory_read)&_cpu_memory_write)|_cpu_inst_adr)|_cpu_memory_adr))? 
// synthesis translate_on
// synopsys translate_on
((((~_cpu_memory_read)&_cpu_memory_write))?_cpu_adrs:16'b0)|
    ((_cpu_inst_adr)?_cpu_iadrs:16'b0)|
    ((_cpu_memory_adr)?_cpu_adrs:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge memory_read)
  begin
#1 if (memory_read===1'bx)
 begin
$display("Warning: control hazard(snx_system:memory_read) at %d",$time);
 end
#1 if (((_cpu_inst_adr)===1'bx) || (1'b1)===1'bx) $display("hazard (_cpu_inst_adr || 1'b1) line 17 at %d\n",$time);
#1 if (((_cpu_memory_adr)===1'bx) || (1'b1)===1'bx) $display("hazard (_cpu_memory_adr || 1'b1) line 16 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  memory_read = _cpu_inst_adr|
    _cpu_memory_adr;

// synthesis translate_off
// synopsys translate_off
always @(posedge memory_write)
  begin
#1 if (memory_write===1'bx)
 begin
$display("Warning: control hazard(snx_system:memory_write) at %d",$time);
 end
#1 if (((((~_cpu_memory_read)&_cpu_memory_write))===1'bx) || (1'b1)===1'bx) $display("hazard (((~_cpu_memory_read)&_cpu_memory_write) || 1'b1) line 22 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  memory_write = ((~_cpu_memory_read)&_cpu_memory_write);
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     st0 <= 1'b0;
else   st0 <= 1'b1;
end
always @(posedge m_clock)
  begin
  st1 <= st0;
end
always @(posedge m_clock)
  begin
  st2 <= st1;
end
endmodule
/*
 Produced by NSL Core(version=20130407), IP ARCH, Inc. Mon Aug 11 15:48:46 2014
 Licensed to :500 line EVALUATION USER
*/
