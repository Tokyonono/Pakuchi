package frontend

import core     "../core"
import platform "../platform"

// Optional debugger UI: disassembly view, register state, memory editor,
// breakpoint management, and trace logging.

Debugger :: struct {
	enabled:   bool,
	show_cpu:  bool,
	show_vram: bool,
	show_oam:  bool,
	show_log:  bool,
}

debugger_make :: proc() -> Debugger { return {} }

debugger_toggle :: proc(d: ^Debugger) {}

debugger_render :: proc(d: ^Debugger, machine: ^core.Machine, renderer: ^platform.Renderer) {}

debugger_destroy :: proc(d: ^Debugger) {}
