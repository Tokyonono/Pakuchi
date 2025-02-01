package gb_core

import rl "github.com/gen2brain/raylib-go/raylib"

/*
* Components
* CPU
* Cartridge
* Address bus
* Picture Processing Unit (PPU)
* Timer
 */

type context struct {
	paused  bool
	running bool
	ticks   uint64
}

func Run(rom_path string) {
	//var ctx context
	rl.InitWindow(800, 450, "raylib [core] example - basic window")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()

		rl.ClearBackground(rl.RayWhite)
		rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LightGray)

		rl.EndDrawing()
	}
}
