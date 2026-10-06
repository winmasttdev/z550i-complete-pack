elfpack/ — ElfPack, Library patches, DYN_CONST and the recovered ELF binaries
==========================================================================

WHAT IS HERE
  Z550_R6CA009.vkp                          52 703 B  the main ElfPack for R6CA009
  z550_r6ca009.lib.vkp                      60 979 B  Library patch, R6CA009 (perk11 SVN)
  z550_r6ca009.lib.vkp.archiveorg-2024-02-22 63 051 B  a NEWER build of the same library
  z550_r6ga004.lib.vkp                      60 971 B  Library patch, R6GA004
  ZBin_template/                             the on-phone folder skeleton
  sources_perk11/                            ElfPack build sources for both firmwares
  wayback/                                   se-zone.ru builds + 15 real .elf binaries

MAIN ELFPACK HEADER
  ;Z550_R6CA009
  ;ELFPack v1.999 (c) Hussein
  ;SWI_Hook (c) Rst7/CBSIE
  ;ElfLoader (c)2007 by Rst7/CBSIE, BoBa, Kren

THE THREE LIBRARY BUILDS — WHY ALL THREE ARE KEPT
  Three different builds of the R6CA009 library patch exist, 60 979 / 61 699 / 63 051 B.
  They are not redundant; the newer builds resolve more function addresses. If one leaves
  your elves with missing calls, try another. This is exactly why all three are here.
  See wayback/libraries/README.txt.

FLASH ORDER — THIS ONE MATTERS
  1. Flash the MAIN ElfPack vkp (Z550_R6CA009.vkp) in bflash. Nothing works before this.
  2. Flash the LIBRARY vkp (z550_r6ca009.lib.vkp) separately, afterwards. Never before the
     main one. This ordering is not advisory.
  3. Reboot, or reseat the battery.
  4. On the phone, create Others/ZBin/ with subfolders Config/, DLL/, Daemons/.
  5. ZBin_template/Config/DYN_CONST.bin  ->  ZBin/Config/DYN_CONST.bin
     ZBin_template/DLL/LibraryDLL.dll    ->  ZBin/DLL/LibraryDLL.dll
  6. .elf files -> ZBin/Daemons/ to auto-start at boot, or launch them from the file manager.

  The Z550i has no memory card, so Daemons/ on internal storage is correct here. Phones
  with external storage need Daemons/ on the card.
  Documented procedure: https://operationse.github.io/elfpack.html, mirrored at
  ../tools/docs/operationse_elfpack.html

ZBin_template/
  Config/DYN_CONST.bin   2 720 B  the dynamic-constant table
  DLL/LibraryDLL.dll     5 392 B  the Library bridge
  Daemons/               empty, for startup ELF daemons
  This is a reference skeleton, not something you flash. Copy the two files onto the phone.

sources_perk11/
  ElfPack build sources for R6CA009 and R6GA004 ({.h, .xcl, .asm}). These are how you would
  build a main ElfPack vkp for R6GA004, which does not exist on any host. Full ElfPack +
  dynconst trees, .svn history stripped, are in ../tools/elfpack_sources_perk11/.

wayback/
  Recovered from web.archive.org. The live se-zone.ru elfs/ download handler 302s to /, but
  the real bytes were being served from flat unlinked paths that the Wayback Machine did
  capture. Contents:
    libraries/      2 more Library builds, one per firmware
    elfpack_id5/    a second independent build of the same ElfPack + a DYN_CONST variant
    elfs/           15 verified ARM 32-bit Z550i .elf binaries — the first copies of these
                    obtainable from anywhere
  See wayback/README.txt. Timestamps for every file are in ../patches/wayback/WAYBACK_MANIFEST.tsv

STILL MISSING
  There is no main ElfPack .vkp for R6GA004 anywhere — not on any live host, not in the
  Wayback Machine. Only its .lib.vkp (two builds), its build sources, and the 12 recovered
  R6GA004 patches. Build one from sources_perk11/Z550_R6GA004.{h,xcl,asm} if you need it.

  16 of the 30 catalogued Z550i elves (ids 71-85 and 88) were never archived under any URL
  form and are permanently lost. The full 162-name catalogue is in
  ../tools/docs/sezone_ELF_names_catalogue.txt.