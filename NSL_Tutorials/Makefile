# 
# NSL Tutorials
#    Naohiko Shimizu, IP ARCH, Inc. http://www.ip-arch.jp/
#
# This package requires: NSLCORE, SystemC, GTKWAVE
#

T=tut0
SYSTEMC=/opt/systemc-2.3.1-debug
NSL2SCOPT=-sc_hook -scsim2 -target $(T) -split -sc_trace
NSL2VLOPT=-verisim2 -target $(T)
CXXFLAGS=-g -fpermissive

GTKWAVE=gtkwave

CLEANSIM=$(T).vcd $(T)_sim.exe scsim.log
CLEANNSL=$(T).sc $(T)_sim.sc  $(T)_sim.cpp 
CLEANV=$(T).v $(T)_sim.vvp
CLEAN=

all: scsim.log


gtk: $(T).sig sim.log $(T).vcd
	gtkwave $(T).vcd $(T).sig


scsim: scsim.log
	rm scsim.log

vsim: vsim.log
	rm vsim.log

clean:
	-rm $(CLEAN) 
	-rm $(CLEANSIM)
	-rm $(CLEANNSL)
	-rm $(CLEANV)



scsim.log: $(T)_sim.exe
	SC_SIGNAL_WRITE_CHECK=DISABLE ./$(T)_sim.exe |tee scsim.log 

$(T)_sim.exe: $(T).sc $(T)_sim.cpp
	g++ $(CXXFLAGS) -I$(SYSTEMC)/include -L$(SYSTEMC)/lib-cygwin $(T)_sim.cpp -lsystemc -o $(T)_sim.exe 

$(T).sc: $(T).nsl 
	nsl2sc $(T).nsl $(NSL2SCOPT)

$(T)_sim.cpp:	$(T)_sim.sc
	cp $(T)_sim.sc $(T)_sim.cpp

$(T).v: $(T).nsl 
	nsl2vl $(T).nsl $(NSL2VLOPT)

$(T)_sim.vvp: $(T).v
	iverilog -o$(T)_sim.vvp $(T).v

vsim.log: $(T)_sim.vvp
	vvp ./$(T)_sim.vvp |tee vsim.log 


