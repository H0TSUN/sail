default Order dec

$include <exception_basic.sail>
$include <flow.sail>
$include <vector_dec.sail>

function main (() : unit) -> unit = {
  assert(64^0x0 + 64^0x0 == 64^0x0);
  assert(64^0x0 + 64^0x1 == 64^0x1);
  assert(64^0x0 + 64^0x3000020 == 64^0x3000020);
  assert(64^0x0 + 64^0x3000058 == 64^0x3000058);
  assert(64^0x0 + 64^0x3000068 == 64^0x3000068);
  assert(64^0x0 + 64^0x30000c8 == 64^0x30000c8);
  assert(64^0x0 + 64^0x30002a0 == 64^0x30002a0);
  assert(64^0x0 + 64^0x3006b10 == 64^0x3006b10);
  assert(64^0x0 + 64^0x3808064 == 64^0x3808064);
  assert(64^0x0 + 64^0x3808068 == 64^0x3808068);
  assert(64^0x0 + 64^0x3808070 == 64^0x3808070);
  assert(64^0x0 + 64^0x3808078 == 64^0x3808078);
  assert(64^0x0 + 64^0x3808080 == 64^0x3808080);
  assert(64^0x0 + 64^0x3808140 == 64^0x3808140);
  assert(64^0x0 + 64^0x3808a04 == 64^0x3808a04);
  assert(64^0x0 + 64^0x3808a08 == 64^0x3808a08);
  assert(64^0x0 + 64^0x3808a10 == 64^0x3808a10);
  assert(64^0x0 + 64^0x3808a18 == 64^0x3808a18);
  assert(64^0x0 + 64^0x3808a20 == 64^0x3808a20);
  assert(64^0x0 + 64^0x3808a78 == 64^0x3808a78);
  assert(64^0x0 + 64^0x3808b78 == 64^0x3808b78);
  assert(64^0x0 + 64^0x3808b80 == 64^0x3808b80);
  assert(64^0x0 + 64^0x3815618 == 64^0x3815618);
  assert(64^0x0 + 64^0x3815624 == 64^0x3815624);
  assert(64^0x0 + 64^0x3815628 == 64^0x3815628);
  assert(64^0x1 + 64^0x1 == 64^0x2);
  assert(64^0x10 + 64^0x1 == 64^0x11);
  assert(64^0x100 + 64^0x1 == 64^0x101);
  assert(64^0x1000 + 64^0x1 == 64^0x1001);
  assert(64^0x10000 + 64^0x1 == 64^0x10001);
  assert(64^0x10000 + 64^0x12000 == 64^0x22000);
  assert(64^0x10000 + 64^0x380a000 == 64^0x381a000);
  assert(64^0x1000078 + 64^0x10 == 64^0x1000088);
  assert(64^0x1000080 + 64^0x10 == 64^0x1000090);
  assert(64^0x1000088 + 64^0x0 == 64^0x1000088);
  assert(64^0x1000090 + 64^0x4 == 64^0x1000094);
  assert(64^0x1000090 + 64^0xffffffffff023458 == 64^0x234e8);
  assert(64^0x1000094 + 64^0xc == 64^0x10000a0);
  assert(64^0x100009c + 64^0x10 == 64^0x10000ac);
  assert(64^0x100009c + 64^0xc == 64^0x10000a8);
  assert(64^0x10000a0 + 64^0x0 == 64^0x10000a0);
  assert(64^0x10000a8 + 64^0x10 == 64^0x10000b8);
  assert(64^0x10000b0 + 64^0x4 == 64^0x10000b4);
  assert(64^0x10000b0 + 64^0xffffffffff021770 == 64^0x21820);
  assert(64^0x10000b4 + 64^0xffffffffffffffec == 64^0x10000a0);
  assert(64^0x10000bc + 64^0x4 == 64^0x10000c0);
  assert(64^0x10000bc + 64^0xffffffffff021764 == 64^0x21820);
  assert(64^0x10000c0 + 64^0xffffffffffffffe0 == 64^0x10000a0);
  assert(64^0x10001 + 64^0x1 == 64^0x10002);
  assert(64^0x10056 + 64^0x1 == 64^0x10057);
  assert(64^0x10057 + 64^0x1 == 64^0x10058);
  assert(64^0x10058 + 64^0x1 == 64^0x10059);
  assert(64^0x10059 + 64^0x1 == 64^0x1005a);
  assert(64^0x1005a + 64^0x1 == 64^0x1005b);
  assert(64^0x1018c + 64^0x1 == 64^0x1018d);
  assert(64^0x14001d0 + 64^0xfffffffffffffffc == 64^0x14001cc);
  assert(64^0x14001dc + 64^0x8 == 64^0x14001e4);
  assert(64^0x14001f0 + 64^0x4 == 64^0x14001f4);
  assert(64^0x14001f0 + 64^0xfffffffffec217f0 == 64^0x219e0);
  assert(64^0x158f + 64^0x1 == 64^0x1590);
  assert(64^0x1bdf8 + 64^0xffffffffffffffe0 == 64^0x1bdd8);
  assert(64^0x1be + 64^0x1 == 64^0x1bf);
  assert(64^0x1c4cc + 64^0x4 == 64^0x1c4d0);
  assert(64^0x1c4cc + 64^0xffffffffffff9f54 == 64^0x16420);
  assert(64^0x1c4d + 64^0x1 == 64^0x1c4e);
  assert(64^0x1e180 + 64^0xffffffffffff8190 == 64^0x16310);
  assert(64^0x1e19 + 64^0x1 == 64^0x1e1a);
  assert(64^0x1e194 + 64^0xffffffffffffe88c == 64^0x1ca20);
  assert(64^0x21d8e + 64^0x1 == 64^0x21d8f);
  assert(64^0x22050 + 64^0xffffffffffffc680 == 64^0x1e6d0);
  assert(64^0x2206 + 64^0x1 == 64^0x2207);
  assert(64^0x2209 + 64^0x1 == 64^0x220a);
  assert(64^0x22090 + 64^0xffffffffffffd0a8 == 64^0x1f138);
  assert(64^0x220a + 64^0x1 == 64^0x220b);
  assert(64^0x220b + 64^0x1 == 64^0x220c);
  assert(64^0x220e + 64^0x1 == 64^0x220f);
  assert(64^0x220e0 + 64^0x10 == 64^0x220f0);
  assert(64^0x220e8 + 64^0xffffffffffffd0a8 == 64^0x1f190);
  assert(64^0x220f + 64^0x1 == 64^0x2210);
  assert(64^0x221 + 64^0x1 == 64^0x222);
  assert(64^0x2212 + 64^0x1 == 64^0x2213);
  assert(64^0x2b87 + 64^0x1 == 64^0x2b88);
  assert(64^0x2ccf + 64^0x1 == 64^0x2cd0);
  assert(64^0x2e01828 + 64^0x8 == 64^0x2e01830);
  assert(64^0x2f00ba0 + 64^0x8 == 64^0x2f00ba8);
  assert(64^0x2f00ba8 + 64^0x8 == 64^0x2f00bb0);
  assert(64^0x31d084c + 64^0x60 == 64^0x31d08ac);
  assert(64^0x31d0858 + 64^0x4 == 64^0x31d085c);
  assert(64^0x31d0858 + 64^0xfffffffffffffd1c == 64^0x31d0574);
  assert(64^0x31d085c + 64^0x4 == 64^0x31d0860);
  assert(64^0x31d085c + 64^0xfffffffffffffdf8 == 64^0x31d0654);
  assert(64^0x31d0860 + 64^0x4 == 64^0x31d0864);
  assert(64^0x31d0860 + 64^0xfffffffffffffd1c == 64^0x31d057c);
  assert(64^0x31d0874 + 64^0xfffffffffffffdcc == 64^0x31d0640);
  assert(64^0x31d08cc + 64^0x8c == 64^0x31d0958);
  assert(64^0x31d08f0 + 64^0x4 == 64^0x31d08f4);
  assert(64^0x31d08f4 + 64^0x8 == 64^0x31d08fc);
  assert(64^0x31d0950 + 64^0x4 == 64^0x31d0954);
  assert(64^0x31d095c + 64^0xffffffffffffff74 == 64^0x31d08d0);
  assert(64^0x31d09d4 + 64^0x8 == 64^0x31d09dc);
  assert(64^0x31d09f0 + 64^0x4 == 64^0x31d09f4);
  assert(64^0x3800440 + 64^0x8 == 64^0x3800448);
  assert(64^0x3800440 + 64^0xfffffffffffffff0 == 64^0x3800430);
  assert(64^0x3800450 + 64^0x0 == 64^0x3800450);
  assert(64^0x3800450 + 64^0x10 == 64^0x3800460);
  assert(64^0x3800450 + 64^0x8 == 64^0x3800458);
  assert(64^0x3800450 + 64^0xfffffffffffffff0 == 64^0x3800440);
  assert(64^0x3800460 + 64^0xfffffffffffffff0 == 64^0x3800450);
  assert(64^0x3801 + 64^0x1 == 64^0x3802);
  assert(64^0x3802 + 64^0x1 == 64^0x3803);
  assert(64^0x40a9 + 64^0x1 == 64^0x40aa);
  assert(64^0x6216008 + 64^0x3 == 64^0x621600b);
  assert(64^0x621600c + 64^0x0 == 64^0x621600c);
  assert(64^0x6643 + 64^0x1 == 64^0x6644);
  assert(64^0x8f + 64^0x1 == 64^0x90);
  assert(64^0x8f0 + 64^0x1 == 64^0x8f1);
  assert(64^0xc0c + 64^0x1 == 64^0xc0d);
  assert(64^0xc0c0 + 64^0x1 == 64^0xc0c1);
  assert(64^0xfffd + 64^0x1 == 64^0xfffe);
  assert(64^0xfffe + 64^0x1 == 64^0xffff);
  assert(64^0xffff + 64^0x1 == 64^0x10000);
}