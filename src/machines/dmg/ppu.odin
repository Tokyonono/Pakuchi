package dmg

// Game Boy DMG picture processing unit: tile rendering, window/background
// layers, sprite evaluation, and LCD timing.

PPU_Mode :: enum u8 {
	HBlank  = 0,
	VBlank  = 1,
	OAM     = 2,
	Drawing = 3,
}

PPU :: struct {
	mode:        PPU_Mode,
	scanline:    u8,
	dots:        u16,
	framebuffer: [160 * 144]u32,
	vram:        [0x2000]u8,
	oam:         [0xA0]u8,
}

ppu_make :: proc() -> PPU { unimplemented("") }

ppu_reset :: proc(p: ^PPU) { unimplemented("") }

ppu_step :: proc(p: ^PPU, cycles: u8) { unimplemented("") }
