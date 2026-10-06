elfpack_sources_perk11/ — full ElfPack + dynconst build sources
===============================================================

240 files, 4 333 263 B. The complete build trees from archive.perk11.info's SVN, with .svn
history stripped. This is where you go to rebuild ElfPack itself, or the dynamic-constant
table, from source.

    ElfPack/     the ElfPack loader itself
      ElfPack.ewp, ElfPack.eww     IAR Embedded Workbench project + workspace
      asm/                          the patch payloads, including
                                     Z550_R6CA009.asm and Z550_R6GA004.asm
      xcl/                          linker/load maps, including
                                     Z550_R6CA009.xcl and Z550_R6GA004.xcl
      Target/                       target definitions, including
                                     Z550_R6CA009.h and Z550_R6GA004.h
      dll.c, dll.h, elfloader.cpp, elfloader.h, InternalFunc.c, helper.c, helper.h,
      regfile.c, regfile.h, vars.c, vars.h, calls.asm, calls.h, swi.asm, prebuild.bat
    dynconst/   the DYN_CONST table builder
      dynconst.ewp, dynconst.eww, main.asm, x.inc-equivalent, target/, prebuild.bat
      readme.txt

THE Z550-SPECIFIC FILES
  Eight of them matter for this phone, across both trees:

    ElfPack/Target/Z550_R6CA009.h      ElfPack/xcl/Z550_R6CA009.xcl
    ElfPack/asm/Z550_R6CA009.asm       ElfPack/Target/Z550_R6GA004.h
    ElfPack/xcl/Z550_R6GA004.xcl       ElfPack/asm/Z550_R6GA004.asm
    dynconst/target/Z550_R6CA009.h     dynconst/target/Z550_R6GA004.h

  The first six are byte-identical to the copies in ../../elfpack/sources_perk11/ — verified
  at publication prep. Both locations are kept: those six sit closer to the flashing
  instructions and are easier to find, these are the full trees for when you want everything
  around them. The two dynconst/target headers have no copy at the top level and exist only
  here, so this directory is the only place they survive.

WHY THE R6GA004 SOURCES MATTER
  There is no main ElfPack .vkp for R6GA004 on any host and none in the Wayback Machine. The
  .h/.xcl/.asm for it are here. Re-pointing the addresses at an R6GA004 map is the hard part
  and is not possible from anything in this archive, because no R6GA004 binary was ever
  obtained. It is recorded here so the attempt is possible the moment anyone has one.

THE dynconst/target/ DIRECTORY IS THE INTERESTING PART
  53 target definitions, covering phones from C510 through W610 — C702, C901, K600, K660,
  K750, K770, K790, K800, K810, K850, T700, W200, W300, W550, W580, W595, W600 and more,
  plus both Z550i firmwares. That is how the author built per-model constant tables, and it
  is the reference for building a DYN_CONST for a model nobody has done yet.

  Note readme.txt in that directory is not documentation about the tool — it is a raw dump of
  EVENT-TO-CALLBACK mappings for one target. Useful if you are tracing why an elf fires the
  wrong handler, not useful as an introduction.

SEE ALSO
  ../../elfpack/README.txt for the flash order and what goes where on the phone.
  ../../elfpack/ZBin_template/ for the prebuilt DYN_CONST.bin you would otherwise have to
  compile.