package cartridge

import core "../../../core"

// ROM-only cartridge (MBC type 0x00). Simple linear 32 kB address space
// with no banking.

ROM_Only :: struct {
	// base must be first — allows cast to ^core.Cartridge
	base: core.Cartridge,
	rom:  []u8,
}

rom_only_make :: proc(data: []u8) -> ^ROM_Only { unimplemented("") }

rom_only_read :: proc(c: ^core.Cartridge, addr: u16) -> u8 { unimplemented("") }

rom_only_write :: proc(c: ^core.Cartridge, addr: u16, val: u8) {}

rom_only_reset :: proc(c: ^core.Cartridge) { unimplemented("") }

rom_only_has_battery :: proc(c: ^core.Cartridge) -> bool { return false }

rom_only_save_ram :: proc(c: ^core.Cartridge) -> []u8 { return nil }

rom_only_load_ram :: proc(c: ^core.Cartridge, data: []u8) {}

rom_only_destroy :: proc(c: ^core.Cartridge) {}
