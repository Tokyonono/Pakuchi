package dmg

import core "../../core"

// DMG address-bus implementation: routes CPU reads/writes to the correct
// subsystem (cartridge, VRAM, WRAM, OAM, IO registers, HRAM).

DMG_Bus :: struct {
	// base must be first — allows cast to ^core.Bus
	base:        core.Bus,
	cartridge:   ^core.Cartridge,
	ppu:         ^PPU,
	apu:         ^APU,
	timer:       ^Timer,
	joypad:      ^Joypad,
	interrupts:  ^Interrupts,
	wram:        [0x2000]u8,
	hram:        [0x7F]u8,
}

dmg_bus_make :: proc() -> DMG_Bus { unimplemented("") }

dmg_bus_reset :: proc(b: ^DMG_Bus) { unimplemented("") }

dmg_bus_read :: proc(b: ^core.Bus, addr: u16) -> u8 { unimplemented("") }

dmg_bus_write :: proc(b: ^core.Bus, addr: u16, val: u8) { unimplemented("") }

dmg_bus_destroy :: proc(b: ^DMG_Bus) {}
