const main = @import("../main.zig");

pub fn setZ(r: *main.reg_mem) void {
    r.F |= 1 << 7;
}

pub fn clearZ(r: *main.reg_mem) void {
    r.F &= ~(1 << 7);
}

pub fn setN(r: *main.reg_mem) void {
    r.F |= 1 << 6;
}

pub fn clearN(r: *main.reg_mem) void {
    r.F &= ~(1 << 6);
}

pub fn setH(r: *main.reg_mem) void {
    r.F |= 1 << 5;
}

pub fn clearH(r: *main.reg_mem) void {
    r.F &= ~(1 << 5);
}

pub fn setC(r: *main.reg_mem) void {
    r.F |= 1 << 4;
}

pub fn clearC(r: *main.reg_mem) void {
    r.F &= ~(1 << 4);
}

pub fn getC(r: *main.reg_mem) u8 {
    return @intFromBool((r.F & (1 << 4)) != 0);
}

pub fn reset(r: *main.reg_mem) void {
    r.F = 0;
}
