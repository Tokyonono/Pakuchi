package core

// Cartridge interface defining the contract between the emulator and any
// ROM-image / memory-bank controller implementation.

Cartridge :: struct {
	read:        proc(c: ^Cartridge, addr: u16) -> u8,
	write:       proc(c: ^Cartridge, addr: u16, val: u8),
	reset:       proc(c: ^Cartridge),
	has_battery: proc(c: ^Cartridge) -> bool,
	save_ram:    proc(c: ^Cartridge) -> []u8,
	load_ram:    proc(c: ^Cartridge, data: []u8),
	destroy:     proc(c: ^Cartridge),
	userdata:    rawptr,
}
