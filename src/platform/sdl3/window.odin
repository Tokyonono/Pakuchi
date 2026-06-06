package sdl3

import sdl      "vendor:sdl3"
import platform ".."

// SDL3 window management: creation, resize, fullscreen, vsync, and the
// Vulkan surface (if used). Implements the platform window interface.

SDL3_Renderer :: struct {
	// base must be first — allows cast to ^platform.Renderer
	base:     platform.Renderer,
	window:   ^sdl.Window,
	renderer: ^sdl.Renderer,
	texture:  ^sdl.Texture,
	width:    int,
	height:   int,
}

sdl3_renderer_make :: proc(title: string, w, h: int) -> ^SDL3_Renderer { unimplemented("") }

sdl3_renderer_init :: proc(r: ^platform.Renderer, title: string, w, h: int) -> bool { unimplemented("") }

sdl3_renderer_present_frame :: proc(r: ^platform.Renderer, pixels: []u32, width, height: int) { unimplemented("") }

sdl3_renderer_begin_frame :: proc(r: ^platform.Renderer) { unimplemented("") }

sdl3_renderer_end_frame :: proc(r: ^platform.Renderer) { unimplemented("") }

sdl3_renderer_resize :: proc(r: ^platform.Renderer, w, h: int) { unimplemented("") }

sdl3_renderer_destroy :: proc(r: ^platform.Renderer) {}
