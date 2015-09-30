SRC=comet.nsl system.nsl
TARGET=test01
VERI=system.v
VCD=system.vcd
VVP=a.out
CLEAN=system.v a.out system.vcd $(TARGET).hex comet.mem

all: $(VCD)
clean:
	-rm $(CLEAN)
$(TARGET).hex:	$(TARGET).cas
	python3 asm.py $(TARGET).cas
$(VERI): $(SRC)
	nsl2vl -verisim2 -target system system.nsl
$(VVP): $(VERI)
	iverilog system.v
$(VCD): $(VVP) $(TARGET).hex
	cp $(TARGET).hex comet.mem
	vvp a.out
wave: $(VCD)
	gtkwave system.vcd system.sig
