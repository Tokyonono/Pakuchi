package dmg

import core "../../core"

// DMG (original Game Boy) machine implementation. Wires CPU, PPU, APU,
// bus, timer, joypad and interrupts into a single runnable system.

DMG :: struct {
	// base must be first — allows cast to ^core.Machine
	base:        core.Machine,
	cpu:         CPU,
	ppu:         PPU,
	apu:         APU,
	bus:         DMG_Bus,
	timer:       Timer,
	joypad:      Joypad,
	interrupts:  Interrupts,
	cartridge:   core.Cartridge,
	cycles:      u64,
}

dmg_make :: proc(cart_data: []u8) -> ^DMG { unimplemented("") }

dmg_init :: proc(m: ^core.Machine, cart_data: []u8) -> bool { unimplemented("") }

dmg_reset :: proc(m: ^core.Machine) { unimplemented("") }

dmg_step :: proc(m: ^core.Machine) { unimplemented("") }

dmg_get_framebuffer :: proc(m: ^core.Machine) -> []u32 { unimplemented("") }

dmg_get_audio_samples :: proc(m: ^core.Machine) -> []f32 { unimplemented("") }

dmg_get_input_map :: proc(m: ^core.Machine) -> core.Input_Map { unimplemented("") }

dmg_save_state :: proc(m: ^core.Machine) -> []u8 { unimplemented("") }

dmg_load_state :: proc(m: ^core.Machine, data: []u8) -> bool { unimplemented("") }

dmg_destroy :: proc(m: ^core.Machine) {}
