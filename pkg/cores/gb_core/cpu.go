package gb_core

import (
	"fmt"
)

type flag uint

const (
	z flag = 7
	n flag = 6
	h flag = 5
	c flag = 4
)

type gb_cpu struct {
	a, b, c, d, e, f, h, l uint8
	pc, sp                 uint16
}

// Sets the value of a flag
func (cpu *gb_cpu) setFlag(flag flag, value bool) {
	if value {
		cpu.f = setBit(cpu.f, uint(flag))
	} else {
		cpu.f = clearBit(cpu.f, uint(flag))
	}
}

// Gets the value of a flag
func (cpu *gb_cpu) getFlag(flag flag) bool {
	return hasBit(cpu.f, uint(flag))
}

// Sets the bit at pos in the integer n.
func setBit(n uint8, pos uint) uint8 {
	n |= (1 << pos)
	return n
}

// Clears the bit at pos in n.
func clearBit(n uint8, pos uint) uint8 {
	mask := ^(1 << pos)
	n &= uint8(mask)
	return n
}

// Checks if the bit at pos n is set.
func hasBit(n uint8, pos uint) bool {
	val := n & (1 << pos)
	return (val > 0)
}

func HelloWorld() {
	var cpu gb_cpu
	fmt.Printf("%v\n", cpu.getFlag(z))
	cpu.setFlag(z, true)
	fmt.Printf("%v\n", cpu.getFlag(z))
}
