const main = @import("main.zig");
const mem_mod = @import("cpu/memory.zig");
const Memory = mem_mod.Memory;
// io module for our gameboy emulator

// LD A, B -> load what is in B into A
fn ld(dst: *u8, src: u8) void {
    dst.* = src;
}

// LD A, db
// immediate -> register
fn ld_imm_register(r: *main.reg_mem, mem: *Memory, dst: *u8) void {
    const value = mem[r.PC];
    r.PC += 1;
    dst.* = value;
}

fn ld_a_hl(r: *main.reg_mem, mem: *Memory) void {
    r.A = mem[r.HL];
}
