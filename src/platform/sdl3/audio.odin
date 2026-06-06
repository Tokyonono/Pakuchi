package sdl3

import sdl      "vendor:sdl3"
import platform ".."

// SDL3 audio output: device enumeration, stream configuration, and
// callback-based buffer submission. Implements the platform audio interface.

SDL3_Audio :: struct {
	// base must be first — allows cast to ^platform.Audio_Backend
	base:        platform.Audio_Backend,
	device_id:   sdl.AudioDeviceID,
	stream:      ^sdl.AudioStream,
	sample_rate: int,
	channels:    int,
	volume:      f32,
}

sdl3_audio_make :: proc(sample_rate: int, channels: int) -> ^SDL3_Audio { unimplemented("") }

sdl3_audio_init :: proc(a: ^platform.Audio_Backend, sample_rate: int, channels: int) -> bool { unimplemented("") }

sdl3_audio_push_samples :: proc(a: ^platform.Audio_Backend, samples: []f32) { unimplemented("") }

sdl3_audio_set_volume :: proc(a: ^platform.Audio_Backend, volume: f32) { unimplemented("") }

sdl3_audio_pause :: proc(a: ^platform.Audio_Backend, paused: bool) { unimplemented("") }

sdl3_audio_destroy :: proc(a: ^platform.Audio_Backend) {}
