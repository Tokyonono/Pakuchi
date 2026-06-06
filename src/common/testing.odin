package common

import core "../core"

// Test helpers and assertions used by emulator test suites.
// Intentionally empty in production builds.
//
// This is the hook for Blargg and other test ROMs — the machine runs until
// a known stop condition and serial output is compared against expected.

Test_Result :: enum {
	Pass,
	Fail,
	Inconclusive,
}

ROM_Test :: struct {
	name:     string,
	rom_path: string,
	expected: string,
	result:   Test_Result,
	message:  string,
}

run_rom_test :: proc(t: ^ROM_Test, machine: ^core.Machine) -> Test_Result { unimplemented("") }

print_results :: proc(results: []ROM_Test) {}
