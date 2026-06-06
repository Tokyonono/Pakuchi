package common

// Ring / circular buffer for audio sample transport between
// the APU and the audio backend.

Ring_Buffer :: struct {
	data:  []f32,
	head:  int,
	tail:  int,
	count: int,
	cap:   int,
}

ringbuffer_make :: proc(capacity: int) -> Ring_Buffer { unimplemented("") }

ringbuffer_destroy :: proc(rb: ^Ring_Buffer) {}

ringbuffer_push :: proc(rb: ^Ring_Buffer, sample: f32) { unimplemented("") }

@(require_results)
ringbuffer_pop :: proc(rb: ^Ring_Buffer) -> (f32, bool) { unimplemented("") }

@(require_results)
ringbuffer_len :: proc(rb: ^Ring_Buffer) -> int { unimplemented("") }

@(require_results)
ringbuffer_is_full :: proc(rb: ^Ring_Buffer) -> bool { unimplemented("") }
