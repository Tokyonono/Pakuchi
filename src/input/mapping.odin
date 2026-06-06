package input

import core "../core"

// Input-mapping configuration: maps physical keys, gamepad buttons, and
// axes to emulated console inputs. Supports per-machine profiles.

Mapping :: struct {
	bindings:      map[u32]core.Button,
	pad_bindings:  map[u32]core.Button,
}

Default_DMG_Mapping :: proc() -> Mapping {
	return {
		bindings = {
			// SDL_SCANCODE_UP      = 82
			82  = .Up,
			// SDL_SCANCODE_DOWN    = 81
			81  = .Down,
			// SDL_SCANCODE_LEFT    = 80
			80  = .Left,
			// SDL_SCANCODE_RIGHT   = 79
			79  = .Right,
			// SDL_SCANCODE_Z       = 29
			29  = .A,
			// SDL_SCANCODE_X       = 27
			27  = .B,
			// SDL_SCANCODE_RETURN  = 40
			40  = .Start,
			// SDL_SCANCODE_RSHIFT  = 229
			229 = .Select,
		},
		pad_bindings = {},
	}
}

mapping_destroy :: proc(m: ^Mapping) {}
