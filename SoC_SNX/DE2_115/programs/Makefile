###############################################################################
# Makefile for exercise in 17th PARTHENON Workshop
# (GNU make is required)
# Usage:
#      To compile all .sc files   : make
#      To compile .sc to .asm     : make <xxxx.hex>
#      To write .hex file to FPGA : make <xxxx.write>
#          The contents of xxx.hex is stored in instruction memory (imem)
#      To read .hex file from FPGA: make FILE=<xxx.hex> <xxx.hex>
#          The contents of data memory (dmem) is stored in xxx.hex
###############################################################################
# 2010-09-12 : Initial version by Y.Okuyama
###############################################################################
SNXCDIR		= ../../snx2013/snxc2
SNXASMDIR	= ../../snx2013/snxasm2
SNXC		= $(SNXCDIR)/snxc
SNXASM		= $(SNXASMDIR)/snxasm
INPUTS		= $(wildcard *.sc)
OUTPUTS		= $(INPUTS:.sc=.hex)
FILE=

all: $(OUTPUTS) $(SNXC) $(SNXASM)

tools: $(SNXC) $(SNXASM)
clean-tools:
	(cd $(SNXASMDIR); make clean)
	cd $(SNXCDIR); make clean
	-rm  $(SNXC) $(SNXASM)

$(SNXASM):
	cd $(SNXASMDIR); make

$(SNXC):
	cd $(SNXCDIR); make

$(FILE):
	quratus_stp -t ./mem_read dmem $(FILE)

download:
	cd ../rtl; make download
clean:
	rm -f *.asm *.hex *~

################################
# suffix rules
################################
.SUFFIXES:  .hex .asm .sc .write

.sc.asm:$(SNXC)
	$(SNXC) < $< | tee $@
.asm.hex:$(SNXASM)
	$(SNXASM) i < $< > $@
.hex.write:
	quartus_stp -t ./mem_write imem $<

