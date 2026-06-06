package sdl3

import sdl      "vendor:sdl3"
import platform ".."
import input    "../../input"
import core     "../../core"

// SDL3 input polling: keyboard, gamepad, and window events translated
// into the emulator's abstract input representation.

SDL3_Input :: struct {
	// base must be first — allows cast to ^platform.Input_Backend
	base:   platform.Input_Backend,
	events: [dynamic]input.Event,
}

sdl3_input_make :: proc() -> ^SDL3_Input { unimplemented("") }

sdl3_input_poll :: proc(i: ^platform.Input_Backend) -> []input.Event { unimplemented("") }

sdl3_input_get_button :: proc(i: ^platform.Input_Backend, btn: core.Button) -> bool { unimplemented("") }

sdl3_input_destroy :: proc(i: ^platform.Input_Backend) {}
