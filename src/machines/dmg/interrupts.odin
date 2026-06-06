package dmg

// Game Boy DMG interrupt controller: manages IF, IE, and the five
// interrupt flags (VBlank, LCD STAT, Timer, Serial, Joypad).

INT_VBLANK :: 0x01
INT_STAT   :: 0x02
INT_TIMER  :: 0x04
INT_SERIAL :: 0x08
INT_JOYPAD :: 0x10

Interrupts :: struct {
	ie:  u8,
	if_: u8,
}

interrupts_make :: proc() -> Interrupts { unimplemented("") }

interrupts_reset :: proc(i: ^Interrupts) { unimplemented("") }

interrupts_request :: proc(i: ^Interrupts, mask: u8) { unimplemented("") }

interrupts_pending :: proc(i: ^Interrupts) -> bool { unimplemented("") }
