const std = @import("std");
const gameboy = @import("gameboy");

/// this represents the Registers (16 bit)
///
///
/// Hi -> first 8 bits ,
/// Low -> last 8 bits
///
///
/// AF -> Accumulator & flags
/// F -> flags
///
///
/// so these are basically 8 bit registers that are combined into 16 bit registers

// const MixedRegister = enum { AF, BC, DE, HL, SP, PC };

const Flags = enum(u8) {
    Z, // 7 , zero flag,
    N, // 6, Subtraction flag
    H, // 5, half carry flag
    C, // 4, carry flag
};

pub const reg_mem = struct {
    A: u8,
    // flags
    F: u8,
    // general purpose registers,
    BC: u16,
    DE: u16,
    HL: u16,

    // program counter
    PC: u16,
    // stack pointer
    SP: u16,
};

fn init_reg_mem() reg_mem {
    return .{
        .A = 0,
        .F = 0,
        .BC = 0,
        .DE = 0,
        .HL = 0,
        .PC = 0,
        .SP = 0,
    };
}

pub fn main() void {
    var regs = init_reg_mem();

    // 64 kb memory
    var mem: [65536]u8 = [_]u8{0} ** 65536;

    while (true) {
        const opcode = mem[regs.PC];
        regs.PC += 1;
        execute(opcode, &regs, &mem);
    }
}

fn execute(opcode: u8, regs: *reg_mem, mem: *[]u8) !void {
    switch (opcode) {
        0x7F => 
    }
}
