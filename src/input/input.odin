package input

import core "../core"

// Abstract input state: button press / release events, dual-analog
// deadzone processing, and hotplug tracking. Platform-agnostic.

Event_Kind :: enum {
	Quit,
	Key_Down,
	Key_Up,
	Controller_Down,
	Controller_Up,
	Window_Resize,
}

Event :: struct {
	kind:    Event_Kind,
	keycode: u32,
	button:  u32,
	width:   i32,
	height:  i32,
}

Input_State :: struct {
	buttons: [core.Button]bool,
	prev:    [core.Button]bool,
}

input_state_make :: proc() -> Input_State { return {} }

input_state_update :: proc(state: ^Input_State, events: []Event, mapping: ^Mapping) {}

@(require_results)
button_pressed :: proc(state: ^Input_State, btn: core.Button) -> bool { unimplemented("") }

@(require_results)
button_held :: proc(state: ^Input_State, btn: core.Button) -> bool { unimplemented("") }

@(require_results)
button_released :: proc(state: ^Input_State, btn: core.Button) -> bool { unimplemented("") }
