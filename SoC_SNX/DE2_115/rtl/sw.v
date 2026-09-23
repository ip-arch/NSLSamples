/*
 Produced by NSL Core(version=20130407), IP ARCH, Inc. Mon Aug 11 15:46:13 2014
 Licensed to :500 line EVALUATION USER
*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module sw ( p_reset , m_clock , datai , datao , SW , read );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [15:0] datai;
  wire [15:0] datai;
  output [15:0] datao;
  wire [15:0] datao;
  input [15:0] SW;
  wire [15:0] SW;
  input read;
  wire read;
  reg [15:0] SW_i;

   assign  datao = 
// synthesis translate_off
// synopsys translate_off
(read)? 
// synthesis translate_on
// synopsys translate_on
((read)?SW_i:16'b0)
// synthesis translate_off
// synopsys translate_off
:16'bx
// synthesis translate_on
// synopsys translate_on
;
always @(posedge m_clock)
  begin
  SW_i <= SW;
end
endmodule
/*
 Produced by NSL Core(version=20130407), IP ARCH, Inc. Mon Aug 11 15:46:13 2014
 Licensed to :500 line EVALUATION USER
*/
