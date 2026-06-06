# Pakuchi — Development Roadmap

This file tracks the development of Pakuchi from blank window to complete multi-system emulator.
Each phase ends with something that compiles and runs. Check off items as they are completed.

## Guiding Principles

- Never leave a broken state. Each phase ends with something that compiles and runs, even if it does very little.
- Test as you build. Blargg ROMs are the acceptance criteria for the DMG, not an afterthought.
- Architecture before speed. Correctness first, optimization never until something is too slow.
- One console at a time. The DMG must be complete before anything else is touched.

## Phase 0 — Foundation

**Goal: project compiles and opens a window.**

- [ ] Write build.sh and build.bat with correct Odin invocation and SDL3 linking
- [ ] Implement sdl3_renderer_make — open a 480x432 window (160x144 x 3)
- [ ] Implement sdl3_input_make and basic event pump — handle quit event
- [ ] Implement sdl3_audio_make — open audio device, silence output
- [ ] Implement frontend_make and frontend_run — bare main loop that polls input and presents a blank frame
- [ ] Implement config_default wired into main
- [ ] Verify: window opens, closes cleanly on quit, no crashes

> Exit criteria: odin build succeeds, window opens, ESC or window close exits cleanly.

## Phase 1 — Common Utilities

**Goal: the shared toolkit is implemented and self-tested.**

- [ ] Implement common/bits.odin — all bit helpers with correct bodies
- [ ] Implement common/math.odin — clamp and wrapping arithmetic
- [ ] Implement common/ringbuffer.odin — push/pop, wrap-around behaviour
- [ ] Implement common/savestate.odin — write/read round-trip for scalar types
- [ ] Write manual tests for each using common/testing.odin infrastructure
- [ ] Implement input/mapping.odin — Default_DMG_Mapping wired to real SDL3 scancodes
- [ ] Implement input/input.odin — input_state_update, button_pressed, button_held, button_released

> Exit criteria: all common utilities pass round-trip tests, input state correctly tracks button press/release across frames.

## Phase 2 — Cartridge Loading

**Goal: a ROM file loads and its header is parsed correctly.**

- [ ] Implement cartridge_parse_header — read title, type, ROM/RAM size, battery flag
- [ ] Implement rom_only_make and all rom_only_* procs — reads return correct ROM bytes
- [ ] Implement cartridge_load — factory that selects ROM-only for type 0x00, returns error for unknown types
- [ ] Wire cartridge loading into dmg_make — accept a file path in main.odin, read bytes, pass to cartridge
- [ ] Print parsed cartridge header to stdout on load (title, type, ROM size)

> Exit criteria: Tetris (ROM-only) loads and header prints correctly. Unknown MBC types print a clear error and exit.

## Phase 3 — CPU

**Goal: the LR35902 executes all instructions correctly.**
This is the largest and most critical phase. Split into sub-phases:

### Phase 3a — Core instruction set

- [ ] Implement cpu_reset — set registers to DMG boot state (A=0x01, F=0xB0, BC=0x0013, DE=0x00D8, HL=0x014D, SP=0xFFFE, PC=0x0100)
- [ ] Implement dmg_bus_read and dmg_bus_write — stub that returns 0xFF for unmapped, routes to ROM for cartridge range
- [ ] Implement all 8-bit load instructions
- [ ] Implement all 16-bit load instructions
- [ ] Implement ALU instructions — ADD, ADC, SUB, SBC, AND, OR, XOR, CP
- [ ] Implement INC, DEC (8-bit and 16-bit)
- [ ] Implement rotate and shift instructions (RLCA, RLA, RRCA, RRA, RLC, RL, RRC, RR, SLA, SRA, SRL, SWAP)
- [ ] Implement BIT, SET, RES (CB prefix)
- [ ] Implement jump instructions — JP, JR, CALL, RET, RETI
- [ ] Implement PUSH, POP
- [ ] Implement miscellaneous — NOP, HALT, STOP, DI, EI, DAA, CPL, SCF, CCF

### Phase 3b — Interrupts and timing

- [ ] Implement interrupts_request, interrupts_pending
- [ ] Implement interrupt dispatch in cpu_step — check IME, handle IE & IF, push PC, jump to vector
- [ ] Implement HALT bug — CPU reads next byte twice when HALT executed with IME=0 and pending interrupt
- [ ] Implement timer_step — DIV increment, TIMA increment at TAC rate, TIMA overflow triggers INT_TIMER

### Phase 3c — CPU validation

- [ ] Run Blargg cpu_instrs — all 11 subtests must pass
- [ ] Run Blargg instr_timing — instruction cycle counts must be correct
- [ ] Run Blargg interrupt_time — interrupt timing must be correct
- [ ] Run Blargg halt_bug — HALT bug behaviour must match hardware

> Exit criteria: all Blargg CPU test ROMs pass. No exceptions.

## Phase 4 — PPU

**Goal: games render correctly to the framebuffer.**

### Phase 4a — Basic rendering

- [ ] Implement LCDC, STAT, SCY, SCX, LY, LYC, WY, WX, BGP, OBP0, OBP1 register handling in bus
- [ ] Implement PPU mode state machine — OAM (80 dots) → Drawing (172 dots) → HBlank (204 dots) → VBlank (10 lines)
- [ ] Implement background tile rendering — tile map, tile data, scroll
- [ ] Implement window rendering
- [ ] Implement sprite rendering — 8x8 and 8x16 modes, priority, flip
- [ ] Implement VBlank interrupt — request INT_VBLANK at line 144
- [ ] Implement STAT interrupt — LYC=LY, mode 0/1/2 conditions
- [ ] Wire ppu_step into dmg_step — advance PPU by CPU cycles each step
- [ ] Wire dmg_get_framebuffer — return PPU framebuffer slice
- [ ] Wire framebuffer into sdl3_renderer_present_frame — upload to SDL3 streaming texture

### Phase 4b — PPU validation

- [ ] Run Blargg dmg_sound visual output — screen should show pass/fail per test
- [ ] Run Blargg oam_bug — OAM corruption behaviour
- [ ] Run acid2 / dmg-acid2 test ROM — comprehensive PPU accuracy test

> Exit criteria: dmg-acid2 passes. Tetris, Dr. Mario, and Kirby's Dream Land render correctly.

## Phase 5 — Joypad and First Playable

**Goal: a ROM is playable end to end.**

- [ ] Implement joypad_update — translate core.Input_Map to P1 register bits
- [ ] Implement joypad_read and joypad_write — correct P1 column select behaviour
- [ ] Implement INT_JOYPAD — request interrupt on button press
- [ ] Wire input_state_update into frontend_run main loop
- [ ] Wire joypad_update call into dmg_step
- [ ] Implement config_load and config_save — TOML or simple key=value format
- [ ] Add ROM path as command-line argument in main.odin

> Exit criteria: Tetris is fully playable. Pieces fall, rotate, lines clear, game over works.

## Phase 6 — APU

**Goal: games produce correct audio.**
The APU is intentionally last — it is the hardest subsystem and games are playable without it.

- [ ] Implement Channel 1 — square wave with frequency sweep and envelope
- [ ] Implement Channel 2 — square wave with envelope, no sweep
- [ ] Implement Channel 3 — wave channel, 4-bit samples from wave RAM
- [ ] Implement Channel 4 — noise channel with LFSR
- [ ] Implement frame sequencer — 512 Hz clock driving length, envelope, sweep units
- [ ] Implement NR50, NR51, NR52 — master volume, panning, audio enable
- [ ] Implement apu_step — advance all channels, push mixed samples to ring buffer
- [ ] Implement sdl3_audio_push_samples — drain ring buffer into SDL3 audio stream
- [ ] Tune sample rate conversion and buffer sizes to avoid crackling or drift
- [ ] Run Blargg dmg_sound — all 12 subtests must pass
- [ ] Run Blargg cgb_sound on DMG mode — partial pass expected

> Exit criteria: Tetris music plays correctly. Blargg dmg_sound passes all 12 tests.

## Phase 7 — MBC Support

**Goal: the majority of the DMG library is playable.**

- [ ] Implement MBC1 — ROM banking, RAM banking, mode 0/1
- [ ] Implement MBC2 — ROM banking, built-in 512x4-bit RAM
- [ ] Implement MBC3 — ROM banking, RAM banking, RTC registers
- [ ] Implement battery save — persist cartridge RAM to .sav file on exit, reload on start
- [ ] Test with: Link's Awakening (MBC1), Metroid II (MBC1), Pokemon Red (MBC3+RTC)

> Exit criteria: Pokemon Red boots, saves, and reloads correctly.

## Phase 8 — Save States

**Goal: save and restore full machine state.**

- [ ] Implement savestate_write and savestate_read in common/savestate.odin
- [ ] Implement dmg_save_state — serialise all CPU, PPU, APU, timer, joypad, interrupt, RAM state
- [ ] Implement dmg_load_state — deserialise and restore
- [ ] Wire save state to keyboard shortcut (e.g. F5 = save, F8 = load) in frontend_run
- [ ] Validate round-trip — save mid-game, load, verify game continues correctly

> Exit criteria: save state round-trip works in Tetris and Pokemon Red without corruption.

## Phase 9 — Debugger

**Goal: the built-in debugger is usable for development.**
This phase exists to support your own development of future consoles as much as it does end users.

- [ ] Implement debugger_render — CPU register overlay (A, F, B, C, D, E, H, L, SP, PC, IME)
- [ ] Add VRAM viewer — display tile data as a grid
- [ ] Add OAM viewer — list active sprites with position and flags
- [ ] Add basic disassembler — show current instruction and next N instructions
- [ ] Add memory viewer — read arbitrary bus addresses
- [ ] Wire debugger toggle to F1 in frontend_run
- [ ] Add step mode — pause execution, advance one instruction at a time with F10

> Exit criteria: debugger is usable for diagnosing rendering and CPU issues in DMG ROMs.

## Phase 10 — Polish and Hardening

**Goal: the DMG emulator is complete and solid.**

- [ ] Implement display_update — integer scale, stretch, and aspect-fit modes
- [ ] Implement fullscreen toggle
- [ ] Implement volume control and mute
- [ ] Implement sdl3_renderer_resize — handle window resize correctly
- [ ] Add frame limiter — lock to 59.73 Hz (DMG native)
- [ ] Add fast-forward — hold key to run at 2× or 4× speed
- [ ] Screenshot support — dump framebuffer to PNG on keypress
- [ ] Write README.md build instructions — exact Odin version, SDL3 install steps per platform
- [ ] Run full Blargg suite one final time — all tests must still pass
- [ ] Run dmg-acid2 one final time — must still pass

> Exit criteria: DMG emulation is feature-complete, accurate, and presentable. This is the v1.0 tag.

## Phase 11 — Game Boy Color (GBC)

**Goal: extend the DMG core to support GBC.**
This phase validates that the multi-console architecture works before committing to a completely new machine.

- [ ] Add GBC detection — check ROM header byte 0x0143
- [ ] Add double-speed mode — CPU runs at 8.39 MHz when armed
- [ ] Add GBC VRAM banking — two 8KB banks
- [ ] Add GBC palette registers — BCPS/BCPD, OCPS/OCPD
- [ ] Add GBC WRAM banking — 8 switchable 4KB banks
- [ ] Add HDMA — horizontal and general-purpose DMA
- [ ] Add MBC5 — required for most GBC games
- [ ] Test with: Pokemon Gold, The Legend of Zelda: Oracle of Ages

> Exit criteria: Pokemon Gold boots and is playable in colour.

## Beyond GBC

At this point the architecture has been proven across two machines. The roadmap for NES, SNES, PS1, and N64 follows the same phase pattern (cartridge to CPU to PPU to APU to input to MBC/mappers to save states) but each is its own project-within-a-project. Those roadmaps are best written when you reach them.

## Reference Materials to Bookmark Now

- [Pan Docs](https://gbdev.io/pandocs) — the definitive DMG/GBC reference
- [Game Boy CPU Manual](https://pastraiser.com/cpu/gameboy/gameboy_cpu.html)
- [Blargg test ROMs](https://gbdev.gg8.se/files/roms/blargg-gb-tests)
- [dmg-acid2](https://github.com/mattcurrie/dmg-acid2)
- [Ultimate Game Boy Talk](https://www.youtube.com/watch?v=HyzD8pNlpwI) — watch this before Phase 3
