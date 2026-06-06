package frontend

// Display surface: framebuffer scaling, colour conversion, and refresh
// coordination. Receives pixel data from the active machine and hands it to
// the platform for presentation.

Scale_Mode :: enum {
	Integer,
	Stretch,
	Aspect_Fit,
}

Display :: struct {
	mode:  Scale_Mode,
	src_w: int,
	src_h: int,
	dst_x: int,
	dst_y: int,
	dst_w: int,
	dst_h: int,
}

display_make :: proc(src_w, src_h: int, mode: Scale_Mode) -> Display { unimplemented("") }

display_update :: proc(d: ^Display, window_w, window_h: int) {}
