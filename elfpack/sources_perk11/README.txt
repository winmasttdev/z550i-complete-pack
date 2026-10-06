sources_perk11/ — ElfPack build sources, both firmwares
======================================================

Six files, 13 369 B. These are the sources you need to BUILD an ElfPack main .vkp.

    Z550_R6CA009.h    .xcl    .asm
    Z550_R6GA004.h    .xcl    .asm

WHY THIS MATTERS
  There is no main ElfPack .vkp for R6GA004 on any reachable host, and none in the Wayback
  Machine. These are the sources for it. If you ever obtain R6GA004 firmware, or extract it
  from a dump, you can build the missing ElfPack from here rather than searching for it.

  `.h` is the target definition, `.xcl` the linker/load map, `.asm` the patch payload.

SCOPE
  These 6 files are the Z550-only subset. They are byte-identical to the corresponding files
  in ../../tools/elfpack_sources_perk11/ElfPack/{Target,xcl,asm}/, which is the full
  ElfPack + dynconst source tree with .svn history stripped (4 333 263 B, 240 files).

  Both locations are kept: this one is short and obvious to find from ../../README.txt, the
  tools/ one sits with the rest of the build tree. They are not two different things, and
  they are not in conflict.

BUILD ORDER IF YOU EVER DO
  1. Take the R6CA009 sources as your starting point; they are the ones known to have built
     a working ElfPack.
  2. Re-point the addresses in the .xcl at R6GA004. This is the hard part and it is why
     nobody had done this: R6GA004's map is not published here, because no R6GA004 binary
     was ever obtained.
  3. Build the vkp, then flash main vkp -> library vkp, in that order.

SEE ALSO
  ../../README.txt for the flash order and what goes where on the phone.
  ../../wayback/README.txt for the se-zone.ru builds of the same ElfPack.