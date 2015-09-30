#include <stdlib.h>
#include <stdio.h>
#include <verilated.cpp>
#include "Vmidway.h"
#if VM_TRACE
#include <SpTraceVcdC.cpp>
#endif

#define STOP 8000000

Vmidway *midway;

void dispreg() {
      printf("PC:%02X%02X OP:%02X F:%02X A:%02X B:%02X C:%02X D:%02X E:%02X H:%02X L:%02X ",
	      midway->v__DOT__cpu__DOT__cpu__DOT__pch,
	      midway->v__DOT__cpu__DOT__cpu__DOT__pcl,
	      midway->v__DOT__cpu__DOT__cpu__DOT__op0,
	      midway->v__DOT__cpu__DOT__cpu__DOT__f,
	      midway->v__DOT__cpu__DOT__cpu__DOT__a,
	      midway->v__DOT__cpu__DOT__cpu__DOT__b,
	      midway->v__DOT__cpu__DOT__cpu__DOT__c,
	      midway->v__DOT__cpu__DOT__cpu__DOT__d,
	      midway->v__DOT__cpu__DOT__cpu__DOT__e,
	      midway->v__DOT__cpu__DOT__cpu__DOT__h,
	      midway->v__DOT__cpu__DOT__cpu__DOT__l);
      printf("SP:%02X%02X ",
	      midway->v__DOT__cpu__DOT__cpu__DOT__sph,
	      midway->v__DOT__cpu__DOT__cpu__DOT__spl);
      printf("ad:%04X o:%02X i:%02X\n",
	      midway->v__DOT__cpu__DOT___cpu_adrs,
	      midway->v__DOT__cpu__DOT___cpu_datao,
	      midway->v__DOT__cpu__DOT___cpu_data);
      return;
}

void dumpscreen() {
FILE *pbm;
int i,j,k;
char c;
  if(!(pbm=fopen("midway.pbm","w"))) return;
  fprintf(pbm,"P1\n# MIDWAY SCREEN OUT\n256\n224\n");
  for(i=0;i<224;i++) {
    for(j=0;j<32;j++) {
       c=midway->v__DOT__vram__DOT__ram[8192-(i*32+j)];
       for(k=0;k<8;k++)
         fprintf(pbm,"%d ", 1&(c>>(7-k)));
       fprintf(pbm,"\n");
    }
   }
   fclose(pbm);
   return;
}

int main(int argc, char *argv[])
{
  FILE *fp,*ft;
  int i, j, dsp=0;
  unsigned int main_time = 0, stoptime = STOP;
  midway = new Vmidway;
  if(argc>2) dsp=1;

  if((fp=fopen("midway.mem","r"))==NULL) {printf("open error\n");exit(1);}
  for( i=0; i<8192; i=i+1) 
     if(fscanf(fp,"%hhx",&midway->v__DOT__rom__DOT__ram[i])==EOF) break;
  fclose(fp);

  for( i=0; i<8192; i=i+1) 
     midway->v__DOT__vram__DOT__ram[i] = i & 255;

 if(argc>1) stoptime = atoi(argv[1]);
 if((argc>2) && (argv[2][0]=='-')) dsp = 0;


#if VM_TRACE
  Verilated::traceEverOn(true);
  SpTraceVcdCFile * tf = new SpTraceVcdCFile;
  midway->trace(tf,5);
  tf->open("midway.vcd");
#endif
  midway->p_reset = 1;
  midway->m_clock = 0;
  for(i=0;i<stoptime;i++) {
      if(main_time>3) { midway->p_reset = 0;
  		midway->v__DOT__vga10m__DOT__v_dispon = 1; }
      midway->m_clock = 1;
      midway->eval();
      midway->m_clock = 0;
      midway->eval();
      if(dsp) dispreg();
      main_time++;
      if(main_time > 10000000) midway->sw = 1;
      if(main_time > 11000000) midway->sw = 2;
      if(main_time > 12000000) midway->sw = 0;
      if(main_time > 15000000) midway->btn = 1;
      if(main_time > 17000000) midway->btn = 3;
      if(main_time > 18000000) midway->btn = 1;
      if(main_time > 19000000) midway->btn = 2;
      if(main_time > 19300000) midway->btn = 0;
      if(main_time > 19500000) midway->btn = 2;
      if(main_time > 19700000) midway->btn = 0;
      if(main_time > 20000000) midway->btn = 2;
      if(main_time > 20300000) midway->btn = 0;
      if(main_time > 20500000) midway->btn = 2;
      if(main_time > 20700000) midway->btn = 0;
#if VM_TRACE
      tf->dump(main_time);
#endif
    }
#if VM_TRACE
 tf->close();
#endif

  dumpscreen();

  return (0);
}
