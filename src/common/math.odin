package common

// Console-agnostic math helpers: fixed-point arithmetic, look-up tables,
// interpolation, and geometry utilities.
//
// Do not import core:math here unless strictly needed — keep this file
// dependency-free.

@(require_results)
clamp_u8 :: proc(val: int) -> u8 #force_inline { unimplemented("") }

@(require_results)
clamp_i8 :: proc(val: int) -> i8 #force_inline { unimplemented("") }

@(require_results)
wrapping_add_u8 :: proc(a, b: u8) -> u8 #force_inline { unimplemented("") }

@(require_results)
wrapping_sub_u8 :: proc(a, b: u8) -> u8 #force_inline { unimplemented("") }
