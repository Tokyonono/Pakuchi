package dmg

// LR35902 (Sharp SM83) CPU core: instruction decoder, register file,
// ALU, and interrupt handling for the Game Boy DMG.

Registers :: struct {
	a:  u8,
	f:  u8,
	b:  u8,
	c:  u8,
	d:  u8,
	e:  u8,
	h:  u8,
	l:  u8,
	sp: u16,
	pc: u16,
}

FLAG_Z :: 0x80
FLAG_N :: 0x40
FLAG_H :: 0x20
FLAG_C :: 0x10

CPU :: struct {
	regs:   Registers,
	halted: bool,
	ime:    bool,
	cycles: u64,
}

cpu_make :: proc() -> CPU { unimplemented("") }

cpu_reset :: proc(c: ^CPU) { unimplemented("") }

cpu_step :: proc(c: ^CPU, bus: ^DMG_Bus) -> u8 { unimplemented("") }
