// Let's write the alu for this processor
const main = @import("../main.zig");
const flag = @import("flag_utils.zig");

pub fn add(r: *main.reg_mem, val: u8) void {
    const a = r.A;
    const result: u16 = @as(u16, a) + val;

    r.A = @truncate(result);

    flag.reset(r);

    if (r.A == 0) flag.setZ(r);
    if (result > 0xFF) flag.setC(r);
    if (((a & 0xF) + (val & 0xF)) > 0xF) flag.setH(r);
}

pub fn sub(r: *main.reg_mem, val: u8) void {
    const a = r.A;
    const result: i16 = @as(i16, a) - val;

    r.A = @truncate(result);

    flag.reset(r);
    flag.setN(r);

    if (r.A == 0) flag.setZ(r);
    if (result < 0) flag.setC(r);
    if ((a & 0xF) < (val & 0xF)) flag.setH(r);
}

pub fn adc(r: *main.reg_mem, val: u8) void {
    const a = r.A;
    const c: u8 = flag.getC(r);

    const result: u16 = @as(u16, a) + val + c;

    r.A = @truncate(result);

    flag.reset(r);

    if (r.A == 0) flag.setZ(r);
    if (result > 0xFF) flag.setC(r);
    if (((a & 0xF) + (val & 0xF) + c) > 0xF) flag.setH(r);
}

pub fn sbc(r: *main.reg_mem, val: u8) void {
    const a = r.A;
    const c: u8 = flag.getC(r);

    const result: i16 = @as(i16, a) - val - c;

    r.A = @truncate(result);

    flag.reset(r);
    flag.setN(r);

    if (r.A == 0) flag.setZ(r);
    if (result < 0) flag.setC(r);
    if ((a & 0xF) < ((val & 0xF) + c)) flag.setH(r);
}

pub fn and_(r: *main.reg_mem, val: u8) void {
    r.A &= val;

    flag.reset(r);

    if (r.A == 0) flag.setZ(r);
    flag.setH(r); // always
}

pub fn xor_(r: *main.reg_mem, val: u8) void {
    r.A ^= val;

    flag.reset(r);

    if (r.A == 0) flag.setZ(r);
}

pub fn or_(r: *main.reg_mem, val: u8) void {
    r.A |= val;

    flag.reset(r);

    if (r.A == 0) flag.setZ(r);
}
