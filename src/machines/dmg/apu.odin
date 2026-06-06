package dmg

// Game Boy DMG audio processing unit: four sound channels (pulse 1 & 2,
// wave, noise) with sweep, envelope, and length counter.

APU :: struct {
	enabled:     bool,
	samples:     [dynamic]f32,
	ch1_enabled: bool,
	ch2_enabled: bool,
	ch3_enabled: bool,
	ch4_enabled: bool,
}

apu_make :: proc() -> APU { unimplemented("") }

apu_reset :: proc(a: ^APU) { unimplemented("") }

apu_step :: proc(a: ^APU, cycles: u8) { unimplemented("") }

apu_destroy :: proc(a: ^APU) {}
