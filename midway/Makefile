# 
# midway: my80x processor and vga simulation environment
#    Naohiko Shimizu, IP ARCH, Inc. http://www.ip-arch.jp/
#
# This package requires: nsl2vl, Icarus Verilog, GTKWAVE
#

SIMDIR=.
NSLDIR=.

VERILOG=iverilog


export VERILATOR_ROOT=/usr/local/verilator
export SYSTEMPERL=/usr/local/systemperl
TARGET=midway
SIM=$(TARGET)_main
OBJDIR=./obj_dir
CLEANS=
NSL2VLOPT=
VERILATOR=verilator
# VERILATOR_OPT= --trace
VERILATOR_OPT=
CXXFLAGS="-g -O2 -funroll-loops"
GTKWAVE=gtkwave
FPGA=sp3kit

CLEAN=$(SIM).exe $(SIM).d $(SIM).o $(SIM) $(OBJDIR) $(TARGET).gif $(TARGET).pbm
CLEANS = $(CLEAN) $(TARGET).v $(TARGET).vcd $(TARGET) $(TARGET).log $(FPGA).v


all: $(TARGET).pbm

clean:
	-(cd $(SIMDIR); \
	rm $(CLEANS) \
	rm -f -r $(OBJDIR)) 

$(SIMDIR)/$(TARGET).v: $(NSLDIR)/$(TARGET).nsl
	(cd $(SIMDIR); \
	nsl2vl $(TARGET).nsl -O;)

$(SIMDIR)/$(TARGET): $(SIMDIR)/$(TARGET).v $(SIMDIR)/$(TARGET).main
	(cd $(SIMDIR); \
	iverilog -o $(TARGET) $(TARGET).v $(TARGET).main)

$(SIMDIR)/$(TARGET).log: $(SIMDIR)/$(TARGET)
	(cd $(SIMDIR); \
	vvp ./$(TARGET) |tee $(TARGET).log )

GTK:	$(TARGET).log
	(cd $(SIMDIR); \
	gtkwave $(TARGET).vcd $(TARGET).gtk )

$(TARGET).pbm: $(SIM)
	./$(SIM)

$(OBJDIR)/V$(TARGET).mk: $(SIMDIR)/$(TARGET).v
	$(VERILATOR) $(VERILATOR_OPT) --cc $(TARGET).v

$(SIM):	$(SIM).o $(OBJDIR)/V$(TARGET)__ALL.a
	(cd $(OBJDIR); g++ ../$(SIM).o V$(TARGET)__ALL.a -o ../$(SIM))

$(SIM).o:	$(SIM).cc $(OBJDIR)/V$(TARGET).mk
	(cd $(OBJDIR); make -f V$(TARGET).mk ../$(SIM).o CXXFLAGS=$(CXXFLAGS))

$(OBJDIR)/V$(TARGET)__ALL.a:	$(OBJDIR)/V$(TARGET).mk
	(cd $(OBJDIR); make -f V$(TARGET).mk CXXFLAGS=$(CXXFLAGS))


