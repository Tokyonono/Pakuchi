package main

import "core:fmt"
import "core:os"
import config   "./config"
import frontend "./frontend"
import platform "./platform"
import sdl3     "./platform/sdl3"

// Entry point and system initialisation.
// Owns the top-level run loop, wires emulator, platform, and frontend together.

main :: proc() {
	fmt.println("Pakuchi \u2014 Game Boy emulator")

	cfg := config.config_default()

	renderer := sdl3.sdl3_renderer_make("Pakuchi", 160 * 3, 144 * 3)
	if renderer == nil {
		fmt.println("ERROR: failed to create SDL3 renderer")
		os.exit(1)
	}

	audio := sdl3.sdl3_audio_make(cfg.audio.sample_rate, cfg.audio.channels)
	if audio == nil {
		fmt.println("ERROR: failed to create SDL3 audio")
		os.exit(1)
	}

	input_be := sdl3.sdl3_input_make()
	if input_be == nil {
		fmt.println("ERROR: failed to create SDL3 input")
		os.exit(1)
	}

	f := frontend.frontend_make(cfg)
	frontend.frontend_run(&f)
	frontend.frontend_destroy(&f)
}
