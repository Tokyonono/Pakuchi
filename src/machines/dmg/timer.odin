package dmg

// Game Boy DMG timer and divider: four configurable clock rates,
// timer interrupt generation, and the DIV register.

Timer :: struct {
	div:  u16,
	tima: u8,
	tma:  u8,
	tac:  u8,
}

timer_make :: proc() -> Timer { unimplemented("") }

timer_reset :: proc(t: ^Timer) { unimplemented("") }

timer_step :: proc(t: ^Timer, cycles: u8, interrupts: ^Interrupts) { unimplemented("") }
