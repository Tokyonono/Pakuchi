package config

// Configuration loading, storage, and command-line argument parsing.
// Provides a single source of truth for all user-configurable options.

Display_Config :: struct {
	scale:      int,
	fullscreen: bool,
	vsync:      bool,
}

Audio_Config :: struct {
	sample_rate: int,
	channels:    int,
	volume:      f32,
	muted:       bool,
}

Emulator_Config :: struct {
	display:   Display_Config,
	audio:     Audio_Config,
	rom_path:  string,
	save_dir:  string,
	state_dir: string,
	log_dir:   string,
}

config_default :: proc() -> Emulator_Config {
	return {
		display = {
			scale      = 2,
			fullscreen = false,
			vsync      = true,
		},
		audio = {
			sample_rate = 48000,
			channels    = 2,
			volume      = 1.0,
			muted       = false,
		},
		rom_path  = "",
		save_dir  = "saves",
		state_dir = "saves",
		log_dir   = "logs",
	}
}

config_load :: proc(path: string) -> (Emulator_Config, bool) { unimplemented("") }

config_save :: proc(cfg: ^Emulator_Config, path: string) -> bool { unimplemented("") }

config_destroy :: proc(cfg: ^Emulator_Config) {}
