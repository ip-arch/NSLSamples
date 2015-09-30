module main;
parameter STEP=10;
integer i,j,vcd;
reg p_reset, m_clock;
reg [15:0] imem [0:1023];
reg [15:0] dmem [0:1023];
reg [15:0] inst,datai;
reg [7:0] led,sw;
wire [15:0]	datao,iadrs,adrs;

wire	inst_read,inst_write,
	memory_read,memory_write,wb,hlt;

snx cpu(.p_reset(p_reset),.m_clock(m_clock),.inst(inst),.datai(datai),
	.datao(datao),.iadrs(iadrs),.adrs(adrs),
	.inst_read(inst_read),.inst_write(inst_write),
	.memory_read(memory_read),.memory_write(memory_write),.wb(wb),.hlt(hlt));


always #(STEP/2) m_clock=~m_clock;

always @(negedge m_clock)
begin
if((memory_read)&&(adrs[15]==0))
  datai <= dmem[adrs];
end
always @(negedge m_clock)
begin
if((memory_read)&&(adrs[15]==1))
  datai <= {8'h00,sw};
end
always @(negedge m_clock)
begin
if (memory_write)
   if(adrs[15]==0)
     dmem[adrs] <= datao;
   else
     led <= datao[7:0];

end
always @(negedge m_clock)
begin
if(inst_read)
  begin
    inst <= imem[iadrs];
  end
end
always @(negedge m_clock)
begin
if(cpu.exec)
    #1 begin
    $write("PC:%x:%x ",cpu.pc,cpu._opreg_op);
     case (cpu._opreg_op[3])
     0:
       case (cpu._opreg_op)
	'h0: $write("add $%1d, $%1d, $%1d ",cpu._opreg_r1,cpu._opreg_r2,cpu._opreg_r3);
	'h1: $write("and $%1d, $%1d, $%1d ",cpu._opreg_r1,cpu._opreg_r2,cpu._opreg_r3);
	'h2: $write("sub $%1d, $%1d, $%1d ",cpu._opreg_r1,cpu._opreg_r2,cpu._opreg_r3);
	'h3: $write("slt $%1d, $%1d, $%1d ",cpu._opreg_r1,cpu._opreg_r2,cpu._opreg_r3);
	'h4: $write("not $%1d, $%1d     ",cpu._opreg_r1,cpu._opreg_r2);
	'h6: $write("sr  $%1d, $%1d     ",cpu._opreg_r1,cpu._opreg_r2);
	'h7: $write("hlt            ");
         endcase
     1:
       case (cpu._opitype_I[7])
       0:
       case (cpu._opreg_op)
	'h8: $write("ld  $%1d,%4d($%1d)",cpu._opreg_r2,cpu._opitype_I,cpu._opreg_r3);
	'h9: $write("st  $%1d,%4d($%1d)",cpu._opreg_r2,cpu._opitype_I,cpu._opreg_r3);
	'ha: $write("lda $%1d,%4d($%1d)",cpu._opreg_r2,cpu._opitype_I,cpu._opreg_r3);
	'he: $write("bz  $%1d,%4d($%1d)",cpu._opreg_r2,cpu._opitype_I,cpu._opreg_r3);
	'hf: $write("bal $%1d,%4d($%1d)",cpu._opreg_r2,cpu._opitype_I,cpu._opreg_r3);
         endcase
       1:
       if(256-cpu._opitype_I>=100)
       case (cpu._opreg_op)
	'h8: $write("ld  $%1d,-%3d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'h9: $write("st  $%1d,-%3d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'ha: $write("lda $%1d,-%3d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'he: $write("bz  $%1d,-%3d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'hf: $write("bal $%1d,-%3d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
      endcase
      else if(256-cpu._opitype_I>=10)
       case (cpu._opreg_op)
	'h8: $write("ld  $%1d, -%2d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'h9: $write("st  $%1d, -%2d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'ha: $write("lda $%1d, -%2d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'he: $write("bz  $%1d, -%2d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'hf: $write("bal $%1d, -%2d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
      endcase
      else 
       case (cpu._opreg_op)
	'h8: $write("ld  $%1d,  -%1d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'h9: $write("st  $%1d,  -%1d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'ha: $write("lda $%1d,  -%1d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'he: $write("bz  $%1d,  -%1d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
	'hf: $write("bal $%1d,  -%1d($%1d)",cpu._opreg_r2,256-cpu._opitype_I,cpu._opreg_r3);
      endcase
     endcase
    endcase
    $write(" -- ");
   end
  end

always @(negedge m_clock)
begin

if(wb)
 #2 $display("$0:%x $1:%x $2:%x $3:%x",
	 cpu.gr.r0,cpu.gr.r1,cpu.gr.r2,cpu.gr.r3);

end
always @(negedge m_clock)
begin
if(hlt)
  begin
   $display("\nHALTED at %8d clock", $time/STEP);
   for(i=0; i<128; i=i+8)
      begin
       $write("%4x: ",i);
       for(j=0; j<8; j=j+1)
         $write("%x ",dmem[i+j]);
       $display;
      end
   $display("SW = %2x: LED = %2x", sw, led);
   $finish;
  end
end


initial begin
 $readmemh("snx.mem", imem);
 $readmemh("snx.dmem", dmem);
 if($value$plusargs("vcd=%d",vcd)) begin
   $dumpfile("snx.vcd");
   $dumpvars(2,cpu);
   end
 m_clock=0;
 p_reset=0;
 sw = 'h34;
 #(STEP) p_reset=1;
 #(60000*STEP+(STEP/2)) $finish;
end
endmodule

