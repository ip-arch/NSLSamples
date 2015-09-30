module ROM (p_reset, m_clock, read, out, addr);
input p_reset, m_clock, read;
input [15:0] addr;
output [15:0] out;

lpm_rom u1 (.address(addr[7:0]), .q(out), .inclock(^m_clock));
 defparam u1.lpm_width = 16;
 defparam u1.lpm_widthad = 8;
 defparam u1.lpm_address_control = "REGISTERED";
 defparam u1.lpm_outdata = "UNREGISTERED";
 defparam u1.lpm_file = "snx.hex";

endmodule

module RAM (p_reset, m_clock, write, read, in, out, addr);
input p_reset, m_clock, read, write;
input [15:0] addr, in;
output [15:0] out;

lpm_ram_dq u1 (.address(addr[7:0]), .q(out), .data(in), .we(write), .inclock(^m_clock));
 defparam u1.lpm_width = 16;
 defparam u1.lpm_widthad = 8;
 defparam u1.lpm_address_control = "REGISTERED";
 defparam u1.lpm_outdata = "UNREGISTERED";

endmodule

