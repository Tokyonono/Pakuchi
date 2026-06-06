package platform

import core "../core"

// Abstract platform interface that the rest of the emulator consumes.
// No SDL3 types leak into consumers of this package.

Renderer :: struct {
	init:          proc(r: ^Renderer, title: string, w, h: int) -> bool,
	present_frame: proc(r: ^Renderer, pixels: []u32, width, height: int),
	begin_frame:   proc(r: ^Renderer),
	end_frame:     proc(r: ^Renderer),
	resize:        proc(r: ^Renderer, w, h: int),
	destroy:       proc(r: ^Renderer),
	userdata:      rawptr,
}

Audio_Backend :: struct {
	init:         proc(a: ^Audio_Backend, sample_rate: int, channels: int) -> bool,
	push_samples: proc(a: ^Audio_Backend, samples: []f32),
	set_volume:   proc(a: ^Audio_Backend, volume: f32),
	pause:        proc(a: ^Audio_Backend, paused: bool),
	destroy:      proc(a: ^Audio_Backend),
	userdata:     rawptr,
}

Input_Backend :: struct {
	poll:       proc(i: ^Input_Backend) -> []core.Event,
	get_button: proc(i: ^Input_Backend, btn: core.Button) -> bool,
	destroy:    proc(i: ^Input_Backend),
	userdata:   rawptr,
}
