# 
# m8:small example processor simulation environment
#    Naohiko Shimizu, IP ARCH, Inc. http://www.ip-arch.jp/
#
# This package requires: nsl2vl, Icarus Verilog, GTKWAVE
#

SIMDIR=./SIM
NSLDIR=./NSL
FPGADIR=./FPGA
ASMDIR=./m8asm
SYSTEMC=/opt/systemc-2.3.1-debug

VERILOG=iverilog

SRC=m8.s

TARGET=board
NSL2VLOPT=
GTKWAVE=gtkwave

CLEANSIM=$(TARGET).v $(TARGET).vcd $(TARGET).exe  sim.log m8.v scsim.log m8.vcd m8scsim.exe
CLEANNSL=$(TARGET).v m8.v m8.sc
CLEANASM=m8asm.exe
CLEAN=$(FPGADIR)/board.v $(FPGADIR)/m8.mem $(FPGADIR)/m8.v
SYN=$(SIMDIR)/board.v $(SIMDIR)/m8.mem $(NSLDIR)/m8.v

all: $(SIMDIR)/sim.log

asm: $(SRC) m8asm/m8asm.exe
	m8asm/m8asm.exe -l - $(SRC) > SIM/m8.mem

gtk: $(SIMDIR)/m8.sig $(SIMDIR)/sim.log $(SIMDIR)/board.vcd
	gtkwave $(SIMDIR)/board.vcd $(SIMDIR)/m8.sig

syn: $(SYN)
	cp $(SYN) $(FPGADIR)

scsim: $(SIMDIR)/scsim.log

clean:
	-(rm $(CLEAN) )
	-(cd $(SIMDIR); \
	rm $(CLEANSIM))
	-(cd $(NSLDIR); \
	rm $(CLEANNSL))
	-(cd $(ASMDIR); \
	(make clean); \
	rm $(CLEANASM))

$(NSLDIR)/m8.v: $(NSLDIR)/m8.nsl $(NSLDIR)/alu8.nsl
	(cd $(NSLDIR); \
	nsl2vl m8.nsl $(NSL2VLOPT);)

$(SIMDIR)/board.v: $(SIMDIR)/board.nsl
	(cd $(SIMDIR); \
	nsl2vl board.nsl $(NSL2VLOPT);)

$(SIMDIR)/board.exe: $(NSLDIR)/m8.v $(SIMDIR)/board.main $(SIMDIR)/board.v
	iverilog -o $(SIMDIR)/board.exe $(SIMDIR)/board.main $(SIMDIR)/board.v $(NSLDIR)/m8.v

$(SIMDIR)/sim.log: $(SIMDIR)/board.exe $(SIMDIR)/m8.mem
	(cd $(SIMDIR); \
	vvp ./board.exe |tee sim.log )

$(ASMDIR)/m8asm.exe: $(ASMDIR)/m8asm.y $(ASMDIR)/m8asm.l $(ASMDIR)/m8asm.h
	(cd $(ASMDIR); \
	make m8asm.exe)

GTK:	$(SIMDIR)/sim.log
	(cd $(SIMDIR); \
	gtkwave board.vcd m8.sig )

scgtk:	$(SIMDIR)/scsim.log
	(cd $(SIMDIR); \
	gtkwave m8.vcd m8sc.sig )


$(SIMDIR)/scsim.log: $(SIMDIR)/m8scsim.exe $(SIMDIR)/m8.mem
	(cd $(SIMDIR); \
	./m8scsim.exe |tee scsim.log )

$(SIMDIR)/m8scsim.exe: $(NSLDIR)/m8.sc $(SIMDIR)/main.cpp
	(cd $(SIMDIR); \
	g++ -I$(SYSTEMC)/include -L$(SYSTEMC)/lib-cygwin main.cpp -lsystemc -o m8scsim.exe )

$(NSLDIR)/m8.sc: $(NSLDIR)/m8.nsl $(NSLDIR)/alu8.nsl
	(cd $(NSLDIR); \
	nsl2sc m8.nsl )

