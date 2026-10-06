elfpack_id5/ — a second, independent ElfPack build for R6CA009
==============================================================

    z550_r6ca009_ElfPack_sezone-id5.zip   16 230 B   the archive exactly as se-zone served it
    Z550_R6CA009.sezone-build.vkp          52 359 B   extracted ElfPack vkp
    DYN_CONST.sezone.bin                    2 716 B   extracted DYN_CONST variant

WHAT THIS IS
  A second, independent build of the SAME ElfPack as ../../../Z550_R6CA009.vkp. Verified: the
  header is identical (`;Z550_R6CA009`, `;ELFPack v1.999 (c) Hussein`, `;SWI_Hook (c)
  Rst7/CBSIE`, `;ElfLoader (c)2007 by Rst7/CBSIE, BoBa, Kren`) and it patches the SAME four
  offsets — 4418449C, 44558AF0, 44B9A204, 4510D974 — with different replacement bytes, e.g.
  `04F01FE5 5C976B45` here against `04F01FE5 A0976B45` in the archive.org copy.

  So it is an earlier or differently-built variant of the same ElfPack, not a different
  target. Useful as a fallback if the archive.org one misbehaves.

  Pair it with DYN_CONST.sezone.bin, which is the matching DYN_CONST build (2 716 B against
  the 2 720 B copy in ../../../ZBin_template/Config/). Same story: different build of the
  same table.

LibraryDLL.dll
  Also inside the original zip, 5 392 B — byte-identical to
  ../../../ZBin_template/DLL/LibraryDLL.dll, so it was not duplicated here.

FLASH ORDER
  This is a REPLACEMENT for the main ElfPack step, not an addition to it. Do not flash both
  vkp files on top of each other:
  1. Flash Z550_R6CA009.sezone-build.vkp as the main ElfPack, in bflash.
  2. Then flash ONE library .vkp separately (../libraries/ has two builds).
  3. DYN_CONST.sezone.bin -> ZBin/Config/DYN_CONST.bin on the phone.
  4. LibraryDLL.dll -> ZBin/DLL/ (same file as the template copy).
  5. Reboot. .elf files -> ZBin/Daemons/.