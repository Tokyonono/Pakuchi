package core

// System-wide event scheduler interface. Machines register timed events
// (CPU steps, PPU scanlines, APU sample ticks) that the scheduler drives.
//
// Cycles are master clock cycles; each machine defines its own master
// clock frequency.

Event :: struct {
	id:       u32,
	callback: proc(s: ^Scheduler, event: ^Event),
	userdata: rawptr,
}

Scheduler :: struct {
	reset:    proc(s: ^Scheduler),
	tick:     proc(s: ^Scheduler, cycles: u64),
	schedule: proc(s: ^Scheduler, event: Event, cycles_from_now: u64),
	destroy:  proc(s: ^Scheduler),
	userdata: rawptr,
}
