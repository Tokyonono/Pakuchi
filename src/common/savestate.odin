package common

import "core:mem"

// Save-state serialisation: common serialiser / deserialiser interface
// that each machine component implements to persist and restore state.
//
// savestate_write and savestate_read are intended to be used with simple
// value types only — no pointers, no slices, no proc fields.

Save_State :: struct {
	data:   []u8,
	cursor: int,
}

savestate_make :: proc(capacity: int) -> Save_State { unimplemented("") }

savestate_destroy :: proc(s: ^Save_State) {}

savestate_write :: proc(s: ^Save_State, val: $T) { unimplemented("") }

savestate_read :: proc(s: ^Save_State, val: ^$T) { unimplemented("") }

savestate_reset :: proc(s: ^Save_State) {}
