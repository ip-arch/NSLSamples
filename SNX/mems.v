module ROM (p_reset, m_clock, read, out, addr);
input p_reset, m_clock, read;
input [15:0] addr;
output [15:0] out;
reg [15:0] out;
reg [15:0] cell [0:1023];

always @(addr) out = cell[addr];

initial $readmemh("snx.mem",cell);

endmodule

module RAM (p_reset, m_clock, write, read, in, out, addr);
input p_reset, m_clock, read, write;
input [15:0] addr, in;
output [15:0] out;
reg [15:0] cell [0:1023];
reg [15:0] out;

always @(addr) out = cell[addr];
always @(posedge m_clock) begin
 if(write) cell[addr] <= in;
 end
endmodule

