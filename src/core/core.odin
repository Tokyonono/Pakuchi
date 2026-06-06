package core

// Emulator-core interface types that every machine must implement.
// No machine-specific logic lives here -- only contracts.
//
// Note: Odin standard library imports use the "core:*" syntax explicitly
// (e.g. import "core:fmt") to disambiguate from this package.

Button :: enum {
	A,
	B,
	Start,
	Select,
	Up,
	Down,
	Left,
	Right,
}

Input_Map :: struct {
	buttons: [Button]bool,
}

Machine :: struct {
	init:              proc(m: ^Machine, cart_data: []u8) -> bool,
	reset:             proc(m: ^Machine),
	step:              proc(m: ^Machine),
	get_framebuffer:   proc(m: ^Machine) -> []u32,
	get_audio_samples: proc(m: ^Machine) -> []f32,
	get_input_map:     proc(m: ^Machine) -> Input_Map,
	save_state:        proc(m: ^Machine) -> []u8,
	load_state:        proc(m: ^Machine, data: []u8) -> bool,
	destroy:           proc(m: ^Machine),
	userdata:          rawptr,
}
