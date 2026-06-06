package common

// Bit-level utilities: test/set/clear masks, bit-range extraction,
// and common bit-twiddling helpers used across all subsystems.

@(require_results)
bit_test_u8 :: proc(val: u8, n: u8) -> bool #force_inline { unimplemented("") }

@(require_results)
bit_test_u16 :: proc(val: u16, n: u8) -> bool #force_inline { unimplemented("") }

@(require_results)
bit_test_u32 :: proc(val: u32, n: u8) -> bool #force_inline { unimplemented("") }

bit_test :: proc { bit_test_u8, bit_test_u16, bit_test_u32 }

@(require_results)
bit_set_u8 :: proc(val: u8, n: u8) -> u8 #force_inline { unimplemented("") }

@(require_results)
bit_set_u16 :: proc(val: u16, n: u8) -> u16 #force_inline { unimplemented("") }

@(require_results)
bit_set_u32 :: proc(val: u32, n: u8) -> u32 #force_inline { unimplemented("") }

bit_set :: proc { bit_set_u8, bit_set_u16, bit_set_u32 }

@(require_results)
bit_clear_u8 :: proc(val: u8, n: u8) -> u8 #force_inline { unimplemented("") }

@(require_results)
bit_clear_u16 :: proc(val: u16, n: u8) -> u16 #force_inline { unimplemented("") }

@(require_results)
bit_clear_u32 :: proc(val: u32, n: u8) -> u32 #force_inline { unimplemented("") }

bit_clear :: proc { bit_clear_u8, bit_clear_u16, bit_clear_u32 }

@(require_results)
hi_byte :: proc(val: u16) -> u8 #force_inline { unimplemented("") }

@(require_results)
lo_byte :: proc(val: u16) -> u8 #force_inline { unimplemented("") }

@(require_results)
make_u16 :: proc(hi: u8, lo: u8) -> u16 #force_inline { unimplemented("") }
