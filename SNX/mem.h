declare ROM {
	input addr<16>;
	output out<16>;
	instrin read;
	instr_arg read(addr);
}

declare RAM {
	input addr<16>;
	output out<16>;
	input in<16>;
	instrin read,write;
	instr_arg read(addr);
	instr_arg write(addr,in);
}

