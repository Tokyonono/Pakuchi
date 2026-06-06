package core

// Address-bus interface that decouples CPU memory accesses from the
// underlying memory map. Each machine provides its own bus implementation.
//
// Note: address space is u16 for DMG/NES class machines; this will
// be revisited for 32-bit address space machines (SNES, PS1).

Bus :: struct {
	read:     proc(b: ^Bus, addr: u16) -> u8,
	write:    proc(b: ^Bus, addr: u16, val: u8),
	reset:    proc(b: ^Bus),
	destroy:  proc(b: ^Bus),
	userdata: rawptr,
}
