#include <systemc.h>
#include "../NSL/m8.sc"

 sc_clock m_clock("m_clock", 10, 0.5, 0, false);
 sc_signal<bool> p_reset;
 sc_signal<sc_uint<1> >  mr, mw, start;
 sc_signal<sc_uint<8> > adr, cpuout, cpuin;
 int  ram[256];
 static int clck=0;
 m8 cpu("cpu");

SC_MODULE (ctrl) {
  sc_in<bool> m_clock;
void res() {
  clck++;
  if(clck == 0) p_reset = 0;
  if(clck == 3) p_reset = 1;
  if(clck == 4) p_reset = 0;

  if(start.read()) start = 0;
  if(clck == 5) start = 1;

  printf("\n%3d: PC: %02X  OP: %02X  OPR: %02X  ACC: %02X", clck, (int)cpu.pc.read(), (int)cpu.op.read(), (int)cpu.opr.read(), (int)cpu.acc.read());
}

void  mrf() {
  if(mr.read()) {
        printf("\tA: %02X  R: %02X", (int)adr.read(), ram[(int)adr.read()]);
	cpuin = (sc_uint<8>)ram[(int)adr.read()];
  }
}

void mwf() {
  if(mw.read()) {
        printf("\tA: %02X  W: %02X", (int)adr.read(), (int)cpuout.read());
	ram[(int)adr.read()] = cpuout.read();
 }
}

SC_CTOR (ctrl) {
	SC_METHOD(res);
	sensitive << m_clock.neg(); 
	SC_METHOD(mrf);
	sensitive << m_clock.neg(); 
	SC_METHOD(mwf);
	sensitive << m_clock.neg(); 
}
};


int sc_main(int argc,  char *argv[])
{
 FILE *fp;
 int i;
 sc_trace_file* tf = sc_create_vcd_trace_file("m8");
 sc_trace(tf,cpu.m_clock,"cpu.m_clock");
 sc_trace(tf,cpu.p_reset,"cpu.p_reset");
 sc_trace(tf,cpu.start,"cpu.start");
 sc_trace(tf,cpu.a,"cpu.a");
 sc_trace(tf,cpu.i,"cpu.i");
 sc_trace(tf,cpu.d,"cpu.d");
 sc_trace(tf,cpu.mr,"cpu.mr");
 sc_trace(tf,cpu.mw,"cpu.mw");
 sc_trace(tf,cpu.pc,"cpu.pc");
 sc_trace(tf,cpu.acc,"cpu.acc");
 sc_trace(tf,cpu.op,"cpu.op");
 sc_trace(tf,cpu.opr,"cpu.opr");
 sc_trace(tf,cpu.ifetch,"cpu.ifetch");
 sc_trace(tf,cpu.decode,"cpu.decode");
 sc_trace(tf,cpu.memory,"cpu.memory");
 sc_trace(tf,cpu.exec,"cpu.exec");
 sc_trace(tf,cpu._alu_exe,"cpu._alu_exe");
 sc_trace(tf,cpu._alu_done,"cpu._alu_done");
 sc_trace(tf,cpu._proc_exec_set,"cpu._proc_exec_set");
 sc_trace(tf,cpu._proc_exec_reset,"cpu._proc_exec_reset");
 sc_trace(tf,cpu._proc_ifetch_set,"cpu._proc_ifetch_set");
 sc_trace(tf,cpu._proc_ifetch_reset,"cpu._proc_ifetch_reset");
 sc_trace(tf,cpu._proc_decode_set,"cpu._proc_decode_set");
 sc_trace(tf,cpu._proc_decode_reset,"cpu._proc_decode_reset");
 sc_trace(tf,cpu._proc_memory_set,"cpu._proc_memory_set");
 sc_trace(tf,cpu._proc_memory_reset,"cpu._proc_memory_reset");

 if(!(fp = fopen("m8.mem","r"))) {fprintf(stderr, "Open error\n"); sc_stop();}
 for(i=0;i<256;i++) {
  if(fscanf(fp,"%x", &ram[i]) ==EOF) break;
 }

 ctrl ct("ct");

 ct.m_clock(m_clock);

 cpu.m_clock(m_clock);
 cpu.p_reset(p_reset);
 cpu.a(adr);
 cpu.d(cpuout);
 cpu.i(cpuin);
 cpu.start(start);
 cpu.mr(mr);
 cpu.mw(mw);

 sc_start(1000, SC_NS);
 sc_close_vcd_trace_file(tf);
}
