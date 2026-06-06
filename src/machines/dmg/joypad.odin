package dmg

import core "../../core"

// Game Boy DMG joypad: reads button state from the emulated P1/JOYP
// register and translates directional/action-button presses.

Joypad :: struct {
	p1:      u8,
	buttons: [8]bool,
}

joypad_make :: proc() -> Joypad { unimplemented("") }

joypad_reset :: proc(j: ^Joypad) { unimplemented("") }

joypad_update :: proc(j: ^Joypad, input_map: core.Input_Map) { unimplemented("") }

joypad_read :: proc(j: ^Joypad) -> u8 { unimplemented("") }

joypad_write :: proc(j: ^Joypad, val: u8) { unimplemented("") }
