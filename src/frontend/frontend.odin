package frontend

import core     "../core"
import platform "../platform"
import input   "../input"
import config  "../config"

// Top-level frontend orchestrator. Manages the display window, debugger UI,
// and any overlay elements. Delegates platform calls through the platform
// abstraction layer.

Frontend :: struct {
	renderer: platform.Renderer,
	audio:    platform.Audio_Backend,
	input_be: platform.Input_Backend,
	input:    input.Input_State,
	mapping:  input.Mapping,
	machine:  core.Machine,
	config:   config.Emulator_Config,
	running:  bool,
	paused:   bool,
}

frontend_make :: proc(cfg: config.Emulator_Config) -> Frontend { unimplemented("") }

frontend_run :: proc(f: ^Frontend) {}

frontend_pause :: proc(f: ^Frontend) {}

frontend_resume :: proc(f: ^Frontend) {}

frontend_destroy :: proc(f: ^Frontend) {}
