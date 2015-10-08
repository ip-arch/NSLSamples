NSL2VL=nsl2vl
NSL2VH=nsl2vh
VERILOG=iverilog
GTKWAVE=gtkwave
VVP=vvp
VASY=vasy
BOOG=boog
XSCH=xsch
BOARD=DE0_CV
loTARGET=$(shell echo $(TARGET) | tr A-Z a-z)

$(TARGET)/$(TARGET).v:	$(TARGET)/$(TARGET).nsl
	(cd $(TARGET); $(NSL2VL) $(TARGET).nsl -sim )

$(TARGET)/$(TARGET).vhdl:	$(TARGET)/$(TARGET).nsl
	(cd $(TARGET); $(NSL2VH) $(TARGET).nsl -binout -vasy -O2 )

$(TARGET)/$(TARGET).exe:	$(TARGET)/$(TARGET).v $(TARGET)/$(TARGET).main
	(cd $(TARGET); $(VERILOG) -o $(TARGET).exe $(TARGET).v $(SUBMOD) $(TARGET).main)

$(TARGET)/$(TARGET).vcd:	$(TARGET)/$(TARGET).exe
	make	TARGET=$(TARGET) sim

sim:	$(TARGET)/$(TARGET).exe
	(cd $(TARGET); $(VVP)	$(TARGET).exe)

$(TARGET)/$(loTARGET).xsc:	$(TARGET)/$(TARGET).vhdl
	(cd $(TARGET); \
	source /opt/alliance/etc/profile.d/alc_env.sh; \
	$(VASY) -o -a -p -I vhdl	$(TARGET) $(TARGET);\
	$(BOOG) $(loTARGET) $(loTARGET); \
	)

cir:	$(TARGET)/$(loTARGET).xsc
	(cd $(TARGET); \
	source /opt/alliance/etc/profile.d/alc_env.sh; \
	$(XSCH) -l $(loTARGET) \
	)

fpga:	$(TARGET)/synth/$(TARGET).sof

$(TARGET)/synth/$(TARGET).sof:	$(TARGET)/$(TARGET).nsl
	(cd $(TARGET); \
	make BOARD=$(BOARD) clean all; \
	)

download:	$(TARGET)/synth/$(TARGET).sof
	(cd $(TARGET); \
	make BOARD=$(BOARD) download; \
	)


wave:	$(TARGET)/$(TARGET).exe $(TARGET)/$(TARGET).vcd $(TARGET)/$(TARGET).sig
	(cd $(TARGET); $(GTKWAVE) $(TARGET).vcd $(TARGET).sig)

clean:
	-rm -f $(TARGET)/$(TARGET).exe \
	$(TARGET)/$(TARGET).vcd \
	$(TARGET)/$(TARGET).v \
	$(TARGET)/$(TARGET).vhdl \
	$(TARGET)/$(loTARGET).vbe \
	$(TARGET)/$(loTARGET).xsc \
	$(TARGET)/$(loTARGET).vst ;\
	(cd $(TARGET); \
	make clean; \
	)
