package cartridge

import core "../../../core"

// Cartridge factory and common helpers. Selects the correct MBC
// implementation based on the cartridge header byte at $0147.

Cartridge_Header :: struct {
	title:       [16]u8,
	cart_type:   u8,
	rom_size:    u8,
	ram_size:    u8,
	has_battery: bool,
}

cartridge_load :: proc(data: []u8) -> (core.Cartridge, bool) { unimplemented("") }

cartridge_parse_header :: proc(data: []u8) -> (Cartridge_Header, bool) { unimplemented("") }
